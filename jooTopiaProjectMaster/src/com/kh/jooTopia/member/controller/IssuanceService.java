package com.kh.jooTopia.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.member.model.service.MemberService;
import com.kh.jooTopia.member.util.Gmail;
import com.kh.jooTopia.wrapper.LoginWrapper;

@WebServlet("/issuPwd.do")
public class IssuanceService extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public IssuanceService() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String defaultPwd = "JooTo";
		
		for(int i=0;i<3;i++) {
			defaultPwd += String.valueOf(new Random().nextInt(9) + 1);
		}
		
		defaultPwd += "Pia";
		
		for(int i=0;i<3;i++) {
			defaultPwd += String.valueOf(new Random().nextInt(9) + 1);
		}
		
		String userPwd = LoginWrapper.getSha512(defaultPwd);
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String userId = request.getParameter("userId");
				
		
		System.out.println("defaultPwd : " + defaultPwd);
		System.out.println(userPwd);
		
		String host = "http://localhost:8888/jootopia/";
		String from = "beagles1004@gmail.com"; // 보내는이
		String to = email;// 받는이
		String subject = "주토피아 아이디 찾기 서비스입니다. ";
		String content = "<h1> 주토피아 비밀번호 재발급 </h1> </br> <h4 style='background:gray;'> 회원님의 비밀번호는 "+ defaultPwd + "입니다.</h4>";
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
			
			new MemberService().issuancePwd(userPwd,userName,email,userId);
		
		} catch (Exception e) {

			e.printStackTrace();
			return;

		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
