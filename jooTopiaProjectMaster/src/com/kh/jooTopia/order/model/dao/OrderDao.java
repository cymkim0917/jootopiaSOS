package com.kh.jooTopia.order.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jooTopia.board.model.dao.BoardDao;
import com.kh.jooTopia.order.model.vo.Order;
import static com.kh.jooTopia.common.JDBCTemplate.*;

public class OrderDao {
	private Properties prop = new Properties();
	
	public OrderDao() {
		String fileName = BoardDao.class.getResource("/sql/member/order-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Order> selectOrderList(Connection con, int uno) {
		ArrayList<Order> list = null;
		Order order = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("orderList");
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, uno);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Order>();
			
			while(rs.next()) {
				order = new Order();
				order.setUno(uno);
				order.setPid(rs.getInt(1));
				order.setPoid(rs.getInt(2));
				order.setPname(rs.getString(3));
				order.setPpice(rs.getInt(4));
				order.setpDate(rs.getDate(5));
				order.setStatus(rs.getString(6));
				order.setAddress(rs.getString(7));
				order.setOdid(rs.getInt(8));
				list.add(order);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public Order orderDetail(Connection con, int poid,int uno) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("orderDetail");
		Order order = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, poid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				order = new Order();
				order.setUno(uno);
				order.setPid(rs.getInt(1));
				order.setPoid(rs.getInt(2));
				order.setPname(rs.getString(3));
				order.setPpice(rs.getInt(4));
				order.setpDate(rs.getDate(5));
				order.setStatus(rs.getString(6));
				order.setAddress(rs.getString(7));
				order.setChange_name(rs.getString(8));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return order;
	}

}
