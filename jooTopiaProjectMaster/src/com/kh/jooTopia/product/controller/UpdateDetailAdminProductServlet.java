package com.kh.jooTopia.product.controller;

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

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.common.JootopiaFileRenamePolicy;
import com.kh.jooTopia.product.model.service.ProductAdminService;
import com.kh.jooTopia.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/updateDetailAdminProduct.do")
public class UpdateDetailAdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateDetailAdminProductServlet() {
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
			
			//수정할 파일을 담을 fileList
			ArrayList<Attachment> fileList = null;

			while(files.hasMoreElements()) {
				String name = files.nextElement();
				saveFiles.add(multiRequest.getFilesystemName(name));
				System.out.println("처음 가져온 체인지파일 : " + multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				System.out.println("처음 가져온 오리진파일 : " + multiRequest.getOriginalFileName(name));
			}
			
			System.out.println("----------------------");
			int mainFId = Integer.parseInt(multiRequest.getParameter("mainFId"));
			int detailFId = Integer.parseInt(multiRequest.getParameter("detailFId"));
			int[] fId = {detailFId, mainFId};
			
			System.out.println("수정 안해서 null인 값 덮어쓰기!");
			Attachment a = null;
			//0 : 상세 | 1 : 메인
			if(saveFiles.get(0) == null && saveFiles.get(1) == null) {
				System.out.println("둘 다 수정/삭제안함");
				//fId로 결과 조회 후 오리진 네임, 체인지 네임 덮어쓰기
				for(int i = 0; i < 2; i++) {
					a = new ProductAdminService().selectAtt(fId[i]);
					
					System.out.println("a : " + a);
					System.out.println("a.getChangeName : " + a.getChangeName());
					System.out.println("a.getOriginName : " + a.getOriginName());
					
					saveFiles.set(i, a.getChangeName());
					System.out.println("saveFiles : " + saveFiles.get(i));
					originFiles.set(i, a.getOriginName());
					System.out.println("originFiles : " + originFiles.get(i));
					
				}
				
			}else if(saveFiles.get(0) != null && saveFiles.get(1) == null){
				System.out.println("상세파일(인덱스0)만 수정/삭제");
				//메인은 그대로, 상세만 기존파일 삭제 후 수정
				//fId로 상세사진의 원본 파일을 삭제하고, 새로운 상세사진을 저장한 뒤
				//fId로 결과 조회 후 오리진 네임, 체인지 네임 덮어쓰기
				for(int i = 0; i < 2; i++) {
					a = new ProductAdminService().selectAtt(fId[i]);
					if(i == 0) {
						//해당 fId의 사진을 삭제
						System.out.println("삭제할 파일명 : " + a.getOriginName());
						System.out.println("삭제할 파일명 : " + a.getChangeName());
						File failedFile = new File(filePath + a.getChangeName());
						System.out.println("사진 업로드 삭제 여부 : " + failedFile.delete());
						
						fileList = new ArrayList<Attachment>();
						Attachment at = new Attachment();
						at.setfId(fId[i]);
						at.setOriginName(originFiles.get(i));
						at.setChangeName(saveFiles.get(i));
						at.setFilePath(filePath);
						
						fileList.add(at);
						
					}else {
						//기존값 덮어쓰기
						saveFiles.set(i, a.getChangeName());
						originFiles.set(i, a.getOriginName());
						System.out.println("saveFiles : " + saveFiles.get(i));
						System.out.println("originFiles : " + originFiles.get(i));
					}
				}
			}else if(saveFiles.get(0) == null && saveFiles.get(1) != null){
				System.out.println("메인파일(인덱스1)만 수정/삭제");
				//상세는 그대로, 메인만 기존파일 삭제 후 수정
				//fId로 메인사진의 원본 파일을 삭제하고, 새로운 메인사진을 저장한 뒤
				//fId로 결과 조회 후 오리진 네임, 체인지 네임 덮어쓰기
				for(int i = 0; i < 2; i++) {
					a = new ProductAdminService().selectAtt(fId[i]);
					
					if(i == 1) {
						//해당 fId의 사진을 삭제
						System.out.println("삭제할 파일명 : " + a.getOriginName());
						System.out.println("삭제할 파일명 : " + a.getChangeName());
						File failedFile = new File(filePath + a.getChangeName());
						System.out.println("사진 업로드 삭제 여부 : " + failedFile.delete());
						
						fileList = new ArrayList<Attachment>();
						Attachment at = new Attachment();
						at.setfId(fId[i]);
						at.setOriginName(originFiles.get(i));
						at.setChangeName(saveFiles.get(i));
						at.setFilePath(filePath);
						
						fileList.add(at);
						
					}else {
						//기존값 덮어쓰기
						saveFiles.set(i, a.getChangeName());
						originFiles.set(i, a.getOriginName());
						System.out.println("saveFiles : " + saveFiles.get(i));
						System.out.println("originFiles : " + originFiles.get(i));
					}
				}
			}else {
				//둘 다 수정
				//fId로 둘 다 원본 파일을 삭제하고, 둘 다 새로운 사진을 저장한 뒤
				//fId로 결과 조회 후 오리진 네임, 체인지 네임 덮어쓰기
				System.out.println("둘 다 수정/삭제");
				fileList = new ArrayList<Attachment>();
				for(int i = 0; i < 2; i++) {
					a = new ProductAdminService().selectAtt(fId[i]);

					File failedFile = new File(filePath + a.getChangeName());
					System.out.println("삭제할 파일명 : " + a.getOriginName());
					System.out.println("삭제할 파일명 : " + a.getChangeName());
					System.out.println("사진 업로드 삭제 여부 : " + failedFile.delete());
					
					Attachment at = new Attachment();
					at.setfId(fId[i]);
					at.setOriginName(originFiles.get(i));
					at.setChangeName(saveFiles.get(i));
					at.setFilePath(filePath);
					
					fileList.add(at);
				}
			}
			
			System.out.println("수정업로드 할 사진 정보들---------");
			if(fileList != null) {
				System.out.println("fileList 사이즈 : " + fileList.size());
				for(int i = 0; i < fileList.size(); i++) {
					System.out.println("수정하려는 사진 원본명 : " + fileList.get(i).getOriginName());
					System.out.println("수정하려는 사진 체인지명 : " + fileList.get(i).getChangeName());
				}
			}else {
				System.out.println("수정할 파일 없음!!!!!!!!!!!!");
			}
			
			//수정할 상품상세 값 가져오기
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
			
			int result = new ProductAdminService().updateDetailProduct(p, fileList);
			
			String msg = "";
			
			if(result > 0) {
				msg = "상품수정 완료";
				System.out.println("수정성공!!!!!!!!!!!!!");
				response.sendRedirect("/jootopia/adminProductList.do");
			}else  {
				/*for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(filePath + saveFiles.get(i));
					
					System.out.println("사진 업로드 삭제 여부 : " + failedFile.delete());
				}*/
				System.out.println("수정실패!!!!!!!!!!!!!");
				msg = "상품등록 실패";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("views/common/errorPage500.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
