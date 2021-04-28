package com.kh.cluster.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.kh.cluster.controller.LoginController;

@Component
public class CookieUtil {
	private static final Logger log = LoggerFactory.getLogger(CookieUtil.class);
	
	public Cookie createCookie(String cookieName, String value){
		log.info("createCookie()");
	    Cookie token = new Cookie(cookieName,value);
	    token.setHttpOnly(true);
	    token.setMaxAge(TokenUtil.TOKEN_EXPIREDTIME);
	    token.setPath("/");
	    return token;
	}
	
	public Cookie getCookie(HttpServletRequest req, String cookieName){
		log.info("getCookie()");    
		final Cookie[] cookies = req.getCookies();
	        if(cookies==null) return null;
	        for(Cookie cookie : cookies){
	            if(cookie.getName().equals(cookieName))
	                return cookie;
	        }
	        return null;
	}
	
	public Cookie removeCookie(String cookieName) {
		log.info("removeCookie()");
		Cookie cookie = this.createCookie(cookieName, null);
		cookie.setMaxAge(1);
		
		return cookie;
	}
	
	public Cookie removeCookie2(HttpServletRequest req, String cookieName) {
		
		final Cookie[] cookies = req.getCookies();
        if(cookies==null) return null;
        for(Cookie cookie : cookies){
            if(cookie.getName().equals(cookieName))
            	cookie.setMaxAge(1);
            	return cookie;
        }
        return null;
	}
	 
}
