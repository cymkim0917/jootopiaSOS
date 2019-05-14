package com.kh.jooTopia.release.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.jooTopia.common.JDBCTemplate.*;
import com.kh.jooTopia.release.model.dao.ReleaseAdminDao;
import com.kh.jooTopia.release.model.vo.ReleaseAdmin;

public class ReleaseAdminService {

	public ArrayList<ReleaseAdmin> selectAdminList() {
		
		Connection con = getConnection();
		
		ArrayList<ReleaseAdmin> list = new ReleaseAdminDao().selectAdminList(con);
		
		close(con);
		
		return list;
	}

	
	
	public int insertAdminRelease(ReleaseAdmin r) {
		
		Connection con = getConnection();
		
		int result = new ReleaseAdminDao().insertAdminRelease(con, r);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

}
