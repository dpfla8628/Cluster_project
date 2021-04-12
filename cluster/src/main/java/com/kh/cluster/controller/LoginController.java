package com.kh.cluster.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cluster.service.AuthService;
import com.kh.cluster.util.TokenUtil;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	AuthService service;
	
	@GetMapping("/")
	public String getLogin() {
		log.info("getLogin()");
		return "/auth/login";
	}
	
	@PostMapping("/")
	public String postLogin(@RequestParam("memberId") String id, @RequestParam("memberPassword") String pw, Model model) {
		log.info("postLogin()");
		
		//로그인확인
		
		//토큰
		String token = TokenUtil.createToken(id);
		model.addAttribute("token", token);
		
		return "/auth/login-result";
	}
	
	@GetMapping("/find")
	public String getFind() {
		return "/auth/find-password";
	}
}
