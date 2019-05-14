package com.kh.jooTopia.purchase.model.vo;

import java.sql.Date;

public class PurchaseDetail implements java.io.Serializable{
	private int pcdid;
	private String status;
	private String pBarcode;
	private String applydenyReason;
	private String denyReason;
	private int pcPrice;
	private String message;
	private int pcid;
	private Date pcDate;
	
	public PurchaseDetail() {}

	public PurchaseDetail(int pcdid, String status, String pBarcode, String applydenyReason, String denyReason,
			int pcPrice, String message, int pcid, Date pcDate) {
		super();
		this.pcdid = pcdid;
		this.status = status;
		this.pBarcode = pBarcode;
		this.applydenyReason = applydenyReason;
		this.denyReason = denyReason;
		this.pcPrice = pcPrice;
		this.message = message;
		this.pcid = pcid;
		this.pcDate = pcDate;
	}

	public int getPcdid() {
		return pcdid;
	}

	public void setPcdid(int pcdid) {
		this.pcdid = pcdid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getpBarcode() {
		return pBarcode;
	}

	public void setpBarcode(String pBarcode) {
		this.pBarcode = pBarcode;
	}

	public String getApplydenyReason() {
		return applydenyReason;
	}

	public void setApplydenyReason(String applydenyReason) {
		this.applydenyReason = applydenyReason;
	}

	public String getDenyReason() {
		return denyReason;
	}

	public void setDenyReason(String denyReason) {
		this.denyReason = denyReason;
	}

	public int getPcPrice() {
		return pcPrice;
	}

	public void setPcPrice(int pcPrice) {
		this.pcPrice = pcPrice;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getPcid() {
		return pcid;
	}

	public void setPcid(int pcid) {
		this.pcid = pcid;
	}

	public Date getPcDate() {
		return pcDate;
	}

	public void setPcDate(Date pcDate) {
		this.pcDate = pcDate;
	}

	@Override
	public String toString() {
		return "PurchaseDetail [pcdid=" + pcdid + ", status=" + status + ", pBarcode=" + pBarcode + ", applydenyReason="
				+ applydenyReason + ", denyReason=" + denyReason + ", pcPrice=" + pcPrice + ", message=" + message
				+ ", pcid=" + pcid + ", pcDate=" + pcDate + "]";
	}
}
