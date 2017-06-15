package com.kedu.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointDaoImpl implements PointDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.mapper.PointMapper";
	
	@Override
	public void updatePoint(String uid, int point) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("uid", uid);
		paramMap.put("point", point);
		
		session.update(namespace + ".updatePoint", paramMap);
	}
	
}
