package com.kh.jooTopia.buy.model.vo;

public class BuyWaitAdmin {
	 
	private int bId;
	private int nNo;
	private String bCate1;
	private String bCate2;	
	
	public BuyWaitAdmin() {}

	public BuyWaitAdmin(int bId, int nNo, String bCate1, String bCate2) {
		super();
		this.bId = bId;
		this.nNo = nNo;
		this.bCate1 = bCate1;
		this.bCate2 = bCate2;		
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getbCate1() {
		return bCate1;
	}

	public void setbCate1(String bCate1) {
		this.bCate1 = bCate1;
	}

	public String getbCate2() {
		return bCate2;
	}

	public void setbCate2(String bCate2) {
		this.bCate2 = bCate2;
	}

	

	@Override
	public String toString() {
		return "BuyWait [bId=" + bId + ", nNo=" + nNo + ", bCate1=" + bCate1 + ", bCate2=" + bCate2 + ", mId=" 
							+ ", mName=" + "]";
	}
	
	
	

}
