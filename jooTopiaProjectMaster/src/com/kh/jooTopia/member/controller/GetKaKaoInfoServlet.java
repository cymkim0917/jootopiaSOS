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
import com.kh.jooTopia.member.model.vo.KakaoMember;
import com.kh.jooTopia.member.model.vo.Member;
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
        
        KakaoMember kakao = new KakaoMember();
        
        kakao.setUserId("Kakao"+id.substring(4));
        kakao.setUserPwd(id);
        kakao.setUserName(nickname);
      
        
    	int searchResult = new MemberService().kakaoMemberNY(kakao);
    	
    	if(searchResult == 0 ) {
    		System.out.println("searchResult:0 : " + kakao);
    		request.setAttribute("kakao", kakao);    		
    		request.getRequestDispatcher("views/member/kakaoJoinForm.jsp").forward(request, response);
    	}else {
    		
    		Member member = new MemberService().searchMember(kakao);
    		
    		request.getSession().setAttribute("loginUser", member);
    		request.getRequestDispatcher("index.jsp").forward(request, response);
    	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
