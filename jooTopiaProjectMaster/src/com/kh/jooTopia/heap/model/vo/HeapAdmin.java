package com.kh.jooTopia.heap.model.vo;

public class HeapAdmin implements java.io.Serializable{
	
	private int hId;
	private int pcNo;
	private int pNo;
	 
	public HeapAdmin() {}

	public HeapAdmin(int hId, int pcNo, int pNo) {
		super();
		this.hId = hId;
		this.pcNo = pcNo;
		this.pNo = pNo;
	}

	public int gethId() {
		return hId;
	}

	public void sethId(int hId) {
		this.hId = hId;
	}

	public int getPcNo() {
		return pcNo;
	}

	public void setPcNo(int pcNo) {
		this.pcNo = pcNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	@Override
	public String toString() {
		return "HeapAdmin [hId=" + hId + ", pcNo=" + pcNo + ", pNo=" + pNo + "]";
	}
	
	

}
