package com.kedu.domain;

import java.util.Date;

public class MessageVo {
	
	private Integer mid;
	private String targetid;
	private String sender;
	private String message;
	private Date opendate;
	private Date senddate;
	
	
	public MessageVo() {
		super();
	}

	public MessageVo(Integer mid, String targetid, String sender, String message, Date opendate, Date senddate) {
		this.mid = mid;
		this.targetid = targetid;
		this.sender = sender;
		this.message = message;
		this.opendate = opendate;
		this.senddate = senddate;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getTargetid() {
		return targetid;
	}

	public void setTargetid(String targetid) {
		this.targetid = targetid;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getOpendate() {
		return opendate;
	}

	public void setOpendate(Date opendate) {
		this.opendate = opendate;
	}

	public Date getSenddate() {
		return senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

	@Override
	public String toString() {
		return "MessageVo [mid=" + mid + ", targetid=" + targetid + ", sender=" + sender + ", message=" + message
				+ ", opendate=" + opendate + ", senddate=" + senddate + "]";
	}
	
	
}
