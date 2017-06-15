package com.kedu.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.domain.Criteria;
import com.kedu.domain.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.mapper.ReplyMapper";
	
	@Override
	public List<ReplyDto> listPage(Integer bno, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".listPage", paramMap);
	}
	
	@Override
	public List<ReplyDto> list(Integer bno) throws Exception {
		
		return session.selectList(namespace + ".list", bno);
	}
	
	@Override
	public int count(Integer bno) throws Exception {
		
		return session.selectOne(namespace + ".count", bno);
	}
	
	@Override
	public void create(ReplyDto rDto) throws Exception {
		session.insert(namespace + ".create", rDto);
	}

	@Override
	public void update(ReplyDto rDto) throws Exception {
		session.update(namespace + ".update", rDto);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		session.delete(namespace + ".delete", rno);
	}
	
	@Override
	public int getBno(Integer rno) throws Exception {
		
		return session.selectOne(namespace + ".getBno", rno);
	}
}
