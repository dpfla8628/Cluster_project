package com.kh.cluster.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.entity.AuthMemberCheckVO;
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
			if("n".equals(member.getMemberStatus())) {
				service.sendSignUpMail(member);
				return "ny";
			}
			
			//토큰발급
			String token = tokenUtil.createToken(loginMember.getMemberId(), TokenUtil.TOKEN_EXPIREDTIME);
			
			//토큰 Db에 저장
			service.updateToken(loginMember.getMemberId(), token);
			
			//토큰 쿠키에 저장
			Cookie cookie = cookieUtil.createCookie("accessToken", token);
			res.addCookie(cookie);
			
			//세션에 권한 저장
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
		
		return "redirect:/";
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
		
		if(member != null && "y".equals(member.getMemberStatus())) {
			if("n".equals(member.getMemberBy())) {
				//토큰 생성 + 이메일 발송
				service.sendFindPasswordMail(member);
				return "y";
			}
			return "s";
		}
		return "n";
	}
	
	//비밀번호 변경
	@GetMapping("/reset")
	public String getReset(@RequestParam(value = "auth", required = false) String authNum, 
							@RequestParam(value = "no", required= false) Integer memberNo) {
		log.info("getReset()");
		
		if(authNum == null || memberNo == null) return "redirect:/";
		
		//링크 유효성 검사
		Map<String, Object> result = service.checkResetPasswordURL(memberNo, authNum);
		//유효한 경우
		if(result.containsKey("memberNo")) {
			return (String)result.get("path");
		}
		
		//만료된 경우 또는 db와 일치하지 않는 경우
		return (String)result.get("path");
		
	}
	
	//비밀번호 변경
	@PostMapping("/resetPw")
	@ResponseBody
	public ResponseEntity<String> postResetPw(@RequestBody AuthMemberCheckVO checkVo) {
		log.info("postResetPw()");

		//비밀번호 유효성 검사
		boolean result = service.checkResetPw(checkVo);
		if(!result) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		//비밀번호 변경
		service.resetPassword(checkVo);
		
		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
	//잘못된 요청 결과 페이지
	@GetMapping("/wr")
	public String getWrongRequest() {
		log.info("getWrongRequest()");
		return "/auth/wrong-request";
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
		
		return "redirect:/";
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
	
	@GetMapping("/test")
	public String test() {
		return "/auth/wrong-request";
	}
}
