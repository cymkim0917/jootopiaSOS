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
import com.kh.jooTopia.product.model.vo.ProductregAdmin;
import com.kh.jooTopia.purchase.model.service.PurchaseDetailService;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/insertAdminPAttachment.do")
public class InsertAdminPAttachmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertAdminPAttachmentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 100;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			String filePath = root + "images\\product\\";
			
			MultipartRequest multiRequest = new MultipartRequest(request,
											filePath, maxSize, "utf-8",
											new JootopiaFileRenamePolicy());
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				System.out.println("name : " + name);
				
			}
			
			for(int i = 0; i < 4; i++) {
				System.out.println(saveFiles.get(i));;
				System.out.println(originFiles.get(i));;
			}
			int pcid = Integer.parseInt(multiRequest.getParameter("pcid"));
			int pcdId = Integer.parseInt(multiRequest.getParameter("pcdId"));
			String cGroup = multiRequest.getParameter("cGroup");
			String cName = multiRequest.getParameter("cName");
			String pBrand = multiRequest.getParameter("pBrand");
			String pModel = multiRequest.getParameter("pModel");
			String uPeriod = multiRequest.getParameter("uPeriod");
			int pCost = Integer.parseInt(multiRequest.getParameter("pCost"));
			int hCost = Integer.parseInt(multiRequest.getParameter("hCost"));
			String Memo = multiRequest.getParameter("Memo");
			String pName = multiRequest.getParameter("pName");
			String pGrade = multiRequest.getParameter("pGrade");
			String pContent = multiRequest.getParameter("pContent");
			String pBarCode = multiRequest.getParameter("pBarcode");
			
			int cId = 0;
			
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
			
			Product p = new Product();
			p.setPcDId(pcdId);
			p.setcId(cId);
			p.setpBrand(pBrand);
			p.setpModelName(pModel);
			p.setpName(pName);
			p.setpGrade(pGrade);
			p.setpContent(pContent);
			p.setpBarCode(pBarCode);
			
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for (int i = originFiles.size() -1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			
			int result = new ProductAdminService().insertPAttachment(p, fileList);
			int result2 = 0;
			if(result > 0) {
				result2 = new PurchaseDetailService().insertPCDEnd(pcid);
			}
			
			if(result2 > 0) {
				response.sendRedirect(request.getContextPath() + "/selectAdminBuy.do");
			}else {
				for (int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(filePath + saveFiles.get(i));
					failedFile.delete();
				}
				request.getRequestDispatcher("views/common/errorPage500.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
