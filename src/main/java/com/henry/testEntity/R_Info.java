package com.henry.testEntity;

public class R_Info {

	private String routeid;
	private String routeno;
	private String endnodenm;
	private String startnodenm;

	public R_Info() {
		
	}
	
	public R_Info(String routeid, String routeno, String endnodenm, String startnodenm) {
		this.routeid = routeid;
		this.routeno = routeno;
		this.endnodenm = endnodenm;
		this.startnodenm = startnodenm;
	}

	public String getRouteid() {
		return routeid;
	}

	public void setRouteid(String routeid) {
		this.routeid = routeid;
	}

	public String getRouteno() {
		return routeno;
	}

	public void setRouteno(String routeno) {
		this.routeno = routeno;
	}

	public String getEndnodenm() {
		return endnodenm;
	}

	public void setEndnodenm(String endnodenm) {
		this.endnodenm = endnodenm;
	}

	public String getStartnodenm() {
		return startnodenm;
	}

	public void setStartnodenm(String startnodenm) {
		this.startnodenm = startnodenm;
	}

	@Override
	public String toString() {
		return "R_Info [routeid=" + routeid + ", routeno=" + routeno + ", endnodenm=" + endnodenm + ", startnodenm="
				+ startnodenm + "]";
	}
}
