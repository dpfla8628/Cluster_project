package com.kh.cluster.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	private static final Logger log = LoggerFactory.getLogger(CreatorController.class);
	
	@GetMapping("/")
	public String main(Model model) throws Exception {
		log.info("main()");
		
		return "/index";
	}
}
