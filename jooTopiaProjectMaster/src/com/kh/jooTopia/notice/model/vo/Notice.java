package com.kh.jooTopia.notice.model.vo;

import java.sql.Date;

import java.io.Serializable;

public class Notice implements java.io.Serializable {
	
	private int bId; 
	private int bNo;
	private int bType;
	private String bTitle;
	private String bContent;
	private String status;
	private Date enrollDate;
	private Date modifyDate; 
	private Date deleteDate;
	private int rrating;
	private String fCategory;
	private String mtmStatus;
	private String aContent;
	private Date aDate;
	private String qCategory;
	private int bCount;
	private String nType;
	private Date startDate;
	private Date finishDate;
	private String pCno;
	private String address;
	private int uNo;
	
	public Notice() {}

	public Notice(int bId, int bNo, int bType, String bTitle, String bContent, String status, Date enrollDate,
			Date modifyDate, Date deleteDate, int rrating, String fCategory, String mtmStatus, String aContent,
			Date aDate, String qCategory, int bCount, String nType, Date startDate, Date finishDate, String pCno,
			String address, int uNo) {
		super();
		this.bId = bId;
		this.bNo = bNo;
		this.bType = bType;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.status = status;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.deleteDate = deleteDate;
		this.rrating = rrating;
		this.fCategory = fCategory;
		this.mtmStatus = mtmStatus;
		this.aContent = aContent;
		this.aDate = aDate;
		this.qCategory = qCategory;
		this.bCount = bCount;
		this.nType = nType;
		this.startDate = startDate;
		this.finishDate = finishDate;
		this.pCno = pCno;
		this.address = address;
		this.uNo = uNo;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	public int getRrating() {
		return rrating;
	}

	public void setRrating(int rrating) {
		this.rrating = rrating;
	}

	public String getfCategory() {
		return fCategory;
	}

	public void setfCategory(String fCategory) {
		this.fCategory = fCategory;
	}

	public String getMtmStatus() {
		return mtmStatus;
	}

	public void setMtmStatus(String mtmStatus) {
		this.mtmStatus = mtmStatus;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public String getqCategory() {
		return qCategory;
	}

	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public String getnType() {
		return nType;
	}

	public void setnType(String nType) {
		this.nType = nType;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public String getpCno() {
		return pCno;
	}

	public void setpCno(String pCno) {
		this.pCno = pCno;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	@Override
	public String toString() {
		return "Notice [bId=" + bId + ", bNo=" + bNo + ", bType=" + bType + ", bTitle=" + bTitle + ", bContent="
				+ bContent + ", status=" + status + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", deleteDate=" + deleteDate + ", rrating=" + rrating + ", fCategory=" + fCategory + ", mtmStatus="
				+ mtmStatus + ", aContent=" + aContent + ", aDate=" + aDate + ", qCategory=" + qCategory + ", bCount="
				+ bCount + ", nType=" + nType + ", startDate=" + startDate + ", finishDate=" + finishDate + ", pCno="
				+ pCno + ", address=" + address + ", uNo=" + uNo + "]";
	}
	
	
	
	
	
	/*private int bId;
	private int bNo;
	private int bType;
	private String bTitle;
	private String bContent;
	private String status;
	private Date enroll_date;
	private Date modify_date;
	private int bCount;
	private int uNo;
	
	public Notice() {}

	public Notice(int bId, int bNo, int bType, String bTitle, String bContent, String status, Date enroll_date,
			Date modify_date, int bCount, int uNo) {
		super();
		this.bId = bId;
		this.bNo = bNo;
		this.bType = bType;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.status = status;
		this.enroll_date = enroll_date;
		this.modify_date = modify_date;
		this.bCount = bCount;
		this.uNo = uNo;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	@Override
	public String toString() {
		return "Notice [bId=" + bId + ", bNo=" + bNo + ", bType=" + bType + ", bTitle=" + bTitle + ", bContent="
				+ bContent + ", status=" + status + ", enroll_date=" + enroll_date + ", modify_date=" + modify_date
				+ ", bCount=" + bCount + ", uNo=" + uNo + "]";
	}
	
	*/
	
	
	
}
