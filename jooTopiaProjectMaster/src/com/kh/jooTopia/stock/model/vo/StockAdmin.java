package com.kh.jooTopia.stock.model.vo;

import java.sql.Date;

public class StockAdmin implements java.io.Serializable{
	private int pId;		//PID - 상품번호(시퀀스)
	private int hId;		//HID - 적치번호(시퀀스)
	private int rlId;		//RLID - 출고번호(시퀀스)
	private int pcdId;		//PCDID - 매입상세번호
	private String cGroup;	//CGROUP - 대분류
	private String name;	//NAME - 중분류
	private int poId;		//POID - 주문번호
	private int dId;		//DID - 배송번호
	private String lBarcode;	//LBARCODE - 위치바코드
	private Date rlDate;	//RLDATE - 출고일자
	private Date hDate;		//HDATE - 적치일자
	private String pContent;//PCONTENT - 상품상세정보
	
	public StockAdmin() {}

	public StockAdmin(int pId, int hId, int rlId, int pcdId, String cGroup, String name, int poId, int dId,
			String lBarcode, Date rlDate, Date hDate, String pContent) {
		super();
		this.pId = pId;
		this.hId = hId;
		this.rlId = rlId;
		this.pcdId = pcdId;
		this.cGroup = cGroup;
		this.name = name;
		this.poId = poId;
		this.dId = dId;
		this.lBarcode = lBarcode;
		this.rlDate = rlDate;
		this.hDate = hDate;
		this.pContent = pContent;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public int gethId() {
		return hId;
	}

	public void sethId(int hId) {
		this.hId = hId;
	}

	public int getRlId() {
		return rlId;
	}

	public void setRlId(int rlId) {
		this.rlId = rlId;
	}

	public int getPcdId() {
		return pcdId;
	}

	public void setPcdId(int pcdId) {
		this.pcdId = pcdId;
	}

	public String getcGroup() {
		return cGroup;
	}

	public void setcGroup(String cGroup) {
		this.cGroup = cGroup;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoId() {
		return poId;
	}

	public void setPoId(int poId) {
		this.poId = poId;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	public String getlBarcode() {
		return lBarcode;
	}

	public void setlBarcode(String lBarcode) {
		this.lBarcode = lBarcode;
	}

	public Date getRlDate() {
		return rlDate;
	}

	public void setRlDate(Date rlDate) {
		this.rlDate = rlDate;
	}

	public Date gethDate() {
		return hDate;
	}

	public void sethDate(Date hDate) {
		this.hDate = hDate;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	@Override
	public String toString() {
		return "StockAdmin [pId=" + pId + ", hId=" + hId + ", rlId=" + rlId + ", pcdId=" + pcdId + ", cGroup=" + cGroup
				+ ", name=" + name + ", poId=" + poId + ", dId=" + dId + ", lBarcode=" + lBarcode + ", rlDate=" + rlDate
				+ ", hDate=" + hDate + ", pContent=" + pContent + "]";
	}

	
	


}
