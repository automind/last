package com.kedu.service;

import com.kedu.domain.ContactDto;

public interface ContactService {
	public void send(ContactDto cDto) throws Exception;
}
