package com.kh.jooTopia.delivery.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Delivery implements Serializable {
	private int dId;
	private int poId;
	private Date startDate;
	private Date arriveDate;
	private String status;
	
	public Delivery() {}

	public Delivery(int dId, int poId, Date startDate, Date arriveDate, String status) {
		super();
		this.dId = dId;
		this.poId = poId;
		this.startDate = startDate;
		this.arriveDate = arriveDate;
		this.status = status;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	public int getPoId() {
		return poId;
	}

	public void setPoId(int poId) {
		this.poId = poId;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getArriveDate() {
		return arriveDate;
	}

	public void setArriveDate(Date arriveDate) {
		this.arriveDate = arriveDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
