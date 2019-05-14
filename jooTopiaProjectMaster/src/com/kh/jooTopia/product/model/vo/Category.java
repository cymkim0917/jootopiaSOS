package com.kh.jooTopia.product.model.vo;

public class Category implements java.io.Serializable{
	private int cid;
	private String cGroup;
	private String name;
	private int maxAmount;
	
	public Category() {}

	public Category(int cid, String cGroup, String name, int maxAmount) {
		super();
		this.cid = cid;
		this.cGroup = cGroup;
		this.name = name;
		this.maxAmount = maxAmount;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getcGroup() {
		return cGroup;
	}

	public void setcGroup(String cGroup) {
		this.cGroup = cGroup;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMaxAmount() {
		return maxAmount;
	}

	public void setMaxAmount(int maxAmount) {
		this.maxAmount = maxAmount;
	}

	@Override
	public String toString() {
		return "Category [cid=" + cid + ", cGroup=" + cGroup + ", name=" + name + ", maxAmount=" + maxAmount + "]";
	}
}
