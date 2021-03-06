package com.kh.jooTopia.buy.model.vo;

import java.sql.Date;

public class BuyWaitAdmin implements java.io.Serializable {
	private int pId; 			// PID - 상품번호(시퀀스)
	private int hId; 			// HID - 적치번호(시퀀스)
	private int rlId; 			// RLID - 출고번호(시퀀스)
	private int pcdId; 			// PCDID - 매입상세번호
	private String cGroup; 		// CGROUP - 대분류
	private String name; 		// NAME - 중분류
	private int odId; 			// ODID - 주문번호
	private int dId; 			// DID - 배송번호
	private int lBarcode; 		// LBARCODE - 위치바코드
	private Date rlDate; 		// RLDATE - 출고일자
	private Date hDate; 		// HDATE - 적치일자
	private String status; 		// STATUS - 모든 테이블 공통
	private String applicant; 	// APPLICANT - 신청자명
	private String appPhone; 	// APPLICANT_PHONE - 신청자연락처
	private String appAddress;
	private int pcid;
	private String pBarcode;

	public BuyWaitAdmin() {}
	
	public BuyWaitAdmin(int pId, int hId, int rlId, int pcdId, String cGroup, String name, int odId, int dId,
			int lBarcode, Date rlDate, Date hDate, String status, String applicant, String appPhone, int pcid, String appAddress) {
		super();
		this.pId = pId;
		this.hId = hId;
		this.rlId = rlId;
		this.pcdId = pcdId;
		this.cGroup = cGroup;
		this.name = name;
		this.odId = odId;
		this.dId = dId;
		this.lBarcode = lBarcode;
		this.rlDate = rlDate;
		this.hDate = hDate;
		this.status = status;
		this.applicant = applicant;
		this.appPhone = appPhone;
		this.pcid = pcid;
		this.appAddress = appAddress;
	}

	
	public String getpBarcode() {
		return pBarcode;
	}

	public void setpBarcode(String pBarcode) {
		this.pBarcode = pBarcode;
	}

	public String getAppAddress() {
		return appAddress;
	}

	public void setAppAddress(String appAddress) {
		this.appAddress = appAddress;
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

	public int getOdId() {
		return odId;
	}

	public void setOdId(int odId) {
		this.odId = odId;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	public int getlBarcode() {
		return lBarcode;
	}

	public void setlBarcode(int lBarcode) {
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getApplicant() {
		return applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	public String getAppPhone() {
		return appPhone;
	}

	public void setAppPhone(String appPhone) {
		this.appPhone = appPhone;
	}

	public int getPcid() {
		return pcid;
	}

	public void setPcid(int pcid) {
		this.pcid = pcid;
	}

	@Override
	public String toString() {
		return "BuyWaitAdmin [pId=" + pId + ", hId=" + hId + ", rlId=" + rlId + ", pcdId=" + pcdId + ", cGroup="
				+ cGroup + ", name=" + name + ", odId=" + odId + ", dId=" + dId + ", lBarcode=" + lBarcode + ", rlDate="
				+ rlDate + ", hDate=" + hDate + ", status=" + status + ", applicant=" + applicant + ", appPhone="
				+ appPhone + ", appAddress=" + appAddress + ", pcid=" + pcid + ", pBarcode=" + pBarcode + "]";
	}

	
}
