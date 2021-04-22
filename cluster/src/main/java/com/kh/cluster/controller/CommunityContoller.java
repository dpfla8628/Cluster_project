package com.kh.cluster.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cluster.entity.Question;
import com.kh.cluster.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityContoller {
	
	@Autowired
	private CommunityService service;
	
	public static Logger log =
			LoggerFactory.getLogger(ClassDetailController.class);

	
	@GetMapping("/question")
	public void qForm() throws Exception{
		log.info("questionForm");
	}
	
	@ResponseBody
	@PostMapping("/question")
	public void qFormInsert(@ModelAttribute Question question)throws Exception{
		service.qInsert(question);
	}
	
	@GetMapping("/qList/{memberNo}")
	public ModelAndView qList(Model model, @PathVariable int memberNo)throws Exception{
		log.info("qList");
		
		ModelAndView view = new ModelAndView();
		
		List<Question> qList = service.questionList(memberNo);
		
		view.setViewName("/community/qList");
		view.addObject("qList", qList);
		
		return view;
	}
	
	@ResponseBody
	@GetMapping("/qDetail/{questionNo}")
	public ModelAndView qDetail(Model model, @PathVariable int questionNo)throws Exception{
		log.info("qDetail");
		
		ModelAndView view = new ModelAndView();
		
		Question q = service.read(questionNo);
		
		view.setViewName("/community/qDetail");
		view.addObject("q", q);
		
		return view;
	}
	
	@ResponseBody
	@PostMapping("/qDetail")
	public void qEdit(@ModelAttribute Question question)throws Exception{
		log.info("qDetail");
		service.qEdit(question);
		
	}
	
	@ResponseBody
	@PostMapping("/qDetail/admin")
	public void aEdit(@ModelAttribute Question question)throws Exception{
		log.info("qDetail/admin");
		service.aInsert(question);
		
	}
	
	@ResponseBody
 	@RequestMapping(value="/qDetail/deleteQuestion/{questionNo}")
	public void deleteQuestion(@PathVariable int questionNo)throws Exception{
		log.info("deleteQuestion");
		service.deleteQuestion(questionNo);
	}
	
	@ResponseBody
	@RequestMapping(value="/qDetail/deleteA/{questionNo}")
	public void deleteA(@PathVariable int questionNo)throws Exception{
		log.info("deleteA");
		service.deleteA(questionNo);
	}
}
