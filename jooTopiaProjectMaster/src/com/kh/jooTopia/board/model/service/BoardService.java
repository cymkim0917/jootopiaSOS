package com.kh.jooTopia.board.model.service;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import static com.kh.jooTopia.common.JDBCTemplate.*;
import static com.kh.jooTopia.common.JDBCTemplate.getConnection;

import com.kh.jooTopia.board.model.dao.BoardDao;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.board.model.vo.Notice;


public class BoardService {
   
   //전체 출력
   public HashMap<String, Object> selectList(){
      Connection con = getConnection();
      /*ArrayList<Notice> list = new BoardDao().selectList(con);*/
      HashMap<String, Object> hmap = new BoardDao().selectList(con);
      
      close(con);
      
      return hmap;
   }
   
   //상세
   public Notice selectOne(int num) {
      Connection con = getConnection();
      Notice n = new BoardDao().selectOne(con,num);
      int result = 0;
     
      if(n != null) {
         result = new BoardDao().updateCount(con, n.getbNo());
         System.out.println("n is not null");
         System.out.println("result : " + result);
      }
      if(result > 0) {
          commit(con);
       }else {
          rollback(con);
       }
      close(con);
      
      return n;
   }

   
   //공지글 카운트(조회수)
   public int getNoticeListCount() {
      Connection con = getConnection();
   
      int listCount = new BoardDao().getNoticeListCount(con);
      System.out.println("서비스 카운트" + listCount);
      
      close(con);
      
      return listCount;
   }
   
   

   public int insertPhote(Board board, ArrayList<Attachment> fileList) {
      Connection con = getConnection();
      
      int returnResult = 0;
      
      int boardResult = new BoardDao().insertQaAContent(con,board);
      
      if(boardResult>0) {
         int bId = new BoardDao().selectCurrval(con);
         
         for (int i = 0; i < fileList.size(); i++) {
            fileList.get(i).setbId(bId);
         }
      }
      
      int insertResult = new BoardDao().insertQaAPhoto(con,fileList);
      
      if(boardResult > 0 && insertResult == fileList.size()) {
         commit(con);
         returnResult = 1;
      }else {
         rollback(con);
         returnResult = 0;
      }
      
      close(con);
      
      return returnResult;
   }
   
   

   
   
   public ArrayList<Board> selectBoardList(int uno) {
      
      Connection con = getConnection();
      ArrayList<Board> list = new BoardDao().selectBoardList(uno,con);
      
      close(con);
      
      return list;
      
   }

   public HashMap<String, Object> selectQaAMap(int bid) {
      Connection con = getConnection();
      HashMap<String, Object> queMap = null;
      int ctnResult = new BoardDao().updateCount(con, bid);
      
      if(ctnResult > 0) {
         commit(con);
         
         queMap = new BoardDao().selectQaA(con, bid);
      }else {
         rollback(con);
      }

      return queMap;
   }
   public int updateQaA(Board board, ArrayList<Attachment> fileList) {
   Connection con = getConnection();
      
      int returnResult = 0;
      
      int boardResult = new BoardDao().upDateQaAContent(con,board);
      System.out.println("boardResult" + boardResult);
      if(boardResult>0) {
         /*int bId = new BoardDao().selectCurrval(con);*/
         
         for (int i = 0; i < fileList.size(); i++) {
            fileList.get(i).setbId(board.getbId());
         }
      }
      
      int updateResult = new BoardDao().updateQaAPhoto(con,fileList);
      System.out.println("updateResult" + updateResult);
      if(boardResult > 0 && updateResult == fileList.size()) {
         commit(con);
         returnResult = 1;
      }else {
         rollback(con);
         returnResult = 0;
      }
      
      close(con);
      
      return returnResult;
   }


  /* public ArrayList<Board> selectFaqMembershipList() {
      
      Connection con = getConnection();
      ArrayList<Board> list = new BoardDao().selectFaqMembershipList(con);
      
      close(con);
      
      return list;
   }*/

