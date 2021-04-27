package com.kh.cluster.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/event")
public class EventController {
	//이벤트 목록
	@GetMapping("/")
	public String getList() {
		return "/event/list";
	}
	
	//이벤트 작성
	
}
