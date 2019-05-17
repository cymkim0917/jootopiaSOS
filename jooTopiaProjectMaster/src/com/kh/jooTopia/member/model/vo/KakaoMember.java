package com.kh.jooTopia.member.model.vo;

import java.io.Serializable;

public class KakaoMember implements Serializable{
	private String userId;
	private String userPwd;
	private String userName;
	
	public KakaoMember() {}
	
	
	
	
	public KakaoMember(String userId, String userPwd, String userName) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
	}




	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
