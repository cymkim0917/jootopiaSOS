package com.kh.jooTopia.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.jooTopia.member.model.service.MemberService;
import com.kh.jooTopia.member.model.vo.Member;
import com.kh.jooTopia.member.util.Gmail;
import com.kh.jooTopia.member.util.SHA256;

@WebServlet("/searchId.do")
public class SearchUserIdServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

    public SearchUserIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html; charset=UTF-8");
      String userName = request.getParameter("userName");
      String email = request.getParameter("email");
      
      System.out.println("userName : " + userName);
      System.out.println("email : " + email);
      
      Member member = new MemberService().userCheck(userName,email);
   
      System.out.println("서치유저  : " + member);
  	  PrintWriter out = response.getWriter();
      
      
      // 사용자에게 보낼 메시지를 기입합니다.
		if (member != null) {
			String randNum = "";

			for(int i = 0; i<6; i++) {
				randNum += String.valueOf(new Random().nextInt(9)+1);
			}		
			System.out.println(randNum);
			
			String host = "http://localhost:8888/jootopia/";
			String from = "beagles1004@gmail.com"; // 보내는이
			String to = member.getEmail();// 받는이
			String subject = "주토피아 아이디 찾기 서비스입니다. ";
	/*		String content = "다음 링크에 접속하여 이메일 확인을 진행하세요.</br>" + "<a href='" + host + "emailCheckAction.jsp?code="
					+ SHA256.getSHA256(to) + "'>이메일 인증하기</a>";*/
			String content = "<h1> 주토피아 이메일 인증 서비스 ! </h1> </br> <h4> 인증번호["+ randNum + "</h4>";
			Properties p = new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.googlemail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");

			try {

				Authenticator auth = new Gmail();

				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);

				Message msg = new MimeMessage(ses);
				msg.setSubject(subject);

				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr);

				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr);

				msg.setContent(content, "text/html;charset=UTF-8");
				Transport.send(msg);

				out.print(randNum);
				out.flush();
				out.close();
				
			} catch (Exception e) {

				e.printStackTrace();
				return;

			}
		}
			out.flush();
			out.close();
   }
   

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}