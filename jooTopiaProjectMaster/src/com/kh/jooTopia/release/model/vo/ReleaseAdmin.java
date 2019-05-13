package com.kh.jooTopia.release.model.vo;

public class ReleaseAdmin implements java.io.Serializable{
	
	private int no;				//순번
	private int oNo;			//주문번호
	private int dNo;			//배송번호
	private int hNo;			//적치번호
	private int locationNo;		//위치번호
	
	public ReleaseAdmin() {}

	public ReleaseAdmin(int no, int oNo, int dNo, int hNo, int locationNo) {
		super();
		this.no = no;
		this.oNo = oNo;		
		this.dNo = dNo;		
		this.hNo = hNo;		
		this.locationNo = locationNo;
	}
	
	public int getno() {
		return no;
	}
	
	public void setno(int no) {
		this.no = no;
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

	public int gethNo() {
		return hNo;
	}

	public void sethNo(int hNo) {
		this.hNo = hNo;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	@Override
	public String toString() {
		return "ReleaseAdmin [no=" + no + ", oNo=" + oNo + ", dNo=" + dNo + ", hNo=" + hNo + ", locationNo="
				+ locationNo + "]";
	}

	
	
	

}
