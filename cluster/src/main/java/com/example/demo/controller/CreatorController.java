package com.example.demo.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.entity.Offclass;

@Controller
@RequestMapping("/creator")
public class CreatorController {
	
	private static final Logger log = LoggerFactory.getLogger(CreatorController.class);
	
	@GetMapping("/")
	public String home(Model model) throws Exception {
		log.info("creator home()");
		
		//model.addAttribute("list", service.classList());
		
		return "/creator/home";
	}
	
	@GetMapping("/register")
	public String register(Model model) throws Exception{
		log.info("creator register()");
		
		//model.addAttribute("list", service.registerList());
		
		return "/creator/register";
	}

	@GetMapping("/registerForm")
	public String registerForm(Model model) {
		log.info("creator registerForm()");
		
		model.addAttribute(new Offclass());
				
		return "/creator/registerForm";
	}
	
	
}
