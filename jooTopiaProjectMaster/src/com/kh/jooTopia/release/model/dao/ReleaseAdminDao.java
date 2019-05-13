package com.kh.jooTopia.release.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import com.kh.jooTopia.release.model.vo.ReleaseAdmin;

public class ReleaseAdminDao {
	
	private Properties prop = new Properties();
	
	public ReleaseAdminDao() {
		
		String fileName = ReleaseAdminDao.class.getResource("/sql/release/release-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
			
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}

	public ArrayList<ReleaseAdmin> selectAdminList(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ReleaseAdmin> list = null;
		
		String query = prop.getProperty("selectList");
		try {
			stmt = con.createStatement();			
			rset = stmt.executeQuery(query);			
			list = new ArrayList<ReleaseAdmin>();
			System.out.println(list);
			
			while(rset.next()) {
				ReleaseAdmin r = new ReleaseAdmin();
				
				r.setno(rset.getInt("NO"));
				r.setoNo(rset.getInt("ONO"));
				r.setdNo(rset.getInt("DNO"));
				r.sethNo(rset.getInt("HNO"));
				r.setLocationNo(rset.getInt("LOCATIONNO"));
				
				list.add(r);
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
