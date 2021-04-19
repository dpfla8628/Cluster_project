package com.kh.cluster.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.entity.AuthMemberCheckVO;
import com.kh.cluster.entity.AuthMemberInfoCheckVO;
import com.kh.cluster.service.AuthService;
import com.kh.cluster.util.CookieUtil;
import com.kh.cluster.util.Subject;
import com.kh.cluster.util.TokenUtil;

@Controller
@RequestMapping("/signup")
public class SignUpController {
	
	private static final Logger log = LoggerFactory.getLogger(SignUpController.class);
	
	@Autowired
	AuthService service;
	@Autowired
	TokenUtil tokenUtil;
	@Autowired
	CookieUtil cookieUtil;
	
	//일반회원가입화면
	@GetMapping("/")
	public String getSignUp() {
		log.info("getSignUp()");
		
		return "/auth/signup-normal";
	}
	
	//일반회원가입 db처리 + 이메일 전송
	@PostMapping("/")
	public String postSignUp(@ModelAttribute("member") AuthMember member, RedirectAttributes redirect) {
		log.info("postSignUp()");
		
		//회원가입 처리
		AuthMember authMember = service.signUpNormal(member);
		
		//이메일 전송
		service.sendMail(authMember, Subject.SIGNUP);
		
		redirect.addFlashAttribute("email", member.getMemberId());
		
		return "redirect:/signup/email";
	}
	
	//인증메일 전송 결과
	@GetMapping("/email")
	public String getSend() {
		log.info("getSend()");
		return "/auth/signup-send-email";
	}
	
	//회원가입 완료 처리
	@GetMapping("/complete")
	public String getComplete(@RequestParam(value = "auth", required = false) Integer authNum, 
								@RequestParam(value = "no", required= false) Integer memberNo,
								HttpServletResponse res) {
		log.info("getComplete()");
		
		if(authNum == null || memberNo == null) return "redirect:/signup/";
		
		//회원가입 완료 처리
		Map<String, String> result = service.signUpComplete(authNum, memberNo);
		
		if(result == null) return "redirect:/signup/";
		
		if("y".equals(result.get("memberStatus"))) return "redirect:/login/";
		
		//로그인 처리
		//토큰발급
		String token = tokenUtil.createToken(result.get("memberId"));
		
		//토큰 Db에 저장
		service.updateToken(result.get("memberId"), token);
		
		//토큰 쿠키에 저장
		Cookie cookie = cookieUtil.createCookie("accessToken", token);
		res.addCookie(cookie);
		
		return "redirect:/signup/welcome";
	}
	
	//회원가입 완료 페이지
	@GetMapping("/welcome")
	public String signupSuccess() {
		log.info("signupSuccess()");
		return "/auth/signup-success";
	}
	
	
	//회원가입 시 닉네임, 아이디 중복검사
	@PostMapping("/check")
	@ResponseBody
	public String postCheck(@RequestBody AuthMemberInfoCheckVO signupVo) {
		log.info("postCheck()");
		
		boolean result = service.checkSignUpInfo(signupVo);
		
		return result == false ? "y" : "n";
	}
	
	//회원가입 시 데이터 유효성 검사 
	@PostMapping("/check2")
	@ResponseBody
	public String postCheck2(@RequestBody AuthMemberCheckVO signupVo) {
		log.info("postCheck2()");
		
		System.out.println("signupVO : " + signupVo);
		
		//유효성 검사
		boolean result = service.checkSignup(signupVo);
		
		return result == true ? "y" : "n";
	}
	
	@GetMapping("/google")
	public String signUpToGoogle() {
		return "";
	}
	
	
}
