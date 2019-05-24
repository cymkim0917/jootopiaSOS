package com.kh.jooTopia.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PaymentCancle implements Serializable {
	private int pymCId;
	private Date pymCDate;
	private String reason;
	private int pymId;
	private String refundNY;
	
	public PaymentCancle() {}

	public PaymentCancle(int pymCId, Date pymCDate, String reason, int pymId, String refundNY) {
		super();
		this.pymCId = pymCId;
		this.pymCDate = pymCDate;
		this.reason = reason;
		this.pymId = pymId;
		this.refundNY = refundNY;
	}

	public int getPymCId() {
		return pymCId;
	}

	public void setPymCId(int pymCId) {
		this.pymCId = pymCId;
	}

	public Date getPymCDate() {
		return pymCDate;
	}

	public void setPymCDate(Date pymCDate) {
		this.pymCDate = pymCDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getPymId() {
		return pymId;
	}

	public void setPymId(int pymId) {
		this.pymId = pymId;
	}

	public String getRefundNY() {
		return refundNY;
	}

	public void setRefundNY(String refundNY) {
		this.refundNY = refundNY;
	}
	
}
