
package com.kh.jooTopia.buy.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.jooTopia.common.JDBCTemplate.*;

import com.kh.jooTopia.buy.model.vo.BuyWaitAdmin;
 
public class BuyWaitAdminDao {
	private Properties prop = new Properties();
	
	public BuyWaitAdminDao() {
		String fileName = BuyWaitAdminDao.class.getResource("/sql/buywait/buywaitAdmin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}

	public ArrayList<BuyWaitAdmin> selectAdminList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BuyWaitAdmin> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "매입대기중");
			pstmt.setString(2, "매입중");
			pstmt.setString(3, "현장거절");
			pstmt.setString(4, "매입완료");
			
			rset = pstmt.executeQuery();
			list = new ArrayList<BuyWaitAdmin>();
			BuyWaitAdmin b = new BuyWaitAdmin();
			int count = 0;
			while(rset.next()) {
				if(rset.getInt("PCID") == b.getPcid() ) {
					b.setPcdId(rset.getInt("PCDID"));
					b.setStatus(rset.getString("STATUS"));
				} else {
					if(count != 0) {
						list.add(b);
					}
					b = new BuyWaitAdmin();
					b.setPcid(rset.getInt("PCID"));
					b.setPcdId(rset.getInt("PCDID"));
					b.setStatus(rset.getString("STATUS"));
					b.setApplicant(rset.getString("APPLICANT"));
					b.setAppPhone(rset.getString("APPLICANT_PHONE"));
					b.setcGroup(rset.getString("CGROUP"));
					b.setName(rset.getString("NAME"));
					count++;
				}
			}
			list.add(b);
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}

