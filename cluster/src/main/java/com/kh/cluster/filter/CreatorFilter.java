package com.kh.cluster.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.kh.cluster.controller.CreatorController;
import com.kh.cluster.entity.AuthMemberVO;

@WebFilter(urlPatterns = "/creator/*")
public class CreatorFilter implements Filter{

	private static final Logger log = LoggerFactory.getLogger(CreatorController.class);
	
	private static final String SESSION_ATTRIBUTE_AUTH = "memberAuth";
	
	private static final String LOGIN_PAGE = "/login/";
	
	private static final String HOME_PAGE = "/";
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		Filter.super.init(filterConfig);
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		//AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		//String auth = member.getMemberAuth();
		HttpSession session = req.getSession();
		String auth = (String) session.getAttribute(SESSION_ATTRIBUTE_AUTH);
		
		log.info("##### filter - before #####");
		log.info("auth = " + auth);
		if(auth == null) {
			res.sendRedirect(LOGIN_PAGE);
		}else if(auth.equals("강사") || auth.equals("관리자")) {
			chain.doFilter(req, res);
		}else {
			res.sendRedirect(HOME_PAGE);
		}
		
		log.info("##### filter - after #####");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		Filter.super.destroy();
	}
}
