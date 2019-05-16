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
		
		System.out.println();
		System.out.println();
		
		// 1. purchase정보를 가져온다. 
		list = new PurchaseAdminDao().selectPurchaseList(con);
		System.out.println("selectPurchaseList의 List : " + list);
		
		// 2. pid값읕 통해 purchaseDetail값을 조회한다.
		// 매입여부, 매입 수락여부를 조회하기 위한 작업
		// list에 있는 각각의 레코드에 대하여 매입상태를 확인하여 추가해주는 작업
		
		String status = "";
		for(int i = 0; i < list.size(); i++) {
			hmap = list.get(i);
			
			status = "매입수락";
			hmap = new PurchaseDetailDao().selectPCDstatus(con, hmap, status);
			status = "매입신청거절";
			hmap = new PurchaseDetailDao().selectPCDstatus(con, hmap, status);
			/*status = "신청수락대기"; 
			hmap = new PurchaseDetailDao().selectPCDstatus(con, hmap, status);
			if(hmap.get(status) != null) {
				status = "매입수락";
				hmap = new PurchaseDetailDao().selectPCDstatus(con, hmap, status);
			}else {
				status = "매입신청거절";
				hmap = new PurchaseDetailDao().selectPCDstatus(con, hmap, status);
			}*/
			
			status = "매입완료"; 
			hmap = new PurchaseDetailDao().selectPCDstatus(con, hmap, status);
		}
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectPurchaseOne(int pcid) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;
		
		hmap = new PurchaseAdminDao().selectPurchaseOne(con, pcid);
		
		close(con);
		
		return hmap; 
	}

}
