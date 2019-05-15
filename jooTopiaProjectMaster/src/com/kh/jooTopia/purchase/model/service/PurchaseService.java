package com.kh.jooTopia.purchase.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jooTopia.board.model.dao.BoardDao;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.product.model.dao.CategoryDao;
import com.kh.jooTopia.purchase.model.dao.PurchaseDao;
import com.kh.jooTopia.purchase.model.vo.Purchase;
import static com.kh.jooTopia.common.JDBCTemplate.*;

public class PurchaseService {

	public int insertPurchase(Board b, Purchase p, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		// 1. category이름으로 cid조회
		int cid = new CategoryDao().selectCid(con, p.getcName());
		System.out.println("cid : " + cid);
		if(cid <= 0) {
			System.out.println("cid error");
		}
		
		// 2. Purchase테이블에 데이터 삽입
		int result1 = new PurchaseDao().insertPurchase(con, p, cid);
		if(result1 < 1) {
			System.out.println("cid error");
		}
		
		// 3. 방금 insert한 Purchase테이블의 pcid조회
		int pcid = new PurchaseDao().selectCurrval(con);
		if(pcid < 1) {
			System.out.println("pcid error");
		}
		
		// 4. Board테이블에 매입게시판 데이터 삽입
		int result2 = new PurchaseDao().insertBoardBno5(con, b, pcid);
		if(result2 < 1) {
			System.out.println("result2 error");
		}
		// 5. 방금 insert한 Board테이블의 bid조회
		int bid = new BoardDao().selectCurrval(con);
		if(bid < 1) {
			System.out.println("bid error");
		}
		
		// 6. 이미지 파일을 Attachment테이블에 삽입
		int result3= new PurchaseDao().insertPurchaseImage(con, bid, fileList);
		
		// int result2 = new BoardDao().insertAttachment(con, fileList);
		
/*		result = cid + result1 + pcid + result2 + bid + result3;
		if(result > 5) {
			commit(con);
		}else {
			rollback(con); 
		}
		close(con);
 */
		
		return result;
		
	}

}
