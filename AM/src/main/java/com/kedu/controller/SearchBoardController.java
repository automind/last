package com.kedu.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.domain.BoardVo;
import com.kedu.domain.PageMaker;
import com.kedu.domain.SearchCriteria;
import com.kedu.service.BoardService;
import com.kedu.util.MediaUtils;
import com.kedu.util.UploadFileUtils;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {
	private static final Logger logger = 
			LoggerFactory.getLogger(SearchBoardController.class);
	
	@Inject
	private BoardService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception{
		logger.info(cri.toString());
//		model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
//		pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker",pageMaker);
	}
	
	@RequestMapping(value="/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri")SearchCriteria cri, Model model)throws Exception{
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr)throws Exception{
		
		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/sboard/list";
	}
	
	@RequestMapping(value="/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception{
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(BoardVo board, SearchCriteria cri, RedirectAttributes rttr)throws Exception{
		
		logger.info(cri.toString());
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("bno", board.getBno());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/sboard/readPage";
		
	}
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void registGET()throws Exception{
		logger.info("regist get ...........");
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String registPOST(BoardVo board, RedirectAttributes rttr)throws Exception{
		logger.info("regist post ...........");
		logger.info(board.toString());
		
		service.regist(board);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/sboard/list";
	}
	
	@RequestMapping(value="/uploadForm", method = RequestMethod.GET)
	public void uploadForm() throws Exception{
		
	}
	
	@RequestMapping(value="/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception{
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
		
		return "uploadResult";
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_" + originalName;
		
		File target = new File(uploadPath, savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	@RequestMapping(value="/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax(){
		
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax", method = RequestMethod.POST, produces= "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath
															   , file.getOriginalFilename()
															   , file.getBytes())
															   , HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("File Name : " + fileName);
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName);
			
			if(mType != null){
				headers.setContentType(mType);
			}else{
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition"
							, "attachment); filename=\"" + new String(fileName.getBytes("UTF-8")
							, "ISO-8859-1") + "\"");
			}
			
			entity = new ResponseEntity<byte[]>	(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		
		logger.info("delete file : " + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null){
			String front = fileName.substring(0,12);
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}
		
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping("/getAttach/{bno}")
	public List<String> getAttach(@PathVariable("bno")Integer bno)throws Exception{
		return service.getAttach(bno);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteAllFiles", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
		logger.info("delete all files: " + files);
		
		if(files == null || files.length == 0){
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName : files){
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null){
				String front = fileName.substring(0,12);
				String end = fileName.substring(14);
				
				new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
			}
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("delete",HttpStatus.OK);
	}
}
