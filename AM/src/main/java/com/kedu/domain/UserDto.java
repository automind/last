package com.kedu.domain;

public class UserDto {
	private String uid;
	private String upw;
	private String uname; 
	private int upoint;
	
	
	public UserDto() {
		super();
	}


	public UserDto(String uid, String upw, String uname, int upoint) {
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
		this.upoint = upoint;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getUpw() {
		return upw;
	}


	public void setUpw(String upw) {
		this.upw = upw;
	}


	public String getUname() {
		return uname;
	}


	public void setUname(String uname) {
		this.uname = uname;
	}


	public int getUpoint() {
		return upoint;
	}


	public void setUpoint(int upoint) {
		this.upoint = upoint;
	}


	@Override
	public String toString() {
		return "UserDto [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", upoint=" + upoint + "]";
	}
	
}
