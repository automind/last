package com.kedu.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.domain.LoginDto;
import com.kedu.domain.UserDto;


@Repository
public class UserDaoImpl implements UserDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.mapper.UserMapper";
	
	@Override
	public UserDto login(LoginDto dto) throws Exception {
		return session.selectOne(namespace + ".login", dto);
	}
	
	@Override
	public void keepLogin(String uid, String sessionKey, Date sessionLimit) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("sessionKey", sessionKey);
		paramMap.put("sessionLimit", sessionLimit);
		
		session.update(namespace + ".keepLogin", paramMap);
	}
	
	@Override
	public UserDto checkUserWithSessionKey(String sessionKey) {
		return session.selectOne(namespace + ".checkUserWithSessionKey", sessionKey);
	}
}
