package com.kh.jooTopia.order.model.vo;

import java.sql.Date;

public class OrderCancle {
	
	private int ocId;
	private Date ocDate;
	private int poId;
	private String reason;
	
	public OrderCancle() {}

	public OrderCancle(int ocId, Date ocDate, int poId, String reason) {
		super();
		this.ocId = ocId;
		this.ocDate = ocDate;
		this.poId = poId;
		this.reason = reason;
	}

	public int getOcId() {
		return ocId;
	}

	public void setOcId(int ocId) {
		this.ocId = ocId;
	}

	public Date getOcDate() {
		return ocDate;
	}

	public void setOcDate(Date ocDate) {
		this.ocDate = ocDate;
	}

	public int getPoId() {
		return poId;
	}

	public void setPoId(int poId) {
		this.poId = poId;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
