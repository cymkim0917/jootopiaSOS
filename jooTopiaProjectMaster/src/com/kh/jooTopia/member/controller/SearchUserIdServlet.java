package com.kh.jooTopia.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

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

import com.kh.jooTopia.member.model.service.MemberService;
import com.kh.jooTopia.member.model.vo.Member;
import com.kh.jooTopia.member.util.Gmail;
import com.kh.jooTopia.member.util.SHA256;

@WebServlet("/searchId.me")
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
      
      //Member member = new MemberService().userCheck(userName,email);
   
      //System.out.println("서치유저  : " + member);
      
      // 사용자에게 보낼 메시지를 기입합니다.
      
      
      //return new PasswordAuthentication("rekin7244","cqggjktbmpirehik");
      String host = "http://localhost:8888/jootopia/";
      String from = "beagles1004@gmail.com";   //보내는이
      String to = "beagles1004@gmail.com";//받는이
      String subject = "주토피아 아이디 찾기 서비스입니다. ";
      String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." +
            "<a href='" + host + "emailCheckAction.jsp?code=" + SHA256.getSHA256(to) + "'>이메일 인증하기</a>";
      
      // SMTP에 접속하기 위한 정보를 기입합니다.
         
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

          

         try{

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

         } catch(Exception e){

             e.printStackTrace();

            PrintWriter script = response.getWriter();

            script.println("<script>");

            script.println("alert('오류가 발생했습니다..');");

            script.println("history.back();");

            script.println("</script>");

            script.close();      

             return;

         }
      
   }
   

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}