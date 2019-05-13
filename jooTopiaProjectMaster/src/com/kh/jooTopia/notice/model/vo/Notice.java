package com.kh.jooTopia.notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable {
	
	private int bId;
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
	
	
	
	
	
}
