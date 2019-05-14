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

import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.common.JootopiaFileRenamePolicy;
import com.kh.jooTopia.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.sun.mail.handlers.multipart_mixed;

/**
 * Servlet implementation class QaAInsertServlet
 */
@WebServlet("/insertQues.do")
public class QaAInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaAInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Board board = new Board();
		
		if(ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;		
			
			//절대 경로뽑기
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println(root);		
			
			//파일 저장 경로 설정
			String filePath = root + "images_upload/";
			File isDir = new File(filePath);

			MultipartRequest multiRequest = 
					new MultipartRequest(request, filePath,maxSize,"UTF-8",
					new JootopiaFileRenamePolicy());
		
			//지정한 파일의 이름을 저장할 arrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			//원본 파일 이름을 저장할 arrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames(); 
			
			//다음 행이 있는지 확인
			while(files.hasMoreElements()) {

				String name = files.nextElement();
				System.out.println("name : " + name);
				
				// 바뀐 파일 이름  ArrayList
				saveFiles.add(multiRequest.getFilesystemName(name));
				System.out.println("saveFiles : " + saveFiles);
				
				//원본 파일 이름 ArrayList
				originFiles.add(multiRequest.getOriginalFileName(name));
				System.out.println(originFiles);
			}
			
			String multiTitle = multiRequest.getParameter("title");
			String multiContent = multiRequest.getParameter("content");

			board.setbTitle(multiTitle);
			System.out.println("title" + " " + multiTitle);
			
			board.setbContent(multiContent);
			System.out.println("multiContent" + " " + multiContent);
			board.setuNo(member.getUno());
			
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for(int i = originFiles.size() -1; i>=0; i--) {
				
				Attachment att = new Attachment();
				att.setFilePath(filePath);
				att.setOriginName((originFiles.get(i)));
				att.setChangeName((saveFiles.get(i)));
				fileList.add(att);	
			}
			
			int result = new BoardService().insertPhote(board,fileList);
			
			if(result > 0 ) {
				System.out.println("업로드 성공");
				//response.sendRedirect(request.getContextPath() + "/selectThumbnail.bo");
			}else {
				for (int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(filePath + saveFiles.get(i));					
				}
				request.setAttribute("msg", "사진 게시판 등록 실패 !");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
