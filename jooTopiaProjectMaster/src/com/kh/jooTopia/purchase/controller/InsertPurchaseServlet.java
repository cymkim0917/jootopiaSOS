package com.kh.jooTopia.purchase.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.common.JootopiaFileRenamePolicy;
import com.kh.jooTopia.member.model.vo.Member;
import com.kh.jooTopia.purchase.model.service.PurchaseService;
import com.kh.jooTopia.purchase.model.vo.Purchase;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/insertPurchase.do")
public class InsertPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertPurchaseServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// File Format을 위한 multipartRequest settting
		System.out.println("insertPurchase");
		if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("multipartRequest");
			int maxSize = 1024 * 1024 * 100;
			
			String root = request
					.getSession()
					.getServletContext()  
					.getRealPath("/"); 	  
			
			System.out.println("context : " + request.getSession().getServletContext());
			System.out.println("root : " + root);
			
			String filePath = root + "images_upload\\";
			System.out.println("filePath : " + filePath);
			
			// mRequest Setting Format Object
			MultipartRequest mRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new JootopiaFileRenamePolicy());
			
			// 저장할 파일명
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			// 원본 파일명
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> imgFiles = mRequest.getFileNames(); // iterator와 비슷하개 순차적으로 pop해주는 클래스
			
			while(imgFiles.hasMoreElements()) {
				String fName = imgFiles.nextElement();
				
				System.out.println("nameAttr : " + fName);
				
				saveFiles.add(mRequest.getFilesystemName(fName));
				originFiles.add(mRequest.getOriginalFileName(fName));
				System.out.println("while");
			}
				
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				Attachment at = new Attachment();
				
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			String appName = mRequest.getParameter("name");
			String address = mRequest.getParameter("address");
			String appDistance = mRequest.getParameter("appDistance");
			String phone = mRequest.getParameter("phone");
			String cName = mRequest.getParameter("cName");
			String brand = mRequest.getParameter("brand");
			String model = mRequest.getParameter("model");
			String usePeriod = mRequest.getParameter("usePeriod");
			String primePrice = mRequest.getParameter("primePrice");
			String hopePrice = mRequest.getParameter("hopePrice");
			String content = mRequest.getParameter("content");
			String memo = mRequest.getParameter("memo");
			
			System.out.println("cNAme :" + cName);
			
			Member loginUser = (Member) request.getSession().getAttribute("loginUser");;

			Board b = new Board();
			b.setbContent(content);
			b.setuNo(loginUser.getUno());
			
			Purchase p = new Purchase();
			p.setApplicant(appName);
			p.setAppAddress(address);
			p.setAppDistance(Integer.parseInt(appDistance));
			p.setAppPhone(phone);
			p.setcName(cName);
			p.setBrand(brand);
			p.setModel(model);
			p.setUsePeriod(usePeriod);
			p.setPrimeCost(Integer.parseInt(primePrice));
			p.setHopeCost(Integer.parseInt(hopePrice));
			p.setMemo(memo);
			
			int result = new PurchaseService().insertPurchase(b, p, fileList);
			
			HashMap<String, Object> hmap = null;
			
			if(result > 0) {
				 hmap = new PurchaseService().selectPurchaseFin();
			}
			
			if(result > 0) {
				// 일단 메인페이지로 보내본다.
				request.setAttribute("hmap", hmap);
				response.sendRedirect(request.getContextPath() + "/views/purchase/purchaseFin.jsp");
			}else {
				
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(filePath + saveFiles.get(i));
					
					failedFile.delete();
				}
				
				request.setAttribute("msg", "매입신청서 제출 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		} // if
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
