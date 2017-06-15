package com.kedu.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.domain.ContactDto;
import com.kedu.persistence.ContactDao;

@Service
public class ContactServiceImpl implements ContactService {
	
	@Inject
	private ContactDao cDao;
	
	@Override
	public void send(ContactDto cDto) throws Exception {
		cDao.send(cDto);
	}

}
