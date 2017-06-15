package com.kedu.persistence;

import java.util.List;

import com.kedu.domain.Criteria;
import com.kedu.domain.ReplyDto;


public interface ReplyDao {
	public List<ReplyDto> list(Integer bno) throws Exception;
	
	public void create(ReplyDto rDto) throws Exception;
	
	public void update(ReplyDto rDto) throws Exception;
	
	public void delete(Integer rno) throws Exception;
	
	public List<ReplyDto> listPage(Integer bno, Criteria cri) throws Exception;
	
	public int count(Integer bno) throws Exception;
	
	public int getBno(Integer rno) throws Exception;
}
