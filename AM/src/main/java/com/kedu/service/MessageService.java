package com.kedu.service;

import com.kedu.domain.MessageVo;

public interface MessageService {

	public void addMessage(MessageVo vo) throws Exception;
	
	public MessageVo readMessage(String uid, Integer mid) throws Exception;
}
