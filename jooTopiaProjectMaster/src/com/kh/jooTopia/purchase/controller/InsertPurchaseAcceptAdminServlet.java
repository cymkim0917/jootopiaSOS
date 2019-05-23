package com.kh.jooTopia.purchase.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.purchase.model.service.PurchaseAdminService;
import com.kh.jooTopia.purchase.model.service.PurchaseDetailService;
import com.kh.jooTopia.purchase.model.vo.PurchaseDetail;

import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeException;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;
import net.sourceforge.barbecue.output.OutputException;

@WebServlet("/insertPCAdminAccept.do")
public class InsertPurchaseAcceptAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertPurchaseAcceptAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pcid = Integer.parseInt(request.getParameter("no"));
		//String pBarcode = "barcode-" + (int)(Math.random() * 10000000);
		// 상품바코드 UPC-A : 12자리 숫자로 이루어져야 한다. 
		String pBarcode = "100" + (int)(Math.random() * 100000000);
		
		// 바코드 생성 상품바코드는 Code128 방식을 이용 -> 바꿈 code128방식은 문자를 포함할 수 있음
		try {
			// 얘도 숫자로 이루어져야 한다. 
			/*BarcodeFactory.create2of7(arg0);*/
			Barcode barcode = BarcodeFactory.createUPCA(pBarcode);
			// 얘도 숫자로 이루어져야 한다. 
			// 적치하는 렉에 많이 사용되는 바코드 
//			Barcode barcode = BarcodeFactory.createInt2of5(pBarcode);
			barcode.setDrawingText(true);
			barcode.setBarHeight(80);
			
			System.out.println("barcode : " + barcode);
			
			String root = request
					.getSession()
					.getServletContext()  
					.getRealPath("/"); 	
			
			String path = root + "images\\barcode\\" + pBarcode + ".PNG";
			File file = new File(path);
			
			// 경로에 바코드 이미지로 저장
			BarcodeImageHandler.savePNG(barcode, file);
			
		} catch (BarcodeException e) {
			e.printStackTrace();
		} catch (OutputException e) {
			e.printStackTrace();
		}
		
		PurchaseDetail pcd = new PurchaseDetail();
		pcd.setpBarcode(pBarcode);
		pcd.setPcid(pcid);
		
		int result = new PurchaseDetailService().insertPCDaccept(pcd);
		
		if(result > 0) {
			request.setAttribute("hmap", new PurchaseAdminService().selectPurchaseOne(pcid));
			request.getRequestDispatcher("views/admin/purchase/purchaseDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "매입신청 수락 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
