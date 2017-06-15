package com.kedu.domain;

import java.util.Date;

public class ContactDto {
	private String nm;
	private String email;
	private String subj;
	private String message;
	private Date regdt;
	
	public ContactDto() {
		super();
	}

	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubj() {
		return subj;
	}

	public void setSubj(String subj) {
		this.subj = subj;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getRegdt() {
		return regdt;
	}

	public void setRegdt(Date regdt) {
		this.regdt = regdt;
	}

	public ContactDto(String nm, String email, String subj, String message, Date regdt) {
		super();
		this.nm = nm;
		this.email = email;
		this.subj = subj;
		this.message = message;
		this.regdt = regdt;
	}

	@Override
	public String toString() {
		return "ContactDto [nm=" + nm + ", email=" + email + ", subj=" + subj + ", message=" + message + ", regdt="
				+ regdt + "]";
	}
	
	
}
