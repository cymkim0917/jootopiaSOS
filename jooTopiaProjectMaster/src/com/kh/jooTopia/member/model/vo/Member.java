package com.kh.jooTopia.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	private int uno;
	private String userId;
	private String userPwd;
	private String admin_NY;
	private String userName;
	private Date userDate;
	private String phone;
	private String gender;
	private String address;
	private Date enoroll_date;
	private Date modify_date;
	private int joinType;
	private String status;
	private String email;
	private String widthDrawal_reason;
	private Date widthDrawal_date;
	
	public Member() {}
	
	public Member(int uno, String userId, String userPwd, String admin_NY, String userName, Date userDate, String phone,
			String gender, String address, Date enoroll_date, Date modify_date, int joinType, String status,
			String email, String widthDrawal_reason, Date widthDrawal_date) {
		super();
		this.uno = uno;
		this.userId = userId;
		this.userPwd = userPwd;
		this.admin_NY = admin_NY;
		this.userName = userName;
		this.userDate = userDate;
		this.phone = phone;
		this.gender = gender;
		this.address = address;
		this.enoroll_date = enoroll_date;
		this.modify_date = modify_date;
		this.joinType = joinType;
		this.status = status;
		this.email = email;
		this.widthDrawal_reason = widthDrawal_reason;
		this.widthDrawal_date = widthDrawal_date;
	}

	public Member(String userId, String userPwd, String userName, Date userDate, String phone, String gender,
			String address, String email) {
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userDate = userDate;
		this.phone = phone;
		this.gender = gender;
		this.address = address;
		this.email = email;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
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

	public String getAdmin_NY() {
		return admin_NY;
	}

	public void setAdmin_NY(String admin_NY) {
		this.admin_NY = admin_NY;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getUserDate() {
		return userDate;
	}

	public void setUserDate(Date userDate) {
		this.userDate = userDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnoroll_date() {
		return enoroll_date;
	}

	public void setEnoroll_date(Date enoroll_date) {
		this.enoroll_date = enoroll_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public int getJoinType() {
		return joinType;
	}

	public void setJoinType(int joinType) {
		this.joinType = joinType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWidthDrawal_reason() {
		return widthDrawal_reason;
	}

	public void setWidthDrawal_reason(String widthDrawal_reason) {
		this.widthDrawal_reason = widthDrawal_reason;
	}

	public Date getWidthDrawal_date() {
		return widthDrawal_date;
	}

	public void setWidthDrawal_date(Date widthDrawal_date) {
		this.widthDrawal_date = widthDrawal_date;
	}

	@Override
	public String toString() {
		return "Member [uno=" + uno + ", userId=" + userId + ", userPwd=" + userPwd + ", admin_NY=" + admin_NY
				+ ", userName=" + userName + ", userDate=" + userDate + ", phone=" + phone + ", gender=" + gender
				+ ", address=" + address + ", enoroll_date=" + enoroll_date + ", modify_date=" + modify_date
				+ ", joinType=" + joinType + ", status=" + status + ", email=" + email + ", widthDrawal_reason="
				+ widthDrawal_reason + ", widthDrawal_date=" + widthDrawal_date + "]";
	}
	
	
	
}
