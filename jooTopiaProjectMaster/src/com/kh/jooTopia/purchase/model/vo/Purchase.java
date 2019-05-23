package com.kh.jooTopia.purchase.model.vo;

public class Purchase implements java.io.Serializable{
	private int pcid;
	private String applicant;
	private String appAddress;
	private double appDistance;
	private String appPhone;
	private String brand;
	private String model;
	private String usePeriod;
	private int primeCost;
	private int hopeCost;
	private String memo;
	private String status;
	private int userYear;
	private String cName;
	private int delivaryPrice;
	
	public Purchase() {}

	public Purchase(int pcid, String applicant, String appAddress, double appDistance, String appPhone, String brand,
			String model, String usePeriod, int primeCost, int hopeCost, String memo, String status, int userYear,
			String cName, int delivaryPrice) {
		super();
		this.pcid = pcid;
		this.applicant = applicant;
		this.appAddress = appAddress;
		this.appDistance = appDistance;
		this.appPhone = appPhone;
		this.brand = brand;
		this.model = model;
		this.usePeriod = usePeriod;
		this.primeCost = primeCost;
		this.hopeCost = hopeCost;
		this.memo = memo;
		this.status = status;
		this.userYear = userYear;
		this.cName = cName;
		this.delivaryPrice = delivaryPrice;
	}

	public int getPcid() {
		return pcid;
	}

	public void setPcid(int pcid) {
		this.pcid = pcid;
	}

	public String getApplicant() {
		return applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	public String getAppAddress() {
		return appAddress;
	}

	public void setAppAddress(String appAddress) {
		this.appAddress = appAddress;
	}

	public double getAppDistance() {
		return appDistance;
	}

	public void setAppDistance(double appDistance) {
		this.appDistance = appDistance;
	}

	public String getAppPhone() {
		return appPhone;
	}

	public void setAppPhone(String appPhone) {
		this.appPhone = appPhone;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getUsePeriod() {
		return usePeriod;
	}

	public void setUsePeriod(String usePeriod) {
		this.usePeriod = usePeriod;
	}

	public int getPrimeCost() {
		return primeCost;
	}

	public void setPrimeCost(int primeCost) {
		this.primeCost = primeCost;
	}

	public int getHopeCost() {
		return hopeCost;
	}

	public void setHopeCost(int hopeCost) {
		this.hopeCost = hopeCost;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUserYear() {
		return userYear;
	}

	public void setUserYear(int userYear) {
		this.userYear = userYear;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getDelivaryPrice() {
		return delivaryPrice;
	}

	public void setDelivaryPrice(int delivaryPrice) {
		this.delivaryPrice = delivaryPrice;
	}

	@Override
	public String toString() {
		return "Purchase [pcid=" + pcid + ", applicant=" + applicant + ", appAddress=" + appAddress + ", appDistance="
				+ appDistance + ", appPhone=" + appPhone + ", brand=" + brand + ", model=" + model + ", usePeriod="
				+ usePeriod + ", primeCost=" + primeCost + ", hopeCost=" + hopeCost + ", memo=" + memo + ", status="
				+ status + ", userYear=" + userYear + ", cName=" + cName + ", delivaryPrice=" + delivaryPrice + "]";
	}

}
