package com.kh.jooTopia.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/updateQues.do")
public class RealUpdateQaAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RealUpdateQaAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		
		if(ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;		
			
			//절대 경로뽑기
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println(root);		
			
			//파일 저장 경로 설정
			String filePath = root + "images_upload/";
			File isDir = new File(filePath);

			
			//거꾸로 
			MultipartRequest multiRequest = 
					new MultipartRequest(request, filePath,maxSize,"UTF-8",
					new JootopiaFileRenamePolicy());
		
			String str2[] = multiRequest.getParameterValues("fid");
			
			String changeName[] =  multiRequest.getParameterValues("changeName");
			String originName[] =  multiRequest.getParameterValues("originName");
			System.out.println(str2.length + "==================================");
			int fid[] = new int[str2.length];
			System.out.println("fid + " +fid.length);
			
			for(int i =0; i < fid.length; i++) {
				fid[i] = Integer.parseInt(str2[i]);
				System.out.println(fid[i]);
			}
		
				
			Board board = new Board();
			board.setbId(Integer.parseInt(multiRequest.getParameter("bid")));
			System.out.println("bid : " + board.getbId());
			
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
			System.out.println("board uno : " + board.getuNo());
			
			int result = 0;


			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			String[] orgFiles = new BoardService().deleteFiles(fid);
/*			
			for (int i = 0; i < orgFiles.length; i++) {
				File delFiles = new File(filePath + orgFiles[i]);
				delFiles.delete();
			}*/
			for(int i = originFiles.size() -1; i>=0; i--) {
				Attachment att = new Attachment();
				att.setFilePath(filePath);
				att.setfId(fid[originFiles.size()-1-i]);
				
				if(originFiles.get(i)==null) att.setOriginName(originName[i]);
				else att.setOriginName((originFiles.get(i)));
				
				if(saveFiles.get(i)==null) att.setChangeName(changeName[i]);
				else {
					att.setChangeName((saveFiles.get(i)));
					
					//DB에서 가져온 값은 orgFiles
					File delFiles = new File(filePath + orgFiles[i]);
					/*delFiles.delete();*/
				}
				
				fileList.add(att);
			}

			System.out.println("origin null");
			if (originFiles.get(0) == null && originFiles.get(1) == null)
				 result = new BoardService().updateQaAContent(board);
			else result = new BoardService().updateQaA(board,fileList);
			
			
			PrintWriter out = response.getWriter();

			if (result > 0) {
				System.out.println("업로드 성공");
				out.println("<script>alert('게시글 수정에 성공했습니다');</script>");
				response.sendRedirect(request.getContextPath() + "/selectQaA.do?num=" + board.getbId());

			} else {
				for (int i = 0; i < saveFiles.size(); i++) {
					File fail = new File(filePath + saveFiles.get(i));
					fail.delete();
				}
				out.println("<script>alert('게시글이 등록에 실패했습니다.');</script>");
				/*
				 * request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,
				 * response);
				 */
			}
			out.flush();
			out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
