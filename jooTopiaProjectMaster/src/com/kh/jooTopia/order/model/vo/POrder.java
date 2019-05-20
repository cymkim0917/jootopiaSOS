package com.kh.jooTopia.order.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class POrder implements Serializable {
	private int poId;
	private Date poDate;
	private String status;
	private int uNo;
	private int pymId;
	private String name;
	private String phone;
	private String address;
	private String dMessage;

	public POrder() {}

	public POrder(int poId, Date poDate, String status, int uNo, int pymId, String name, String phone, String address,
			String dMessage) {
		super();
		this.poId = poId;
		this.poDate = poDate;
		this.status = status;
		this.uNo = uNo;
		this.pymId = pymId;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.dMessage = dMessage;
	}

	public int getPoId() {
		return poId;
	}

	public void setPoId(int poId) {
		this.poId = poId;
	}

	public Date getPoDate() {
		return poDate;
	}

	public void setPoDate(Date poDate) {
		this.poDate = poDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public int getPymId() {
		return pymId;
	}

	public void setPymId(int pymId) {
		this.pymId = pymId;
	}

	public String getdMessage() {
		return dMessage;
	}

	public void setdMessage(String dMessage) {
		this.dMessage = dMessage;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}