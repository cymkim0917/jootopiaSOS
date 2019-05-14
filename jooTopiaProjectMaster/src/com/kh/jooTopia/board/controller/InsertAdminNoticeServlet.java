package com.kh.jooTopia.board.controller;

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

import com.kh.jooTopia.board.model.service.BoardAdminService;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.common.JootopiaFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertAdminNoticeServlet
 */
@WebServlet("/insertAdminNotice.do")
public class InsertAdminNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdminNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");*/
		
		/*System.out.println(category);
		System.out.println(title);
		System.out.println(content);*/
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxsize = 1024*1024 * 100;
			
			String root = request.getSession()
								.getServletContext()
								.getRealPath("/");
			System.out.println(root);
			
			String filePath = root+"images/notice/";
			
			MultipartRequest multiReq = new MultipartRequest(request, filePath, maxsize, "utf-8", new JootopiaFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiReq.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				System.out.println("name : " + name);
				
				saveFiles.add(multiReq.getFilesystemName(name));
				originFiles.add(multiReq.getOriginalFileName(name));
				
			}
			
			String multiTitle = multiReq.getParameter("title");
			String multiContent = multiReq.getParameter("content");
			
			System.out.println(multiTitle);
			System.out.println(multiContent);
			
			Board board = new Board();
			board.setbTitle(multiTitle);
			board.setbContent(multiContent);
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			 for(int i = originFiles.size()-1; i>=0; i--) {
				 Attachment attach = new Attachment();
				 attach.setFilePath(filePath);
				 attach.setOriginName(originFiles.get(i));
				 attach.setChangeName(saveFiles.get(i));
				 
				 fileList.add(attach);
			 }	
			
			 int result = new BoardAdminService().insertBoard(board, fileList);
			
			 if(result>0) {
				 response.sendRedirect(request.getContextPath()+"/adminBoardList.do");
				 
			 }else {
				 for(int i=0; i<saveFiles.size(); i++) {
					 File failedFile = new File(filePath + saveFiles.get(i));
					 
					 
				 }
				 request.getRequestDispatcher("views/common/errorPage500.jsp");
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
