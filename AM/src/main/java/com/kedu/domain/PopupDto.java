package com.kedu.domain;


public class PopupDto {
	private String nm;
	private String hp;
	private String model;
	private String dt;
	private String rvTime;
	
	public PopupDto() {
		super();
	}

	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	public String getRvTime() {
		return rvTime;
	}

	public void setRvTime(String rvTime) {
		this.rvTime = rvTime;
	}

	public PopupDto(String nm, String hp, String model, String dt, String rvTime) {
		super();
		this.nm = nm;
		this.hp = hp;
		this.model = model;
		this.dt = dt;
		this.rvTime = rvTime;
	}

	@Override
	public String toString() {
		return "PopupDto [nm=" + nm + ", hp=" + hp + ", model=" + model + ", dt=" + dt + ", rvTime=" + rvTime + "]";
	}
	
	
}
