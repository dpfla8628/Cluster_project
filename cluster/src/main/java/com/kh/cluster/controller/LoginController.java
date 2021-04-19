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
	
	 
	
	@GetMapping("/logout")
	public String getLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "/auth/login";
	}
	
	@GetMapping("/find")
	public String getFind() {
		return "/auth/find-password";
	}
}
