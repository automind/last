package com.kedu.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.domain.ContactDto;

@Repository
public class ContactDaoImpl implements ContactDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.mapper.ContactMapper";
	
	@Override
	public void send(ContactDto cDto) throws Exception {
		session.insert(namespace + ".send", cDto);
	}

}
