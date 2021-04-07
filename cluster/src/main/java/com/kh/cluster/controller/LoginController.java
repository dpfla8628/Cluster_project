package com.kh.cluster.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.repository.AuthRepository;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	AuthRepository repo;
	
	@GetMapping("/")
	public String getLogin() {
		return "/auth/login";
	}
	
	@PostMapping("/")
	public String postLogin(HttpServletRequest req ,@RequestParam("memberId") String id, @RequestParam("memberPw") String pw) throws Exception {
		AuthMember login = new AuthMember();
		login.setMemberId(id);
		login.setMemberPw(pw);
		AuthMember resultMember = repo.loginNormal(login);
		if(resultMember != null) {
			HttpSession session = req.getSession();
			session.setAttribute("id", resultMember.getMemberId());
			session.setAttribute("auth", resultMember.getMemberAuth());
			return "/auth/login-result";
		}
		
		
		return "/auth/login";
	}
	
	@GetMapping("/find")
	public String getFind() {
		return "/auth/find-password";
	}
}
