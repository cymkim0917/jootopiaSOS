package com.kh.jooTopia.order.model.dao;

import java.io.FileNotFoundException; 
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.order.model.vo.POrder;
import com.kh.jooTopia.product.model.dao.ProductAdminDao;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class OrderAdminDao {
	private Properties prop = new Properties();

	public OrderAdminDao() {
		String fileName = ProductAdminDao.class.getResource("/sql/order/orderAdmin-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<POrder> selectAdminTotalOrder(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<POrder> list = null;
		POrder o = null;

		String query = prop.getProperty("selectAdminTotalOrder");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			while(rset.next()) {
				o = new POrder();
				o.setStatus(rset.getString("STATUS"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return list;
	}

	public int getProductListCount(Connection con, String query) {
		//페이징 처리용

		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectPaymentList(Connection con, PageInfo pageInfo) {
		//입금전 리스트 출력
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectPaymentList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "주문완료");

			rset = pstmt.executeQuery();

			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				POrder o = new POrder();

				o.setStatus(rset.getString("STATUS"));
				o.setPoDate(rset.getDate("PODATE"));
				o.setPoId(rset.getInt("POID"));
				o.setdMessage(rset.getString("DMESSAGE"));

				hmap = new HashMap<String,Object>();

				hmap.put("o", o);
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("pName", rset.getString("PNAME"));

				list.add(hmap);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int changeStatusOrder(Connection con, String status, int[] poId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("changeStatusOrder");

		try {
			pstmt = con.prepareStatement(query);

			for(int i = 0; i < poId.length; i++) {
				pstmt.setString(1, status);
				pstmt.setInt(2, poId[i]);

				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
