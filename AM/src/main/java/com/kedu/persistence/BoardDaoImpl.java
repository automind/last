package com.kedu.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.domain.BoardVo;
import com.kedu.domain.Criteria;
import com.kedu.domain.SearchCriteria;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Inject
	private SqlSession session;
	
	private static String namespace
	= "com.kedu.mapper.BoardMapper";
	
	@Override
	public void create(BoardVo vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public BoardVo read(Integer bno) throws Exception {
		return session.selectOne(namespace + ".read", bno);
	}

	@Override
	public void update(BoardVo vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace + ".delete", bno);
	}

	@Override
	public List<BoardVo> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}
	
	@Override
	public List<BoardVo> listPage(int page) throws Exception {
		if(page <= 0){
			page = 1;
		}
		page = (page-1)*10;
		
		return session.selectList(namespace + ".listPage", page);
	}
	
	@Override
	public List<BoardVo> listCriteria(Criteria cri) throws Exception{
		return session.selectList(namespace + ".listCriteria", cri);
	}
	
	@Override
	public int countPaging(Criteria cri) throws Exception{
		return session.selectOne(namespace + ".countPaging", cri);
	}
	
	@Override
	public List<BoardVo> listSearch(SearchCriteria cri) throws Exception{
		return session.selectList(namespace + ".listSearch", cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception{
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updateReplyCnt", paramMap);
	}

	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		session.update(namespace + ".updateViewCnt", bno);
	}
	
	@Override
	public void addAttach(String fullName) throws Exception{
		session.insert(namespace + ".addAttach", fullName);
	}
	
	@Override
	public List<String> getAttach(Integer bno) throws Exception{
		return session.selectList(namespace + ".getAttach", bno);
	}
	
	@Override
	public void deleteAttach(Integer bno) throws Exception{
		session.delete(namespace + ".deleteAttach", bno);
	}
	
	@Override
	public void replaceAttach(String fullName, Integer bno) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace + ".replaceAttach", paramMap);
	}
}
