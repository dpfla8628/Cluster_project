package com.kh.cluster.controller;

 import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.kh.cluster.entity.ClassLike;
import com.kh.cluster.entity.ClassQuestion;
import com.kh.cluster.entity.Criteria;
import com.kh.cluster.entity.MyMember;
import com.kh.cluster.entity.OffClassVo;
import com.kh.cluster.entity.Offclass;
import com.kh.cluster.entity.PageMaker;
import com.kh.cluster.entity.Review;
import com.kh.cluster.repository.AuthRepository;
import com.kh.cluster.service.ClassDetailService;
import com.kh.cluster.service.MypageService;
import com.kh.cluster.service.ReviewService;
import com.kh.cluster.util.MediaUtils;
import com.kh.cluster.util.UploadFileUtils;

 

@Controller
@RequestMapping("/class_detail")
public class ClassDetailController {
	
	 

	public static Logger log =
			LoggerFactory.getLogger(ClassDetailController.class);
	
	@Autowired
	private ClassDetailService service;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private MypageService mypageService;
	AuthRepository repo;
	
	@Value("${upload.path}")
	private String uploadPath;

	HttpSession session;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
 	public String list(Model model, Criteria cri) throws Exception{
 		log.info("list");
 			
  		model.addAttribute("list", service.list(cri));  
 		PageMaker pageMaker = new PageMaker();
 		pageMaker.setCri(cri);
 		pageMaker.setTotalCount(service.listCount());
 			
 			model.addAttribute("pageMaker", pageMaker);
 			
 			return "class_detail/list";
 			
 	}
	
	//상세페이지(리뷰 답변 목록,등록,수정)
 	@RequestMapping(value = {"/detail/{classNo}"} ,method=RequestMethod.GET )
	public ModelAndView detail1(HttpServletRequest req,@PathVariable int classNo, Review review) throws Exception{
		log.info("detail()");
		
		ModelAndView view = new ModelAndView();
		
		OffClassVo offClass = service.read(classNo); 
		List<Review> classReview = reviewService.reviewList(classNo);
		int totalReview = reviewService.reviewCount(classNo);
 		int classMemberCount = service.classMemberCount(classNo);
 		
 		//크리에이터 프로필 이미지
		int memberNo = offClass.getMember().getMemberNo();
		MyMember mymember = mypageService.read(memberNo);
		
		//클래스 이미지
		List<Offclass> readImg = service.readImg(classNo); 
		
    	view.setViewName("class_detail/detail");
		view.addObject("mymember",mymember);
		view.addObject("offClass", offClass);
    	view.addObject("classReview",classReview);
      	view.addObject("readImg", readImg);
      	view.addObject("totalReview",totalReview);
      	view.addObject("classMemberCount",classMemberCount);
  		return view;
		
	} 
 	
 	//문의하기
	@RequestMapping(value="/classQuestion/{classNo}/{memberNo}", method=RequestMethod.GET)
 	public ModelAndView question(@PathVariable("classNo") int classNo, @PathVariable("memberNo")int memberNo, ClassQuestion qna) throws Exception{
 		log.info("askForm");
 		
 		ModelAndView view = new ModelAndView();
 		OffClassVo offClass = service.read(classNo); 
 		view.setViewName("class_detail/classQuestion");
 		view.addObject("offClass",offClass);
 		return view;
  	}
 	
	@RequestMapping(value="/classQuestion/{classNo}/{memberNo}", method=RequestMethod.POST)
 	public String question2(@PathVariable("classNo") int classNo, @PathVariable("memberNo") int memberNo, @ModelAttribute("qna") ClassQuestion qna) throws Exception {
 		log.info("question");
 		
 		service.askClass(qna);
 		
 		return "/class_detail/list";
 	}
	
	
	//리뷰 페이지
	@RequestMapping(value="/review/{classNo}", method=RequestMethod.GET)
 	public ModelAndView review(@PathVariable int classNo, Review review) throws Exception{
 		log.info("review");
 		ModelAndView view = new ModelAndView();
 		
 		List<Review> classReview = reviewService.reviewList(classNo);
 		OffClassVo offClass = service.read(classNo);
 		
 		view.setViewName("class_detail/review");
 		view.addObject("classReview",classReview);
 		view.addObject("offClass", offClass);
 		
 		return view;
  	}
	
	
	//리뷰 답변 수정
 	@RequestMapping(value="/review/{classNo}", method=RequestMethod.POST)
 	public RedirectView reviewForm(@PathVariable("classNo") int classNo, @ModelAttribute("review") Review review) throws Exception{
 		log.info("review"); 
 		
		reviewService.reviewInsert(review);
		
		return new RedirectView("/class_detail/review/"+classNo);
 		
   	}
 
	//답변 삭제
 	@RequestMapping(value = {"/reviewDelete/{classNo}/{reviewNo}"} ,method=RequestMethod.POST )
 	private RedirectView deleteReviewOk(@PathVariable("reviewNo") int reviewNo, Review review, @PathVariable("classNo") int classNo) throws Exception{
 		log.info("delete"); 
 		 		
 		reviewService.reviewDelete(reviewNo);
 				
 		return new RedirectView("/class_detail/review/"+classNo);
  	}
	
}
