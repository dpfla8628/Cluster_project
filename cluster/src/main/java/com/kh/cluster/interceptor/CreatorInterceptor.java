package com.kh.cluster.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.cluster.entity.AuthMemberVO;
import com.kh.cluster.service.AuthService;
import com.kh.cluster.util.CookieUtil;
import com.kh.cluster.util.TokenUtil;

@Component
public class CreatorInterceptor implements HandlerInterceptor{
	
	@Autowired
	CookieUtil cookieUtil;
	@Autowired
	TokenUtil tokenUtil;
	@Autowired
	AuthService service;
	
	private static final Logger log = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
			throws Exception {
		
		log.info("CreatorInterceptor()");
		
		Cookie cookie = cookieUtil.getCookie(req, "accessToken");
		
		if(cookie != null) {
			String token = cookie.getValue();
			String email = tokenUtil.validateToken(token);
			
			if(email != null) {
				AuthMemberVO member = service.isRightToken(email, token);
				
				log.info("Auth::{}", member.getMemberAuth());
				String auth = member.getMemberAuth();
				
				if(member != null) {
					if(auth.equals("강사") /*|| auth.equals("관리자")*/) {
					//if("강사".equals(member.getMemberAuth()) || "관리자".equals(member.getMemberAuth())) {
						req.setAttribute("member", member);
						return true;
					}else {
						res.sendRedirect("/");
						return false;
					}			
				}
			}
		}
		
		res.sendRedirect("/login/");
		
		return false;
	}
}
