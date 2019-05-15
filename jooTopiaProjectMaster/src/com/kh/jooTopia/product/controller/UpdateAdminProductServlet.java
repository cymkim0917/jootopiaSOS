package com.kh.jooTopia.product.controller;

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

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.common.JootopiaFileRenamePolicy;
import com.kh.jooTopia.product.model.service.ProductAdminService;
import com.kh.jooTopia.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/updateAdminProduct.do")
public class UpdateAdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateAdminProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String filePath = root + "images\\product\\";
			
			MultipartRequest multiRequest 
					= new MultipartRequest(request, filePath, maxSize, 
							"UTF-8", new JootopiaFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			Enumeration<String> files = multiRequest.getFileNames();

			while(files.hasMoreElements()) {
				String name = files.nextElement();
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			
			int pId = Integer.parseInt(multiRequest.getParameter("pId"));
			String pName = multiRequest.getParameter("pName");
			int pPrice = Integer.parseInt(multiRequest.getParameter("pPrice"));
			String pContent = multiRequest.getParameter("pContent");
			String cGroup = multiRequest.getParameter("cGroup");
			String cName = multiRequest.getParameter("cName");
			
			// Product객체 생성
			Product p = new Product();
			int cId = 0;
			
			p.setpId(pId);
			p.setpName(pName);
			p.setpPrice(pPrice);
			p.setpContent(pContent);
			if(cGroup.equals("침실")) {
				switch (cName) {
				case "침대" : cId = 1; break;
				case "옷장" : cId = 2; break;
				case "화장대" : cId = 3; break;
				case "침실수납장" : cId = 4; break;
				case "기타" : cId = 5; break;
				}
			}else if(cGroup.equals("서재")) {
				switch (cName) {
				case "책상" : cId = 11; break;
				case "책장" : cId = 12; break;
				case "사무용의자" : cId = 13; break;
				case "서재수납장" : cId = 14; break;
				case "기타" : cId = 15; break;
				}
			}else if(cGroup.equals("주방")) {
				switch (cName) {
				case "식탁" : cId = 21; break;
				case "식탁의자" : cId = 22; break;
				case "주방수납장" : cId = 23; break;
				case "렌지대" : cId = 24; break;
				case "기타" : cId = 25; break;
				}
			}else if(cGroup.equals("거실")) {
				switch (cName) {
				case "테이블" : cId = 31; break;
				case "거실장" : cId = 32; break;
				case "쇼파" : cId = 33; break;
				case "거실수납장" : cId = 34; break;
				case "기타" : cId = 35; break;
				}
			}else {
				cId = 41;
			}
			p.setcId(cId);
			
			int fId = Integer.parseInt(multiRequest.getParameter("fId"));
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				Attachment at = new Attachment();
				
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			
			int result = new ProductAdminService().updateProduct(p, fId, fileList);
			
			/*PrintWriter out = response.getWriter();*/
			String msg = "";
			
			if(result > 0) {
				msg = "상품등록 완료";
				/*out.println("<script>alert('"+ msg +"'); location.href='"+ view +"';</script>");
				out.flush();
				out.close();*/
				/*response.sendRedirect(view);*/
				response.sendRedirect("/jootopia/adminProductList.do");
			}else  {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(filePath + saveFiles.get(i));
					
					System.out.println("사진 업로드 삭제 여부 : " + failedFile.delete());
				}
				msg = "상품등록 실패";
				/*out.println("<script>alert('"+ msg +"'); location.href='"+ view +"';</script>");
				out.flush();
				out.close();*/
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("views/common/errorPage500.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
