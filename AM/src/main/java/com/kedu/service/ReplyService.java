package com.kedu.service;

import java.util.List;

import com.kedu.domain.Criteria;
import com.kedu.domain.ReplyDto;


public interface ReplyService {

	public void addReply(ReplyDto rDto) throws Exception;
	
	public List<ReplyDto> listReply(Integer bno) throws Exception;
	
	public void modifyReply(ReplyDto rDto) throws Exception;
	
	public void removeReply(Integer rno) throws Exception;
	
	public List<ReplyDto> listReplyPage(Integer bno, Criteria cri) throws Exception;
	
	public int count(Integer bno) throws Exception;
	
	
	
}
