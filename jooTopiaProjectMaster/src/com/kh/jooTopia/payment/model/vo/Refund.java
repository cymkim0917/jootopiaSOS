package com.kh.jooTopia.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Refund implements Serializable {
	
	private int rfId;
	private Date rfDate;
	private int rfPrice;
	private int pgNo;
	private Date requestDate;
	private int pymCId;
	
	public Refund() {}

	public Refund(int rfId, Date rfDate, int rfPrice, int pgNo, Date requestDate, int pymCId) {
		super();
		this.rfId = rfId;
		this.rfDate = rfDate;
		this.rfPrice = rfPrice;
		this.pgNo = pgNo;
		this.requestDate = requestDate;
		this.pymCId = pymCId;
	}

	public int getRfId() {
		return rfId;
	}

	public void setRfId(int rfId) {
		this.rfId = rfId;
	}

	public Date getRfDate() {
		return rfDate;
	}

	public void setRfDate(Date rfDate) {
		this.rfDate = rfDate;
	}

	public int getRfPrice() {
		return rfPrice;
	}

	public void setRfPrice(int rfPrice) {
		this.rfPrice = rfPrice;
	}

	public int getPgNo() {
		return pgNo;
	}

	public void setPgNo(int pgNo) {
		this.pgNo = pgNo;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public int getPymCId() {
		return pymCId;
	}

	public void setPymCId(int pymCId) {
		this.pymCId = pymCId;
	}

}
