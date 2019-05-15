package com.kh.jooTopia.stock.model.vo;

import java.sql.Date;
 
public class StockAdmin {
	private int sId;
	private String cate1;
	private String cate2;
	private int pNo;
	private int hNo;
	private int lNo;
	private Date hDate;
	
	public StockAdmin() {}

	public StockAdmin(int sId, String cate1, String cate2, int pNo, int hNo, int lNo, Date hDate) {
		super();
		this.sId = sId;
		this.cate1 = cate1;
		this.cate2 = cate2;
		this.pNo = pNo;
		this.hNo = hNo;
		this.lNo = lNo;
		this.hDate = hDate;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getCate1() {
		return cate1;
	}

	public void setCate1(String cate1) {
		this.cate1 = cate1;
	}

	public String getCate2() {
		return cate2;
	}

	public void setCate2(String cate2) {
		this.cate2 = cate2;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int gethNo() {
		return hNo;
	}

	public void sethNo(int hNo) {
		this.hNo = hNo;
	}

	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	public Date gethDate() {
		return hDate;
	}

	public void sethDate(Date hDate) {
		this.hDate = hDate;
	}

	@Override
	public String toString() {
		return "StockAdmin [sId=" + sId + ", cate1=" + cate1 + ", cate2=" + cate2 + ", pNo=" + pNo + ", hNo=" + hNo
				+ ", lNo=" + lNo + ", hDate=" + hDate + "]";
	}
	
	
	

}
