package com.kedu.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.domain.MessageVo;
import com.kedu.persistence.MessageDao;
import com.kedu.persistence.PointDao;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDao messageDao;
	
	@Inject
	private PointDao pointDao;
	
	@Transactional
	@Override
	public void addMessage(MessageVo vo) throws Exception {
		
		messageDao.create(vo);
		pointDao.updatePoint(vo.getSender(), 10);
	}
	
	@Transactional
	@Override
	public MessageVo readMessage(String uid, Integer mid) throws Exception {
		
		messageDao.updateState(mid);
		pointDao.updatePoint(uid, 5);
		
		return messageDao.readMessage(mid);
	}

}
