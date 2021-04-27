package com.kh.cluster.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.kh.cluster.entity.AuthMemberVO;
import com.kh.cluster.entity.Criteria;
import com.kh.cluster.entity.FAQ;
import com.kh.cluster.entity.PageMaker;
import com.kh.cluster.entity.Question;
import com.kh.cluster.service.CommunityService;
import com.kh.cluster.util.PagingVO;
 import com.kh.cluster.util.PagingVo2;

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
	
	//문의 등록
	@ResponseBody
	@PostMapping("/question")
	public void qFormInsert(@ModelAttribute Question question)throws Exception{
		service.qInsert(question);
	}
	
	//문의 리스트
	@GetMapping("/qList")
	public ModelAndView qList(HttpServletRequest req, PagingVo2 vo, Model model
			,@RequestParam(value="nowPage", required = false)String nowPage
			,@RequestParam(value="cntPerPage", required = false)String cntPerPage)throws Exception{
		log.info("qList");
		
		ModelAndView view = new ModelAndView();
		
		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		String auth = member.getMemberAuth();
		int memberNo = member.getMemberNo();
		
		int total;
		if(auth.equals("관리자")) {
			total = service.listCount();
		}
		else {
			total = service.questionListCount(memberNo);	
		}
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVo2(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), memberNo);
		List<Question> qList;
		
		if(auth.equals("관리자")) {
			qList = service.adminQuestionList(vo);
		}
		else {
			qList = service.questionList(vo);
		}
		view.setViewName("/community/qList");
		view.addObject("qList", qList);
		view.addObject("paging", vo);
		
		return view;
	}
	
 	@GetMapping("/qDetail/{questionNo}")
	public ModelAndView qDetail(Model model, @PathVariable int questionNo)throws Exception{
		log.info("qDetail");
		
		ModelAndView view = new ModelAndView();
		
		Question q = service.read(questionNo);
		
		view.setViewName("/community/qDetail");
		view.addObject("q", q);
		
		return view;
	}
	
	//회원의 문의내용 수정
	@PostMapping("/qDetail")
	public RedirectView qEdit(@ModelAttribute Question question)throws Exception{
		log.info("qDetail");
		service.qEdit(question);
		int questionNo = question.getQuestionNo();
		
		return new RedirectView("/community/qDetail/"+questionNo);
	}
	
	//관리자의 문의 답변 등록
	@PostMapping("/qDetail/admin")
	public RedirectView aEdit(@ModelAttribute Question question)throws Exception{
		log.info("qDetail/admin");
		service.aInsert(question);
		int questionNo = question.getQuestionNo();
		
		return new RedirectView("/community/qDetail/"+questionNo);
	}
	
	//회원의 문의 삭제
	@PostMapping("/deleteQ")
	public RedirectView deleteQuestion(@ModelAttribute Question question)throws Exception{
		log.info("deleteQuestion");
		int questionNo = question.getQuestionNo();
		 
		service.deleteQuestion(questionNo);
 		
		return new RedirectView("/community/qList/");
		
	}
	
	//관리자의 답변 삭제
	@PostMapping("/deleteA/{questionNo}")
	public RedirectView deleteA(@PathVariable int questionNo)throws Exception{
		log.info("deleteA");
		service.deleteA(questionNo);
		return new RedirectView("/community/qDetail/"+questionNo);
	}
	
	//FAQ
	@GetMapping("/faq")
	public String faqList(HttpServletRequest req, PagingVo2 vo, Model model
			,@RequestParam(value="nowPage", required = false)String nowPage
			,@RequestParam(value="cntPerPage", required = false)String cntPerPage) throws Exception{
		log.info("faqList");
		
		int total = service.faqCount();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVo2(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<FAQ> list = service.faqList(vo);
		model.addAttribute("list",list);
		model.addAttribute("paging", vo);
		
		return "/community/faq";
	}
	
	//FAQ 등록
	@GetMapping("/faqRegister")
	public String faqForm() throws Exception{
		log.info("faqForm");
		
		return "/community/faqRegister";
	}
	@ResponseBody
	@PostMapping("/faqRegister")
	public void faqInsert(@ModelAttribute FAQ faq) throws Exception{
		log.info("faqInsert");
		
		service.faqInsert(faq);
	}
	
	//FAQ 수정
	@GetMapping("/faqEdit/{faqNo}")
	public ModelAndView faqEditForm(@PathVariable int faqNo, Model model) throws Exception{
		log.info("faqEditForm"); 
		
		ModelAndView view = new ModelAndView();
		
 		FAQ faq = service.faqRead(faqNo);		
		
 		view.setViewName("/community/faqEdit");
		view.addObject("faq", faq);
		
		return view;
	}
	@ResponseBody
	@PostMapping("/faqEdit")
	public void faqEdit(@ModelAttribute FAQ faq) throws Exception{
		log.info("faqEdit");
		
		service.faqEdit(faq);
	}
	
	@ResponseBody
 	@PostMapping("/faqDelete")
	public void faqDelete(@ModelAttribute FAQ faq) throws Exception{
		log.info("faqDelete");
		int faqNo = faq.getFaqNo();
		service.faqDelete(faqNo);
		
//		return new RedirectView("/community/faq");
	}
	
}
