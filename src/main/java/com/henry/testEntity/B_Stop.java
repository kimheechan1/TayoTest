package com.henry.testEntity;

public class B_Stop {
	
	private String nodeid;
	private String nodenm;
	private float gpslati;
	private float gpslong;

	public B_Stop() {
		
	}
	
	public B_Stop(String nodeid, String nodenm, float gpslati, float gpslong) {
		this.nodeid = nodeid;
		this.nodenm = nodenm;
		this.gpslati = gpslati;
		this.gpslong = gpslong;
	}

	public String getNodeid() {
		return nodeid;
	}

	public void setNodeid(String nodeid) {
		this.nodeid = nodeid;
	}

	public String getNodenm() {
		return nodenm;
	}

	public void setNodenm(String nodenm) {
		this.nodenm = nodenm;
	}

	public float getGpslati() {
		return gpslati;
	}

	public void setGpslati(float gpslati) {
		this.gpslati = gpslati;
	}

	public float getGpslong() {
		return gpslong;
	}

	public void setGpslong(float gpslong) {
		this.gpslong = gpslong;
	}

	@Override
	public String toString() {
		return "B_Stop [nodeid=" + nodeid + ", nodenm=" + nodenm + ", gpslati=" + gpslati + ", gpslong=" + gpslong
				+ "]";
	}
	
	
	
	
}