   public int updateQaAContent(Board board) {
      Connection con= getConnection();
      
      int boardResult = new BoardDao().upDateQaAContent(con,board);
      
      if(boardResult >0) {
         commit(con);
      }else {
         rollback(con);
      }
      
      close(con);
      
      return boardResult;
   }
   public String[] deleteFiles(int[] fid) {
      Connection con= getConnection();
      
      String[] files = new BoardDao().deleteFiles(con,fid);
      
      close(con);
      
      return files;

   }

   public ArrayList<Board> searchList(Board board, int searchType, String searchText) {
      Connection con = getConnection();
      
      ArrayList<Board> list = null;
      
      switch(searchType) {
      case 1:
         list = new BoardDao().titleSearchList(con,board,searchText);//제목으로 검색
         break;
      case 2: 
         list = new BoardDao().contentSearchList(con,board,searchText);//내용으로 검색
         break;
      case 3:
         list = new BoardDao().contentAllSearchList(con,board,searchText);//제목+내용
         break;
      }

      return list;
   }
   
   //(s) FAQ 메인 전체리스트 

   public ArrayList<Board> selectFaqTotalList(String fCategory) {
      Connection con = getConnection();
      
      ArrayList<Board> list = new BoardDao().selectFaqTotalList(con,fCategory);
      
      close(con);
      
      return list;
   }
   
   //(s) FAQ 개별 카테고리별 리스트
   public ArrayList<Board> selectFaqCategoryList(String fCategory) {
      
      Connection con = getConnection();
      ArrayList<Board> list = new BoardDao().selectFaqCategoryList(con,fCategory);
      
      System.out.println("list in service : " + list);
      close(con);
      return list;
   }
   
   
   public Board selectOneFaqTotalList(int num) {
      Connection con = getConnection();
      Board b = new BoardDao().selectOneFaqTotalList(con,num);
      
      if(b !=null) {
         int result=new BoardDao().updateCount(con,b.getbId());
         
         if(result > 0) {
            commit(con);
         }else {
            rollback(con);
         }
      }
      
      close(con);
      
      
      return b;
   }
   public Board selectOneFaqCategoryList(int num) {

      Connection con = getConnection();
      Board b = new BoardDao().selectOneFaqCategoryList(con,num);
      
      if(b !=null) {
         int result=new BoardDao().updateCount(con,b.getbId());
         
         if(result > 0) {
            commit(con);
         }else {
            rollback(con);
         }
      }
      
      close(con);
      
      
      return b;
      
      
   }
   //(s) selectThumbnailList(전체 상품후기 리스트)
  /* public ArrayList<HashMap<String, Object>> selectReviewTotalList() {
      Connection con = getConnection();
      HashMap<String, Object> hmap = new BoardDao().selectReviewTotalList(con);
     
      close(con);
      
      
      return hmap;*/
   
   public ArrayList<HashMap<String, Object>> selectReviewTotalList() {
	      Connection con = getConnection();
	      ArrayList<HashMap<String, Object>> list = new BoardDao().selectReviewTotalList(con);
	     
	      close(con);
	      
	      return list;
   }
   
   
   
   
   //(s) 후기쓰는 페이지
   public int reviewInsertForm(Board b, ArrayList<Attachment> fileList) {
      Connection con = getConnection();
      int result = 0;
      int result1=new BoardDao().reviewInsertForm(con,b);
      
      if(result1>0) {
         int bid=new BoardDao().selectCurrval(con);
         
         for(int i =0; i <fileList.size(); i++) {
            fileList.get(i).setbId(bid);
         }
      }
      
      int result2 = new BoardDao().insertAttachment(con, fileList);
      if(result1>0 && result2==fileList.size()) {
         commit(con);
         result=1;
      }else {
         rollback(con);
         result=0;
      }
      close(con);
      
      
      return result;
   }
   
   //(s) 후기게시판 읽기----------------------------------------------------
   public HashMap<String, Object> reviewReadPage(int num) {
      Connection con = getConnection();
      HashMap<String,Object> hmap = new BoardDao().reviewReadPage(con,num);
      
      if(hmap !=null) {
    	  int result = new BoardDao().updateCount(con, num);
    	  
    	  if(result > 0) {
    		  commit(con);
    	  }else {
    		  rollback(con);
    	  }
      }
      
      return hmap;
 
      
   }
   
   
   
   
   
   
   
   
}


   
