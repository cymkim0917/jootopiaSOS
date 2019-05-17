package com.kh.jooTopia.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.jooTopia.member.model.service.MemberService;
import com.kh.jooTopia.wrapper.LoginWrapper;

@WebServlet("/getkakao.do")
public class GetKaKaoInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetKaKaoInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reqAccessToken = request.getParameter("kakaoToken");		
		String tempVal[] = reqAccessToken.split(",");	
		System.out.println(tempVal[0]);		
		String tempVal2[] = tempVal[0].split(":");		
		System.out.println(tempVal2[1]);		
		String accessToken = tempVal2[1].replace("\"", "");
	
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		URL url = new URL(reqURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		
		conn.setRequestProperty("Authorization", "Bearer " +accessToken);
        
        int responseCode = conn.getResponseCode();
        System.out.println("responseCode : " + responseCode);
        
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        
        String line = "";
        String result = "";
        
        while ((line = br.readLine()) != null) {
            result += line;
        }
        System.out.println("response body : " + result);
        
        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(result);
        
        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
        String id = element.getAsJsonObject().get("id").getAsString();
        System.out.println(id);
        
        
        String nickname = properties.getAsJsonObject().get("nickname").getAsString();

       
       request.setAttribute("userPwd", id);
       request.setAttribute("userName", nickname);
       request.setAttribute("userId", "Kakao"+id.substring(0, 3));
       
       String test = LoginWrapper.getSha512(id);
       System.out.println(test);
       
       /*PrintWriter out = response.getWriter();
       System.out.println("<script> var openWindow = window.open('views/member/kakaoJoinForm.jsp','kakaoJoinForm','width=570,height=570,resizable=no,scrollbars=no'); openWindow.document.getElementById('userPwd').value = '" + id + "';</script>");
       out.println("<script> var openWindow = window.open('views/member/kakaoJoinForm.jsp','kakaoJoinForm','width=570,height=570,resizable=no,scrollbars=no'); openWindow.document.getElementById('userPwd').value = '"+ id +"';</script>");
       */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
