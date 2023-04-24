package com.henry.testEntity;

public class Driver {
	
	private String d_id;
	private String d_pw;

	public Driver() {
		
	}
	
	public Driver(String d_id, String d_pw) {
		super();
		this.d_id = d_id;
		this.d_pw = d_pw;
	}
	public String getD_id() {
		return d_id;
	}
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}
	public String getD_pw() {
		return d_pw;
	}
	public void setD_pw(String d_pw) {
		this.d_pw = d_pw;
	}
	@Override
	public String toString() {
		return "Driver [d_id=" + d_id + "]";
	}
	
	


}	
