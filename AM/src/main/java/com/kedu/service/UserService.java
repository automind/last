package com.kedu.service;

import java.util.Date;

import com.kedu.domain.LoginDto;
import com.kedu.domain.UserDto;


public interface UserService {
	public UserDto login(LoginDto dto) throws Exception;
	
	public void keepLogin(String uid, String sessionKey, Date sessionLimit) throws Exception;
	
	public UserDto checkLoginBefore(String sessionLimit);
}
