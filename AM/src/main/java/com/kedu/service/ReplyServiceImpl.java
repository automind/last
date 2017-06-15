package com.kedu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.domain.Criteria;
import com.kedu.domain.ReplyDto;
import com.kedu.persistence.BoardDao;
import com.kedu.persistence.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDao replyDao;
	
	@Inject
	private BoardDao boardDao;
	
	@Transactional
	@Override
	public void addReply(ReplyDto rDto) throws Exception {
		replyDao.create(rDto);
		boardDao.updateReplyCnt(rDto.getBno(), 1);
	}

	@Transactional
	@Override
	public void removeReply(Integer rno) throws Exception {
		
		int bno = replyDao.getBno(rno);
		replyDao.delete(rno);
		boardDao.updateReplyCnt(bno, -1);
	}
	
	@Override
	public void modifyReply(ReplyDto rDto) throws Exception {
		replyDao.update(rDto);
	}
	
	
	@Override
	public List<ReplyDto> listReply(Integer bno) throws Exception {
		return replyDao.list(bno);
	}
	
	@Override
	public List<ReplyDto> listReplyPage(Integer bno, Criteria cri) throws Exception {
		return replyDao.listPage(bno, cri);
	}
	
	@Override
	public int count(Integer bno) throws Exception{
		return replyDao.count(bno);
	}
	
}
