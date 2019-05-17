package com.kh.jooTopia.purchase.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jooTopia.purchase.model.dao.PurchaseAdminDao;
import com.kh.jooTopia.purchase.model.dao.PurchaseDetailDao;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_COLOR_BURNPeer;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class PurchaseAdminService {

	public ArrayList<HashMap<String, Object>> selectList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list;
		HashMap<String, Object> hmap = null;
		
		list = new PurchaseAdminDao().selectPurchaseList(con);
		
		for(int i = 0; i < list.size(); i++) {
			hmap = list.get(i);
			
			hmap.put("status", new PurchaseDetailDao().selectPCDstatus(con, Integer.parseInt(String.valueOf(hmap.get("pcid")))));
		}
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectPurchaseOne(int pcid) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;
		
		// purchase정보 조회
		hmap = new PurchaseAdminDao().selectPurchaseOne(con, pcid);
		
		if(hmap != null) {
			hmap.put("status", new PurchaseDetailDao().selectPCDstatus(con, pcid));
			
			if(hmap.get("status") == "매입신청거절") {
				hmap.put("denyReason", new PurchaseDetailDao().selectPCDdenyReason(con, pcid));
			}else if(hmap.get("status") != "신청수락대기"){
				hmap.put("pBarcode", new PurchaseDetailDao().selectPCDbarcode(con, pcid));
			}
			hmap.put("fileList", new PurchaseAdminDao().selectAttachment(con, pcid));
		}
		close(con);
		
		return hmap; 
	}
}
