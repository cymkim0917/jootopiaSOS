package com.kh.jooTopia.release.model.vo;

import java.sql.Date;

public class ReleaseAdminList {
	
	private int rId;
	private int oNo;
	private int dNo;
	private int rNo;
	private Date rDate;
	
	public ReleaseAdminList() {}

	public ReleaseAdminList(int rId, int oNo, int dNo, int rNo, Date rDate) {
		super();
		this.rId = rId;
		this.oNo = oNo;
		this.dNo = dNo;
		this.rNo = rNo;
		this.rDate = rDate;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	@Override
	public String toString() {
		return "ReleaseAdminList [rId=" + rId + ", oNo=" + oNo + ", dNo=" + dNo + ", rNo=" + rNo + ", rDate=" + rDate
				+ "]";
	}
	
	

}
