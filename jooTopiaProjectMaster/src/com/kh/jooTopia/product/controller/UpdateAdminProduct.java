package com.kh.jooTopia.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
public class UpdateAdminProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateAdminProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			// 전송 파일 용량 제한 : 10Mbyte로 제한
			int maxSize = 1024 * 1024 * 10;  // 1Kbyte : 1024, 1Mbyte : 1024*1024
			
			// 웹 서버 컨테이너 경로 추출
			String root = request
							.getSession()
			 				.getServletContext()  // contextRoot
							.getRealPath("/"); 	  // 절대경로 가져와라
			
			// 파일 저장 경로 설정
			String filePath = root + "images\\product\\";
			// String filePath = root + "thumbnail_upload/";
			
			// 한글도 있으니까 "UTF-8" 인코딩 방식을 알려주어야 한다. 
			// MyReNamePolicy는 고급기술 -> 커스터 마이징 하는 것 
			MultipartRequest multiRequest 
					= new MultipartRequest(request, filePath, maxSize, 
							"UTF-8", new JootopiaFileRenamePolicy());
			
			// 저장한 파일(변경된)의 이름을 저장할 arrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			// 원본 파일이름을 저장할 arrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			// Iterator같은거 반복할 수 있게 해주는거 
			Enumeration<String> files = multiRequest.getFileNames(); // 파일의 이름을 꺼내옴

			// hasMoreElement == hasMoreToken
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				// 파일시스템이름 -> 우리 컴퓨터에 저장되어 있는 이름 -> 변경시킨 이름
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile name : " + multiRequest.getOriginalFileName(name));
			} // while
			
			int pNo = Integer.parseInt(multiRequest.getParameter("pNo"));
			String pName = multiRequest.getParameter("pName");
			int pPrice = Integer.parseInt(multiRequest.getParameter("pPrice"));
			String pContent = multiRequest.getParameter("pContent");
			String category = multiRequest.getParameter("small");
			
			// Product객체 생성
			Product p = new Product();
			int cNo = 0;
			
			p.setpNo(pNo);
			p.setpName(pName);
			p.setpPrice(pPrice);
			p.setpContent(pContent);
			switch (category) {
			case "침대" : cNo = 1; break;
			case "옷장" : cNo = 2; break;
			case "화장대" : cNo = 3; break;
			case "침실수납장" : cNo = 4; break;
			case "책상" : cNo = 5; break;
			case "책장" : cNo = 6; break;
			case "사무용의자" : cNo = 7; break;
			case "서재수납장" : cNo = 8; break;
			case "식탁" : cNo = 9; break;
			case "식탁의자" : cNo = 10; break;
			case "주방수납장" : cNo = 11; break;
			case "렌지대" : cNo = 12; break;
			case "테이블" : cNo = 13; break;
			case "거실장" : cNo = 14; break;
			case "쇼파" : cNo = 15; break;
			case "거실수납장" : cNo = 16; break;
			}
			p.setcNo(cNo);
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			System.out.println("originFiles : " + originFiles);
			System.out.println("originFiles size : " + originFiles.size());
			
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				// Attachment객체 생성
				Attachment at = new Attachment();
				
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			System.out.println("servlet for : " + fileList.size());
			
			int result = new ProductAdminService().updateProduct(p, fileList);
			
			if(result > 0) {
				request.setAttribute("msg", "상품등록 완료");
				request.getRequestDispatcher("views/admin/product/productInsertList.jsp").forward(request, response);
			}else  {
				// 실패했을 떄는 이미지를 지워주어야 한다.
				for(int i = 0; i < saveFiles.size(); i++) {
					// java.io 
					File failedFile = new File(filePath + saveFiles.get(i));
					
					// 사진을 지우면 true를 리턴 처음지우면 true가 나올거임
					System.out.println(failedFile.delete());
				}
				
				if (result == -1){
					request.setAttribute("msg", "상품등록 실패");
					request.getRequestDispatcher("/views/admin/product/productInsertList.jsp").forward(request, response);
					return;
				}
				
				request.setAttribute("msg", "상품이미지 등록 실패");
				request.getRequestDispatcher("/views/admin/product/productInsertList.jsp").forward(request, response);
				
			}
		} // if
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
