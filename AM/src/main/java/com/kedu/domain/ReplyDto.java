package com.kedu.domain;

import java.util.Date;

public class ReplyDto {
	private Integer rno;
	private Integer bno;
	private String replytext;
	private String replyer;
	private Date regdt;
	private Date updatedt;
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdt() {
		return regdt;
	}
	public void setRegdt(Date regdt) {
		this.regdt = regdt;
	}
	public Date getUpdatedt() {
		return updatedt;
	}
	public void setUpdatedt(Date updatedt) {
		this.updatedt = updatedt;
	}
	
	@Override
	public String toString() {
		return "ReplyDto [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", regdt=" + regdt + ", updatedt=" + updatedt + "]";
	}
	
}
