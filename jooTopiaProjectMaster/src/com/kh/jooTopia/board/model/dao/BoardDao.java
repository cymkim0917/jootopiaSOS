package com.kh.jooTopia.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.board.model.dao.BoardDao;
import static com.kh.jooTopia.common.JDBCTemplate.*;

public class BoardDao {
	private Properties prop = new Properties();

	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertQaAContent(Connection con, Board board) {
		// insertQaAContent = INSERT INTO
		// BOARD(BID,BNO,BTYPE,BTITLE,BCONTENT,STATUS,ENROLL_DATE,MODIFY_DATE,UNO)
		// VALUES (SEQ_BID.NEXTVAL,SEQ_BNO3.NEXTVAL,3,?,?,'Y',SYSDATE,SYSDATE,?)
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertQaAContent");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getbTitle());
			pstmt.setString(2, board.getbContent());
			pstmt.setInt(3, board.getuNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectcurrval(Connection con) {
		int bid = 0;
		String sql = prop.getProperty("selectCurrval");
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				bid = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return bid;
	}

	public int insertQaAPhoto(Connection con, ArrayList<Attachment> fileList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQaAPhoto");

		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fileList.get(i).getbId());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());
				
				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

}
