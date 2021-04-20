package com.kh.cluster.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.entity.AuthMemberVO;
import com.kh.cluster.service.AuthService;
import com.kh.cluster.util.CookieUtil;
import com.kh.cluster.util.OAuthGoogleUtil;
import com.kh.cluster.util.TokenUtil;

@Controller
public class SNSLoginController {
	
	private static final Logger log = LoggerFactory.getLogger(SNSLoginController.class);
	
	@Autowired
	OAuthGoogleUtil googleUtil;
	@Autowired
	AuthService service;
	@Autowired
	TokenUtil tokenUtil;
	@Autowired
	CookieUtil cookieUtil;
	
	@Value("${api.redirect_uri}")
	String redirectUri;
	
	@GetMapping("/auth/check")
	public String authCheck(HttpServletRequest req) {
		log.info("authCheck()");
		
		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		
		if((member!=null && "n".equals(member.getMemberBy())) || member == null) {
			StringBuffer sb = new StringBuffer();
			sb.append("https://accounts.google.com/o/oauth2/v2/auth?client_id=647583568739-4spif9a2q3dppe7u1le90jrup0ucsahi.apps.googleusercontent.com&");
			sb.append("redirect_uri="+redirectUri);
			sb.append("&response_type=code&scope=email%20profile%20openid&access_type=offline");
			
			return "redirect:"+ sb.toString();
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/auth/google")
	public String googleAuth(Model model, @RequestParam(value = "code") String authCode, HttpServletResponse res)
			throws JsonProcessingException {
		log.info("googleAuth()");
		
		//OAuth
		Map<String, String> result = googleUtil.googleLogin(authCode);
		System.out.println("result: "+result);
		//email조회
		AuthMember authMember = service.isMember(result.get("email"));
		if(authMember == null) {
			//회원가입 처리
			authMember = service.signUpSNS(result);
		}
		
		//일반회원가입을 한 경우라면
		if("n".equals(authMember.getMemberBy())) {
			return "redirect:/login/";
		}
		
		//로그인 처리
		//토큰발급
		String token = tokenUtil.createToken(authMember.getMemberId());
		
		//토큰 Db에 저장
		service.updateToken(authMember.getMemberId(), token);
		
		//토큰 쿠키에 저장
		Cookie cookie = cookieUtil.createCookie("accessToken", token);
		res.addCookie(cookie);	

		return "redirect:/";
		
	}
}
