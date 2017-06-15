package com.kedu.persistence;

import com.kedu.domain.ContactDto;

public interface ContactDao {
	
	public void send(ContactDto cDto)throws Exception;
}
