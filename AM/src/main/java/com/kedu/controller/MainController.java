package com.kedu.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.domain.ContactDto;
import com.kedu.domain.PopupDto;
import com.kedu.service.ContactService;
import com.kedu.service.PopupService;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	ContactService service;
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		return "/main/index";
	}
	
	@RequestMapping(value="/company", method = RequestMethod.GET)
	public String company(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		return "/main/company";
	}
	
	@RequestMapping(value="/techIntro", method = RequestMethod.GET)
	public String techIntro(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		return "/main/techIntro";
	}
	
	@RequestMapping(value="/sellInfo", method = RequestMethod.GET)
	public String sellInfo(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		return "/main/sellInfo";
	}
	
	@RequestMapping(value="/sellInfo/popup", method = RequestMethod.GET)
	public String sellPopup(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		return "/main/sellPopup";
	}
	
	@Inject
	PopupService pService;
	@RequestMapping(value="/sellInfo/popup", method = RequestMethod.POST)
	public String sellInfoPopup(HttpServletRequest request, RedirectAttributes rttr)throws Exception{
			
			PopupDto pDto = new PopupDto();
			
			pDto.setNm(request.getParameter("nm"));
			
			String hpf = request.getParameter("hpf");
			String hps = request.getParameter("hps");
			String hpt = request.getParameter("hpt");
			
			pDto.setHp(hpf+"-"+hps+"-"+hpt);
			pDto.setModel(request.getParameter("model"));
			
			String dt_yy = request.getParameter("dt_yy");
			String dt_mm = request.getParameter("dt_mm");
			String dt_dd = "";
			if(request.getParameter("dt_dd").length()==1){
				dt_dd = "0" + request.getParameter("dt_dd");
			}else{
				dt_dd = request.getParameter("dt_dd");
			}
			pDto.setDt(dt_yy+dt_mm+dt_dd);
			pDto.setRvTime(request.getParameter("rvTime"));
			logger.info(pDto.toString());
			
			pService.regist(pDto);
			
			rttr.addFlashAttribute("message", "SUCCESS");
			
		return "redirect:/main/sellInfo/popup";
	}
	
	@RequestMapping(value="/contact", method = RequestMethod.GET)
	public String contact(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		return "/main/contact";
	}
	
	@RequestMapping(value="/contact/send", method = RequestMethod.POST)
	public String send(ContactDto cDto, RedirectAttributes rttr)throws Exception{

		logger.info(cDto.toString());
		
		service.send(cDto);
		
		rttr.addFlashAttribute("message", "SUCCESS");
		
		return "redirect:/main/contact";
	}
}
