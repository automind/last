package com.kedu.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.domain.LoginDto;
import com.kedu.domain.UserDto;
import com.kedu.persistence.UserDao;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDao dao;
	
	@Override
	public UserDto login(LoginDto dto) throws Exception {
		return dao.login(dto);
	}
	
	@Override
	public void keepLogin(String uid, String sessionKey, Date sessionLimit) throws Exception {
		dao.keepLogin(uid, sessionKey, sessionLimit);
	}
	
	@Override
	public UserDto checkLoginBefore(String sessionKey) {
		return dao.checkUserWithSessionKey(sessionKey);
	}
}
