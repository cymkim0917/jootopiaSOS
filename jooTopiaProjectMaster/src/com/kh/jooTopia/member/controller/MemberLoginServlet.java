package com.kh.jooTopia.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.member.model.service.MemberService;
import com.kh.jooTopia.member.model.vo.Member;

@WebServlet("/loginCheck.do")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(request);
		System.out.println(request.getParameter("userId") + " ~! " + request.getParameter("userPwd"));
		
		Member member = new MemberService().loginCheck(request.getParameter("userId"),request.getParameter("userPwd"));
		PrintWriter out = response.getWriter();
		String view = "views/main/MainPage.jsp";

		if (member != null) {
			request.getSession().setAttribute("loginUser", member);
			out.println("<script>alert('로그인에  성공했습니다.');location.href='"+ view +"'</script>");

		} else {
			out.println("<script>alert('로그인에  실패했습니다.');location.href='"+ view +"'</script>");
		}
		
		out.flush();
		out.close();
		System.out.println(member);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
