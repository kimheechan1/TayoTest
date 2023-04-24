package com.henry.testEntity;

public class Passenger {

	private String p_id;
	private String p_pw;
	private String p_ph;

	public Passenger() {
		
	}
	
	public Passenger(String p_id, String p_pw, String p_ph) {
		this.p_id = p_id;
		this.p_pw = p_pw;
		this.p_ph = p_ph;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getP_pw() {
		return p_pw;
	}

	public void setP_pw(String p_pw) {
		this.p_pw = p_pw;
	}

	public String getP_ph() {
		return p_ph;
	}

	public void setP_ph(String p_ph) {
		this.p_ph = p_ph;
	}

	@Override
	public String toString() {
		return "Passenger [p_id=" + p_id + ", p_pw=" + p_pw + ", p_ph=" + p_ph + "]";
	}
	
	
	
}
