package com.kh.jooTopia.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable {
	 
	private int fId;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private String status;
	private Date uploadDate;
	private Date deleteDate;
	private int boardKind;
	private int pNo;
	private int bId;
	
	public Attachment() {}

	public Attachment(int fId, String originName, String changeName, String filePath, int fileLevel, String status,
			Date uploadDate, Date deleteDate, int boardKind, int pNo, int bId) {
		super();
		this.fId = fId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.status = status;
		this.uploadDate = uploadDate;
		this.deleteDate = deleteDate;
		this.boardKind = boardKind;
		this.pNo = pNo;
		this.bId = bId;
	}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	public int getBoardKind() {
		return boardKind;
	}

	public void setBoardKind(int boardKind) {
		this.boardKind = boardKind;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	@Override
	public String toString() {
		return "Attachment [fId=" + fId + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", fileLevel=" + fileLevel + ", status=" + status + ", uploadDate=" + uploadDate
				+ ", deleteDate=" + deleteDate + ", boardKind=" + boardKind + ", pNo=" + pNo + ", bId=" + bId + "]";
	};
	
}
