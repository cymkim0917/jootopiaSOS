package com.kh.jooTopia.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.member.model.service.MemberService;
import com.kh.jooTopia.member.model.vo.Member;

@WebServlet("/insert.do")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 여러 개의 input box처리를 위한 temp 변수
		String tempTel1 = request.getParameter("tel1");
		String tempTel2 = request.getParameter("tel2");
		String tempTel3 = request.getParameter("tel3");
		String zipCode = request.getParameter("zipCode");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		
		
		// 정보 저장용 변수
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		Date userDate = Date.valueOf(request.getParameter("date"));
		String phone = tempTel1 + "-" + tempTel2 + "-" + tempTel3;
		String gender = request.getParameter("gender");
		String address = zipCode + "|" + address1 + "|" + address2;
		String email = request.getParameter("email");
		
		Member member = new Member(userId,userPwd,userName,userDate,phone,gender,address,email);
		
		System.out.println(member);
		
		int result = new MemberService().insertMember(member);
		PrintWriter out = response.getWriter();
		String msg = "";
		String view = "views/main/MainPage.jsp";
		
		if(result > 0 ) {
			request.setAttribute("loginUser", member);
			msg = "회원가입에 성공했습니다.";
		}else {
			msg= "회원가입에 실패했습니다.";
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
