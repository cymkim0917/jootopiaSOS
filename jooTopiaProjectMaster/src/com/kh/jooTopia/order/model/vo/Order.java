package com.kh.jooTopia.order.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable {
	private int uno;
	private int pid;
	private int poid;
	private String pname;
	private int ppice;
	private String change_name;
	private Date pDate;
	private String status;
	private String address;
	private int odid;
	
	public Order() {}

	public Order(int uno, int pid, int poid, String pname, int ppice, String change_name, Date pDate, String status,
			String address,int odid) {
		super();
		this.uno = uno;
		this.pid = pid;
		this.poid = poid;
		this.pname = pname;
		this.ppice = ppice;
		this.change_name = change_name;
		this.pDate = pDate;
		this.status = status;
		this.address = address;
		this.odid = odid;
	}
	
	

	public int getOdid() {
		return odid;
	}

	public void setOdid(int odid) {
		this.odid = odid;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getPoid() {
		return poid;
	}

	public void setPoid(int poid) {
		this.poid = poid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPpice() {
		return ppice;
	}

	public void setPpice(int ppice) {
		this.ppice = ppice;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Order [uno=" + uno + ", pid=" + pid + ", poid=" + poid + ", pname=" + pname + ", ppice=" + ppice
				+ ", change_name=" + change_name + ", pDate=" + pDate + ", status=" + status + ", address=" + address
				+ "]";
	}
	
	

	
}
