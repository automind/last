package com.kedu.persistence;

import java.util.Date;

import com.kedu.domain.LoginDto;
import com.kedu.domain.UserDto;


public interface UserDao {
	public UserDto login(LoginDto dto) throws Exception;
	
	public void keepLogin(String uid, String sessionKey, Date sessionLimit);
	
	public UserDto checkUserWithSessionKey(String sessionKey);
}
