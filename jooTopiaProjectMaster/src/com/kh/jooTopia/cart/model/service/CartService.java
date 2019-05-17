package com.kh.jooTopia.cart.model.service;

import java.sql.*;
import java.util.ArrayList;

import com.kh.jooTopia.cart.model.dao.CartDao;
import com.kh.jooTopia.cart.model.vo.Cart;
import static com.kh.jooTopia.common.JDBCTemplate.*;

public class CartService {//

	public ArrayList<Cart> selectCartList(int uno) {
		Connection con = getConnection();
		
		ArrayList<Cart> list = new CartDao().selectCartList(con,uno);
		
		
		close(con);
		
		return list;
	}

	public int deleteCart(int[] delList,int uno) {
		Connection con = getConnection();
		
		int result = new CartDao().deleteCart(con,delList,uno);
		
		if(result > 0 ) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

}
