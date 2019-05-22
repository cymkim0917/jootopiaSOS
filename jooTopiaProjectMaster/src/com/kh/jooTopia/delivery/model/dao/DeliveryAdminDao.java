package com.kh.jooTopia.delivery.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.delivery.model.vo.Delivery;
import com.kh.jooTopia.order.model.vo.POrder;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class DeliveryAdminDao {

private Properties prop = new Properties();

	public DeliveryAdminDao() {
		String fileName = DeliveryAdminDao.class.getResource("/sql/delivery/deliveryAdmin-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertDelivery(Connection con, int[] poId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertDelivery");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i < poId.length; i++) {
				pstmt.setInt(1, poId[i]);
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectDeliveryList(Connection con, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectDeliveryList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "배송완료");
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				Delivery d = new Delivery();
				//D.DID, D.STATUS, D.START_DATE
				d.setdId(rset.getInt("DID"));
				d.setStatus(rset.getString("STATUS"));
				d.setStartDate(rset.getDate("START_DATE"));
				hmap.put("d", d);
				
				POrder o = new POrder();
				//O.POID, O.PODATE, O.NAME, O.DMESSAGE
				o.setPoId(rset.getInt("POID"));
				o.setPoDate(rset.getDate("PODATE"));
				o.setdMessage(rset.getString("DMESSAGE"));
				o.setName(rset.getString("NAME"));
				hmap.put("o", o);
				
				//P.PNAME
				hmap.put("pName", rset.getString("PNAME"));
				
				list.add(hmap);
				System.out.println("hmap : " + hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public HashMap<String, Object> selectDeliveryOne(Connection con, int dId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectDeliveryOne");
		
		return hmap;
	}
}
