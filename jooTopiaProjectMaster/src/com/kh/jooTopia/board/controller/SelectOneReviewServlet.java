package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;

@WebServlet("/selectOneReview.do")
public class SelectOneReviewServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public SelectOneReviewServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int num = Integer.parseInt(request.getParameter("num"));
      
      HashMap<String,Object> hmap = new BoardService().reviewReadPage(num);
      
      
      //가
      System.out.println("list in servlet : " + hmap);
      
      String page="";
      
      if(hmap != null) {
         page="views/board/reviewReadPage.jsp";
         request.setAttribute("board",hmap.get("board"));
         request.setAttribute("list", hmap);
         
         System.out.println(hmap);
      }else {
         page="views/common/errorPage.jsp";
         request.setAttribute("msg", "사진게시판 상세보기 실패!");
         System.out.println("조회실패");
      }
      request.getRequestDispatcher(page).forward(request, response);
   }
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}