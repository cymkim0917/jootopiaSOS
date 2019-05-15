package com.kh.jooTopia.heap.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.jooTopia.common.JDBCTemplate.close;

import com.kh.jooTopia.heap.model.vo.HeapAdmin;
 

public class HeapAdminDao {
	
private Properties prop = new Properties();
	
	public HeapAdminDao() {
		
		String fileName = HeapAdminDao.class.getResource("/sql/heap/heap-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
			
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}

	public ArrayList<HeapAdmin> selectAdminList(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HeapAdmin> list = null;
		
		String query = prop.getProperty("selectList");
		try {
			stmt = con.createStatement();			
			rset = stmt.executeQuery(query);			
			list = new ArrayList<HeapAdmin>();
			System.out.println(list);
			
			while(rset.next()) {
				HeapAdmin h = new HeapAdmin();
				
				h.sethId(rset.getInt("HID"));
				h.setPcNo(rset.getInt("PCNO"));
				h.setpNo(rset.getInt("PNO"));							
				
				list.add(h);
			}
			System.out.println(list);
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		
		return list;
	}

}
