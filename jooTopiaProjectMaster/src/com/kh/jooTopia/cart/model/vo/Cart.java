package com.kh.jooTopia.cart.model.vo;

import java.io.Serializable;

public class Cart implements Serializable{
	private int cartId;
	private String change_name;
	private int pid;
	private String pname;
	private int price;
	private int uno;
	private String status;//
	
	public Cart() {}

	public Cart(String change_name, int pid, String pname, int price,int uno,String status,int cartId) {
		super();
		this.change_name = change_name;
		this.pid = pid;
		this.pname = pname;
		this.price = price;
		this.uno = uno;
		this.status = status;
		this.cartId = cartId;
	}
	
		

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Cart [change_name=" + change_name + ", pid=" + pid + ", pname=" + pname + ", price=" + price + "]";
	}
	
	
	
}
