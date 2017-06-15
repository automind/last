package com.kedu.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.domain.PopupDto;

@Repository
public class PopupDaoImpl implements PopupDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.mapper.PopupMapper";
	
	@Override
	public void create(PopupDto pDto) throws Exception {
		session.insert(namespace + ".create", pDto);
	}

}
