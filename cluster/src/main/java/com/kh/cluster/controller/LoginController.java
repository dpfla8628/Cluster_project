package com.kh.cluster.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.entity.AuthMemberVO;
import com.kh.cluster.service.AuthService;
import com.kh.cluster.util.CookieUtil;
import com.kh.cluster.util.Subject;
import com.kh.cluster.util.TokenUtil;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	AuthService service;
	@Autowired
	TokenUtil tokenUtil;
	@Autowired
	CookieUtil cookieUtil;
	
	@GetMapping("/")
	public String getLogin() {
		log.info("getLogin()");
		return "/auth/login";
	}
	
	//필요정보 auth, id, no
	@PostMapping("/")
	@ResponseBody
	public String postLogin(@RequestBody AuthMember loginMember, HttpSession session, HttpServletResponse res) {
		log.info("postLogin()");
		
		//로그인확인
		AuthMember member = service.loginNormal(loginMember);
		if(member != null) {
			if("n".equals(member.getMemberStatus())) return "ny";
			
			//토큰발급
			String token = tokenUtil.createToken(loginMember.getMemberId());
			
			//토큰 Db에 저장
			service.updateToken(loginMember.getMemberId(), token);
			
			//토큰 쿠키에 저장
			Cookie cookie = cookieUtil.createCookie("accessToken", token);
			res.addCookie(cookie);
			
			session.setAttribute("memberAuth", member.getMemberAuth());
			
			return "y";
		}
		
		return "n";
	}
	
	//페이지변경필요
	//로그인 결과 확인
	@PostMapping("/result")
	public String postResult(HttpServletRequest req) {
		log.info("postResult()");
		
		Cookie cookie = cookieUtil.getCookie(req, "accessToken");
		System.out.println(cookie.getValue());
		
		return "redirect:/login/result";
	}
	
	@GetMapping("/result")
	public String getResult(HttpServletRequest req) {
		log.info("getResult()");
		
		Cookie cookie = cookieUtil.getCookie(req, "accessToken");
		System.out.println(cookie.getValue());
		
		return "/auth/login-result";
	}
	
	//비밀번호 찾기
	@GetMapping("/find")
	public String getFind() {
		log.info("getFind()");
		return "/auth/find-password";
	}
	
	@PostMapping("/findpw")
	@ResponseBody
	public String postFindPw(@RequestParam("id") String memberId) {
		log.info("postFindPw()");
		System.out.println("memberId : "+memberId);
		
		AuthMember member = service.isMember(memberId);
		
		if(member != null) {
			if("n".equals(member.getMemberBy())) {
				//이메일 발송
				
			}
			
			return "s";
		}
		
		return "n";
	}
	
	//페이지변경필요(홈으로 이동)
	//로그아웃
	@GetMapping("/logout")
	public String getLogout(HttpServletRequest req, HttpServletResponse res) {
		log.info("getLogout()");
		
		//DB에서 토큰 삭제
		AuthMemberVO member = (AuthMemberVO)req.getAttribute("member");
		service.deleteToken(member.getMemberId());
		
		//쿠키에서 토큰 삭제
		Cookie cookie = cookieUtil.removeCookie("accessToken");
		res.addCookie(cookie);
		
		//세션 삭제
		req.getSession().invalidate();
		
		return "redirect:/login/";
	}
	
	@GetMapping("/resend")
	public String getResend() {
		log.info("getResend()");
		
		return "/auth/signup-incomplete";
	}
	
	@PostMapping("/resend")
	public String postResend(@RequestParam String email, RedirectAttributes redirect) {
		log.info("postResend()");
		
		//메일 재전송
		service.resendMail(email, Subject.SIGNUP);
		
		redirect.addFlashAttribute("email", email);
		
		return "redirect:/login/resend";
	}
}
