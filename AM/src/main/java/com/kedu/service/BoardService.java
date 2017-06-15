package com.kedu.service;

import java.util.List;

import com.kedu.domain.BoardVo;
import com.kedu.domain.Criteria;
import com.kedu.domain.SearchCriteria;


public interface BoardService {
	
	public void regist(BoardVo board) throws Exception;
	
	public BoardVo read(Integer bno) throws Exception;
	
	public void modify(BoardVo board) throws Exception;
	
	public void remove(Integer bno) throws Exception;
	
	public List<BoardVo> listAll() throws Exception;
	
	public List<BoardVo> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public List<BoardVo> listSearchCriteria(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	public List<String> getAttach(Integer bno) throws Exception;
	
}
