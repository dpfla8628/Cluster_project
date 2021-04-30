package com.kh.cluster.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebFilter(urlPatterns= "/admin/*")
public class AdminFilter implements Filter {
	
	private static final Logger log = LoggerFactory.getLogger(AdminFilter.class);
	
	
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			HttpSession session = req.getSession();
			
		
			//관리자 권한 검사
				
			String memberAuth = (String)session.getAttribute("memberAuth");
				
			//boolean isAdmin = memberAuth.equals("관리자");
				
			//관리자라면 통과
			if(memberAuth != null && memberAuth.equals("관리자")) {
					
				log.info("filter ---- before");
					
				chain.doFilter(request, response);
				
				log.info("filter ---- after");
					
				return;
			} 
			//로그인 했지만 관리자가 아니라면 메인페이지로 이동
			else if(memberAuth != null) {
				
				resp.sendRedirect("/");
				//resp.sendError(403);
			}
			//로그인을 안했으면 로그인페이지로 이동
			else {
				
				resp.sendRedirect("/login/");
			}
			
			
					
				
				
					
			
			
		
	}
	
	

}
