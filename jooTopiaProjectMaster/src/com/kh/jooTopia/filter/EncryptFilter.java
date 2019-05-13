package com.kh.jooTopia.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.kh.jooTopia.wrapper.LoginWrapper;

@WebFilter("*.do")
public class EncryptFilter implements Filter {

    public EncryptFilter() {
       
    }

	public void destroy() { }

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hRequest = (HttpServletRequest)request;
		
		LoginWrapper lw = new LoginWrapper(hRequest);
		
		System.out.println("doFilter");
		//가공한 wrapper를 넘겨줌 
		// lw = request 객체, 가공만 되었을 뿐이다.
		
		chain.doFilter(lw, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
