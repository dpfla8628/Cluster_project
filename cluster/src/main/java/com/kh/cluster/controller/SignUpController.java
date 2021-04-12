package com.kh.cluster.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.entity.AuthMemberCheckVO;
import com.kh.cluster.service.AuthService;
import com.kh.cluster.util.Subject;

@Controller
@RequestMapping("/signup")
public class SignUpController {
	
	private static final Logger log = LoggerFactory.getLogger(SignUpController.class);
	
	@Autowired
	AuthService service;
	
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
		//Integer authNum = service.signUpNormal(member);
		
		//이메일 전송
		service.sendMail("tpgns1804@naver.com", 123, Subject.SIGNUP);
		
		redirect.addFlashAttribute("email", member.getMemberId());
		
		return "redirect:/signup/email";
	}
	
	//회원가입 완료 처리
	@GetMapping("/{authNum}")
	public String getComplete(@PathVariable("authNum") Integer authNum, Model model) {
		//회원가입 완료 처리
		String memberId = service.signUpComplete(authNum);
		model.addAttribute("memberId", memberId);
		
		return "/auth/signup-success";
	}
	
	//인증메일 전송 결과
	@GetMapping("/email")
	public String testSend() {
		return "/auth/signup-send-email";
	}
	
	//회원가입 시 닉네임, 아이디 중복검사
	@PostMapping("/check")
	@ResponseBody
	public String postCheck(@RequestBody Map<String, String> signupVo) {
		log.info("postCheck()");
		System.out.println("check: " + signupVo.get("check") + "/value: " + signupVo.get("value"));
		
		boolean result = service.checkSignUpInfo(signupVo);
		
		return result == false ? "y" : "n";
	}
	
	@GetMapping("/google")
	public String signUpToGoogle() {
		return "";
	}
	
	@GetMapping("/test/success")
	public String success() {
		return "/auth/signup-success";
	}
}
