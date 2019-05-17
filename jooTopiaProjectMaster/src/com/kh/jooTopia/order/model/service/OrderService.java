package com.kh.jooTopia.order.model.service;

import java.sql.*;
import java.util.ArrayList;

import com.kh.jooTopia.order.model.dao.OrderDao;
import com.kh.jooTopia.order.model.vo.Order;
import static com.kh.jooTopia.common.JDBCTemplate.*;

public class OrderService {

	public ArrayList<Order> selectOrderList(int uno) {
		Connection con = getConnection();
		ArrayList<Order> list = new OrderDao().selectOrderList(con,uno);
				
		close(con);
		
		return list;
	}

}
