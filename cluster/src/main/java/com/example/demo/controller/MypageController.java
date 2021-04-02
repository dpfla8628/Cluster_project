package com.example.demo.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.ClassOrder;
import com.example.demo.entity.Member;
import com.example.demo.entity.Review;
import com.example.demo.service.MemberService;
import com.example.demo.util.MediaUtils;
import com.example.demo.util.UploadFileUtils;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private final static Logger log =
			LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MemberService service;
	
	//session으로 받아와야하는 멤버 번호이다 일단은 1으로 생각하고 쓰자
	int memberNo=1;
	
	@GetMapping("/index")
	public String index(Model model) throws Exception {
		log.info("index()");
		Member member = service.read(memberNo);
		model.addAttribute(member);
		model.addAttribute("ordercount",service.count(member));
		return "/mypage/index";
	}
	
	@GetMapping("/myedit")
	public String getEdit(Model model)throws Exception{
		log.info("getEdit()");
		Member member=service.read(memberNo);
		model.addAttribute(member);
		return "/mypage/myedit";
	}

	@PostMapping("/myedit")
	public String postModify(Member member, Model model) throws Exception {
		log.info("postModify()");
		service.modify(member);
		model.addAttribute("msg", "수정이 성공적으로 완료되었습니다.");
		return "/mypage/myedit";
	}
	
	@GetMapping("/coupon")
	public String coupon()throws Exception{
		return "mypage/coupon";
	}
	
	@GetMapping("/myclass")
	public String myclass()throws Exception{
		return "mypage/myclass";
	}
	
	@GetMapping("/myreview_list")
	public String myreview_list(Model model)throws Exception{
		log.info("review_list()");
		
		model.addAttribute("reviewList",service.riviewlist(memberNo));
		
		return "mypage/myreview_list";
	}
	
	@GetMapping("/myreview_edit")
	public void get_myreview_edit(Model model, Integer reviewNo)throws Exception{
		
		Review review = (service.reviewcheck(reviewNo));
		model.addAttribute("review",review);

	}
	@PostMapping("/myreview_edit")
	public String post_myreview_edit(Model model, Review review)throws Exception{
		service.reviewedit(review);
		return "redirect:/mypage/myreview_list";
	}
	
	@GetMapping("/review_remove")
	public String myreview_remove(Integer reviewNo) throws Exception{
		service.reviewremove(reviewNo);
		return "redirect:/mypage/myreview_list";
	}
	@GetMapping("/order_remove")
	public String order_remove(Integer orderNo) throws Exception{
		service.orderremove(orderNo);
		return "redirect:/mypage/myorder";
	}
	@GetMapping("/question_remove")
	public String question_remove(Integer classqNo) throws Exception{
		service.questionremove(classqNo);
		return "redirect:/mypage/myquestion";
	}
	
	@PostMapping("/myreview_write")
	public String myreview_write()throws Exception{
		return "mypage/myreview_write";
	}
	
	
	@GetMapping("/myorder")
	public String myorder(Model model)throws Exception{
		log.info("myorder()");
		model.addAttribute("orderList", service.orderlist(memberNo));
		return "mypage/myorder";
	}
	
	@GetMapping("/myquestion")
	public String myquestion(Model model)throws Exception{
		log.info("myquestion()");
		model.addAttribute("questionList",service.readq(memberNo));
		
		return "/mypage/myquestion";
	}
	
}
