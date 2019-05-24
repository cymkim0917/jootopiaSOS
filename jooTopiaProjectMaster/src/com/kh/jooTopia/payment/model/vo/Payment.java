package com.kh.jooTopia.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Payment implements Serializable {
	private int pymId;
	private int productPrice;
	private int deliveryPrice;
	private Date pymDate;
	private String paymentOption;
	private String status;
	private String cardCompany;
	private String cardKind;
	private int installment;
	private int uno;
	private String tId;
	private String depositName;
	private Date depositDate;
	
	public Payment() {}

	public Payment(int pymId, int productPrice, int deliveryPrice, Date pymDate, String paymentOption, String status,
			String cardCompany, String cardKind, int installment, int uno, String tId, String depositName,
			Date depositDate) {
		super();
		this.pymId = pymId;
		this.productPrice = productPrice;
		this.deliveryPrice = deliveryPrice;
		this.pymDate = pymDate;
		this.paymentOption = paymentOption;
		this.status = status;
		this.cardCompany = cardCompany;
		this.cardKind = cardKind;
		this.installment = installment;
		this.uno = uno;
		this.tId = tId;
		this.depositName = depositName;
		this.depositDate = depositDate;
	}

	public int getPymId() {
		return pymId;
	}

	public void setPymId(int pymId) {
		this.pymId = pymId;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getDeliveryPrice() {
		return deliveryPrice;
	}

	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}

	public Date getPymDate() {
		return pymDate;
	}

	public void setPymDate(Date pymDate) {
		this.pymDate = pymDate;
	}

	public String getPaymentOption() {
		return paymentOption;
	}

	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCardCompany() {
		return cardCompany;
	}

	public void setCardCompany(String cardCompany) {
		this.cardCompany = cardCompany;
	}

	public String getCardKind() {
		return cardKind;
	}

	public void setCardKind(String cardKind) {
		this.cardKind = cardKind;
	}

	public int getInstallment() {
		return installment;
	}

	public void setInstallment(int installment) {
		this.installment = installment;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String gettId() {
		return tId;
	}

	public void settId(String tId) {
		this.tId = tId;
	}

	public String getDepositName() {
		return depositName;
	}

	public void setDepositName(String depositName) {
		this.depositName = depositName;
	}

	public Date getDepositDate() {
		return depositDate;
	}

	public void setDepositDate(Date depositDate) {
		this.depositDate = depositDate;
	}
	
}
