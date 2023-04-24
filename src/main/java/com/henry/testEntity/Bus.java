package com.henry.testEntity;

public class Bus {

	private String b_id;
	private String routeno;
	private String routetp;
	private String vehicletp;

	private String nodeid; // prolly redundant!! but keep an eye on it or two if you feel like it lolololololol

	public Bus() {
		// for Spring
	}
	
	public Bus(String b_id, String routeno, String routetp, String vehicletp, String nodeid) {
		this.b_id = b_id;
		this.routeno = routeno;
		this.routetp = routetp;
		this.vehicletp = vehicletp;
		this.nodeid = nodeid;
	}

	@Override
	public String toString() {
		return "Bus [b_id=" + b_id + ", routeno=" + routeno + ", routetp=" + routetp + ", vehicletp=" + vehicletp
				+ ", nodeid=" + nodeid + "]";
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getRouteno() {
		return routeno;
	}

	public void setRouteno(String routeno) {
		this.routeno = routeno;
	}

	public String getRoutetp() {
		return routetp;
	}

	public void setRoutetp(String routetp) {
		this.routetp = routetp;
	}

	public String getVehicletp() {
		return vehicletp;
	}

	public void setVehicletp(String vehicletp) {
		this.vehicletp = vehicletp;
	}

	public String getNodeid() {
		return nodeid;
	}

	public void setNodeid(String nodeid) {
		this.nodeid = nodeid;
	}


}
