package com.kh.jooTopia.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.common.JootopiaFileRenamePolicy;
import com.kh.jooTopia.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class SelectReviewWriteServlet
 */
@WebServlet("/insertReview.do")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 100;
			String root = request.getSession()
								 .getServletContext()
								 .getRealPath("/");
			System.out.println("root : "+root);
			
			String filePath = root + "images/review";
			
			MultipartRequest multiRequest =
					new MultipartRequest(request,filePath,maxSize,
							"UTF-8",new JootopiaFileRenamePolicy());
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			
			String multiTitle = multiRequest.getParameter("title");
			String multiContent = multiRequest.getParameter("content");
			
			System.out.println("multiTitle : " + multiTitle);
			
			Board b = new Board();
			Member m = new Member();
			b.setbTitle(multiTitle);
			b.setbContent(multiContent);
			//m.setUserId(String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUno()));
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for (int i = 0; i < originFiles.size(); i++) {
				Attachment at = new Attachment();
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				System.out.println("servlet OriginName:" + at.getOriginName());
				
				fileList.add(at);
			}
			
			int result = new BoardService().reviewInsertForm(b,fileList);
			String page = "";
			if(result > 0) {
				response.sendRedirect(request.getContextPath()+"/selectReviewTotalList.do"); // 데이터를 받으면 리스트가 출력되는 곳으로 뿌려준다. 고로 insertReview가 아닌 selectReviewTotalList.do
			}else {
				for (int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(filePath + saveFiles.get(i));
					failedFile.delete();
					System.out.println("failedFile.delete() in servlet : " + failedFile.delete());
				}
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "사진게시판 등록 실패!");
				request.getRequestDispatcher(page).forward(request, response);
			}
		}
	
	
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
