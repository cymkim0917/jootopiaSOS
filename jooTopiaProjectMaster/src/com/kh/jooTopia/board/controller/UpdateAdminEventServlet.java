package com.kh.jooTopia.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
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
 * Servlet implementation class UpdateAdminEventServlet
 */
@WebServlet("/updateAdminEvent.do")
public class UpdateAdminEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdminEventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*100;
			
			String root =request.getSession().getServletContext().getRealPath("/");
			
			String filePath = root+"images/event";
			
			MultipartRequest multiReq = new MultipartRequest(request, filePath, maxSize, "utf-8", new JootopiaFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiReq.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiReq.getFilesystemName(name));
				originFiles.add(multiReq.getOriginalFileName(name));
				
			}
			
			String multiTitle = multiReq.getParameter("title");
			String multiContent = multiReq.getParameter("content");
			String sModiDate = multiReq.getParameter("startDate");
			String fModiDate = multiReq.getParameter("endDate");
			
			Date startDate = Date.valueOf(sModiDate);
			Date finishDate = Date.valueOf(fModiDate);
				
			int multibId =Integer.parseInt(multiReq.getParameter("bId"));
			int img1Fid = Integer.parseInt(multiReq.getParameter("img1Fid"));
			int img2Fid = Integer.parseInt(multiReq.getParameter("img2Fid"));
			int [] fId = {img1Fid, img2Fid};
			
			Board board = new Board();
			board.setbId(multibId);
			board.setbTitle(multiTitle);
			board.setbContent(multiContent);
			board.setStartDate(startDate);
			board.setFinishDate(finishDate);
			
			Attachment originFile1 = null;
			Attachment originFile2 = null;
			
			originFile1 = new BoardAdminService().selectAttach(fId[0]);
			originFile2 = new BoardAdminService().selectAttach(fId[1]);
				
			
			File updateDeleteFile1 = new File(originFile1.getFilePath()+originFile1.getChangeName());
			File updateDeleteFile2 = new File(originFile2.getFilePath()+originFile2.getChangeName());
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			for(int i = originFiles.size()-1; i>=0; i--) {
				 Attachment attach = new Attachment();
				 attach.setFilePath(filePath);
				 attach.setOriginName(originFiles.get(i));
				 attach.setChangeName(saveFiles.get(i));
				 attach.setfId(fId[i]);
				
				 fileList.add(attach);
			 }
			
			int result = new BoardAdminService().updateEvent(board, fileList);
			
			if(result>0) {
				 response.sendRedirect(request.getContextPath()+"/adminBoardList.do");
				 updateDeleteFile1.delete();
				 updateDeleteFile2.delete();
				 
			 }else {
				 for(int i=0; i<saveFiles.size(); i++) {
					 File failedFile = new File(filePath + saveFiles.get(i));
					 failedFile.delete();
					 
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
