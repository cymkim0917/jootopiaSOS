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

@WebServlet("/updateMember.do")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		
		String tempTel1 = request.getParameter("tel1");
		String tempTel2 = request.getParameter("tel2");
		String tempTel3 = request.getParameter("tel3");
		String tel = tempTel1 + "-" + tempTel2 + "-" + tempTel3;
		
		member.setUserPwd(request.getParameter("userPwd"));
		member.setUserName(request.getParameter("userName"));
		member.setPhone(tel);
		member.setAddress(request.getParameter("address"));
		member.setEmail(request.getParameter("email"));
		
		System.out.println("member : " + member);
			
		int result = new MemberService().updateMember(member);
		PrintWriter out = response.getWriter();
		String view = "index.jsp";
		
		if(result > 0) {
			request.getSession().setAttribute("loginUser", member);
			out.println("<script>alert('회원 정보 수정에 성공했습니다.'); location.href='"+ view +"'</script>");	
			
		}else {
			out.println("<script>alert('회원 정보 수정에 실패했습니다.'); location.href='"+ view +"'</script>");
		}
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
