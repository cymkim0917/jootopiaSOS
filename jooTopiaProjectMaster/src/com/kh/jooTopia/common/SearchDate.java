package com.kh.jooTopia.common;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/searchDate.do")
public class SearchDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchDate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*String date = request.getParameter("date");*/
		int date = Integer.parseInt(request.getParameter("date"));
		System.out.println("빼려는 날짜 : " + date);
		
		Calendar today = Calendar.getInstance();
		System.out.println("오늘날짜 : " + today);

		today.add(Calendar.DATE, -date);
		String changeDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(today.getTime());
		System.out.println("변경날짜 : " + changeDate);
		
		new Gson().toJson(changeDate, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
