package com.kh.jooTopia.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.member.model.service.MemberService;
import com.kh.jooTopia.member.model.vo.Member;

@WebServlet("/kakaoInsert.do")
public class KakaoInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public KakaoInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tempTel1 = request.getParameter("tel1");
		String tempTel2 = request.getParameter("tel2");
		String tempTel3 = request.getParameter("tel3");
		String zipCode = request.getParameter("zipCode");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		
		
		Date userDate = Date.valueOf(request.getParameter("date"));
		String phone = tempTel1 + "-" + tempTel2 + "-" + tempTel3;
		String gender = request.getParameter("gender");
		String address = zipCode + "|" + address1 + "|" + address2;
		
		Member member = new Member();
		
		member.setUserId(request.getParameter("userId"));
		member.setUserPwd(request.getParameter("userPwd"));
		member.setUserName(request.getParameter("userName"));
		member.setUserDate(userDate);
		member.setPhone(phone);
		member.setGender(gender);
		member.setAddress(address);
		member.setEmail(request.getParameter("email"));
		
		
		int result = new MemberService().insertMember(member);
		
		PrintWriter out = response.getWriter();
		String msg = "";
		String view = "views/main/MainPage.jsp";
		
		if(result > 0) {
			request.setAttribute("loginUser", member);
			msg = "회원가입에 성공했습니다.";
		}else {
			msg= "회원가입에 실패했습니다.";
		}
		
		out.println("<script>alert('"+ msg +"'); location.href='"+ view +"';</script>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
