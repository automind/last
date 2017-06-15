package com.kedu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.domain.BoardVo;
import com.kedu.domain.Criteria;
import com.kedu.domain.SearchCriteria;
import com.kedu.persistence.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDao dao;
	
	@Transactional
	@Override
	public void regist(BoardVo board) throws Exception {
		dao.create(board);
		
		String[] files = board.getFiles();
		
		if(files == null){return;}
		
		for(String fileName : files){
			dao.addAttach(fileName);
		}
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVo read(Integer bno) throws Exception {
		dao.updateViewCnt(bno);
		return dao.read(bno);
	}
	
	@Transactional
	@Override
	public void modify(BoardVo board) throws Exception {
		
		dao.update(board);

		Integer bno = board.getBno();
		
		dao.deleteAttach(bno);
		
		String[] files = board.getFiles();
		
		if(files == null){return;}
		
		for(String fileName : files){
			dao.replaceAttach(fileName, bno);
		}
	}
	
	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {
		dao.deleteAttach(bno);
		dao.delete(bno);
	}

	@Override
	public List<BoardVo> listAll() throws Exception {
		return dao.listAll();
	}
	
	@Override
	public List<BoardVo> listCriteria(Criteria cri) throws Exception{
		return dao.listCriteria(cri);
	}
	
	@Override
	public int listCountCriteria(Criteria cri) throws Exception{
		return dao.countPaging(cri);
	}
	
	@Override
	public List<BoardVo> listSearchCriteria(SearchCriteria cri) throws Exception{
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception{
		return dao.listSearchCount(cri);
	}
	
	
	@Override
	public List<String> getAttach(Integer bno) throws Exception{
		return dao.getAttach(bno);
	}
}
