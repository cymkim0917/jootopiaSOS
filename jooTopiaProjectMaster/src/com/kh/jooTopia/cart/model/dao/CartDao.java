package com.kh.jooTopia.cart.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jooTopia.board.model.dao.BoardDao;
import com.kh.jooTopia.cart.model.vo.Cart;
import static com.kh.jooTopia.common.JDBCTemplate.*;

public class CartDao {
	
	private Properties prop = new Properties();
	
	public CartDao() {
		  String fileName = BoardDao.class.getResource("/sql/cart/cart-query.properties").getPath();
			
				try {
					prop.load(new FileReader(fileName));
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		
	public ArrayList<Cart> selectCartList(Connection con, int uno) {
		ArrayList<Cart> list = null;
		Cart cart = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCartList");
		
		try {
			pstmt = con.prepareStatement(sql);		
			pstmt.setInt(1, uno);
			rs = pstmt.executeQuery();			
			
			list = new  ArrayList<Cart>();
	
			while(rs.next()) {
				cart = new Cart();
				
				cart.setUno(rs.getInt("UNO"));
				cart.setChange_name(rs.getString("CHANGE_NAME"));
				cart.setPid(rs.getInt("PID"));
				cart.setPname(rs.getString("PNAME"));
				cart.setPrice(rs.getInt("PPRICE"));
				cart.setStatus(rs.getString("STATUS"));
				cart.setCartId(rs.getInt("CARTID"));
				//
				list.add(cart);
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

	public int deleteCart(Connection con, int[] delList) {
		PreparedStatement pstmt = null;
		int result = 0;
		int count = 0;
		String sql = prop.getProperty("deleteCart");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			for (int i = 0; i < delList.length; i++) {
				pstmt.setInt(1, delList[i]);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return 0;
	}

}
