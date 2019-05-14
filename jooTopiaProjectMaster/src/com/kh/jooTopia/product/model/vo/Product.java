package com.kh.jooTopia.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Product implements Serializable {
	 
	private int pId;
	private String pName;
	private int pPrice;
	private String pContent;
	private Date pEnrollDate;
	private String pGrade;
	private String pBarCode;
	private String pBrand;
	private String pModelName;
	private int cId;
	private int pcDId;
	
	public Product() {}

	public Product(int pId, String pName, int pPrice, String pContent, Date pEnrollDate, String pGrade, String pBarCode,
			String pBrand, String pModelName, int cId, int pcDId) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pContent = pContent;
		this.pEnrollDate = pEnrollDate;
		this.pGrade = pGrade;
		this.pBarCode = pBarCode;
		this.pBrand = pBrand;
		this.pModelName = pModelName;
		this.cId = cId;
		this.pcDId = pcDId;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public Date getpEnrollDate() {
		return pEnrollDate;
	}

	public void setpEnrollDate(Date pEnrollDate) {
		this.pEnrollDate = pEnrollDate;
	}

	public String getpGrade() {
		return pGrade;
	}

	public void setpGrade(String pGrade) {
		this.pGrade = pGrade;
	}

	public String getpBarCode() {
		return pBarCode;
	}

	public void setpBarCode(String pBarCode) {
		this.pBarCode = pBarCode;
	}

	public String getpBrand() {
		return pBrand;
	}

	public void setpBrand(String pBrand) {
		this.pBrand = pBrand;
	}

	public String getpModelName() {
		return pModelName;
	}

	public void setpModelName(String pModelName) {
		this.pModelName = pModelName;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getPcDId() {
		return pcDId;
	}

	public void setPcDId(int pcDId) {
		this.pcDId = pcDId;
	}

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pPrice=" + pPrice + ", pContent=" + pContent
				+ ", pEnrollDate=" + pEnrollDate + ", pGrade=" + pGrade + ", pBarCode=" + pBarCode + ", pBrand="
				+ pBrand + ", pModelName=" + pModelName + ", cId=" + cId + ", pcDId=" + pcDId + "]";
	}

}
