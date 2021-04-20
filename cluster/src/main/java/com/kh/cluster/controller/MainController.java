package com.kh.cluster.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.Creator;
import com.kh.cluster.entity.OffclassQueryVO;
import com.kh.cluster.service.OffclassQueryService;
import com.kh.cluster.service.OffclassService;

@Controller
public class MainController {

	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	OffclassQueryService service;
	
	@Autowired
	private OffclassService offclassService;

	@GetMapping("/")
	public String main(HttpServletRequest req, Model model) throws Exception {
		log.info("main()");

		HttpSession session = req.getSession();
		Integer memberNo = (Integer) session.getAttribute("no");
		
		// 구현의 편의를 위해 전체 카테고리별로 조회한다. 
		List<OffclassQueryVO> craftClasses = service.searchByCategory(memberNo, "공예", null, "new");
		List<OffclassQueryVO> exerciseClasses = service.searchByCategory(memberNo, "운동", null, "new");
		List<OffclassQueryVO> drowingClasses = service.searchByCategory(memberNo, "드로잉", null, "new");
		List<OffclassQueryVO> musicClasses = service.searchByCategory(memberNo, "음악", null, "new");
		List<OffclassQueryVO> cookingClasses = service.searchByCategory(memberNo, "요리", null, "new");
		List<OffclassQueryVO> studyClasses = service.searchByCategory(memberNo, "스터디", null, "new");
		
		model.addAttribute("craftClasses", toSubList(craftClasses, 4));
		model.addAttribute("exerciseClasses", toSubList(exerciseClasses, 4));
		model.addAttribute("drowingClasses", toSubList(drowingClasses, 4));
		model.addAttribute("musicClasses", toSubList(musicClasses, 4));
		model.addAttribute("cookingClasses", toSubList(cookingClasses, 4));
		model.addAttribute("studyClasses", toSubList(studyClasses, 4));
		
		return "/index";
	}

	@GetMapping("/crafts")
	public String craftsCate(HttpServletRequest req, Model model, 
			@RequestParam(value = "subcategory", required = false) String subcategory,
			@RequestParam(value = "sort", required = false) String sort) throws Exception {
		
		log.info("craftCate()");
		log.info("subcategory::{}", subcategory);
		
		HttpSession session = req.getSession();
		Integer memberNo = (Integer) session.getAttribute("no");
		
		sort = parseSort(sort);

		List<OffclassQueryVO> list = service.searchByCategory(memberNo, "공예", subcategory, sort);
		for (OffclassQueryVO vo : list) {
			log.info("Thumbnail::{}", vo.getThumbnailImage());
		}
		model.addAttribute("offclasses", list);
		model.addAttribute("sort", sort);

		return "/maincate/crafts";
	}
	// 나머지 카테고리는 위의 메소드를 그대로 구현 후 url매핑과 공예, 리턴값 변경 
	
	@GetMapping("/exercise")
	public String exerciseCate(HttpServletRequest req, Model model, 
			@RequestParam(value = "subcategory", required = false) String subcategory,
			@RequestParam(value = "sort", required = false) String sort) throws Exception {
		
		log.info("exerciseCate()");
		log.info("subcategory::{}", subcategory);
		
		HttpSession session = req.getSession();
		Integer memberNo = (Integer) session.getAttribute("no");
		
		sort = parseSort(sort);

		List<OffclassQueryVO> list = service.searchByCategory(memberNo, "운동", subcategory, sort);
		for (OffclassQueryVO vo : list) {
			log.info("Thumbnail::{}", vo.getThumbnailImage());
		}
		model.addAttribute("offclasses", list);
		model.addAttribute("sort", sort);

		return "/maincate/exercise";
	}
	
	@GetMapping("/drawing")
	public String drawingCate(HttpServletRequest req, Model model, 
			@RequestParam(value = "subcategory", required = false) String subcategory,
			@RequestParam(value = "sort", required = false) String sort) throws Exception {
		
		log.info("drawingCate()");
		log.info("subcategory::{}", subcategory);
		
		HttpSession session = req.getSession();
		Integer memberNo = (Integer) session.getAttribute("no");
		
		sort = parseSort(sort);

		List<OffclassQueryVO> list = service.searchByCategory(memberNo, "드로잉", subcategory, sort);
		for (OffclassQueryVO vo : list) {
			log.info("Thumbnail::{}", vo.getThumbnailImage());
		}
		model.addAttribute("offclasses", list);
		model.addAttribute("sort", sort);

		return "/maincate/drawing";
	}
	
	@GetMapping("/music")
	public String musicCate(HttpServletRequest req, Model model, 
			@RequestParam(value = "subcategory", required = false) String subcategory,
			@RequestParam(value = "sort", required = false) String sort) throws Exception {
		
		log.info("musicCate()");
		log.info("subcategory::{}", subcategory);
		
		HttpSession session = req.getSession();
		Integer memberNo = (Integer) session.getAttribute("no");
		
		sort = parseSort(sort);

		List<OffclassQueryVO> list = service.searchByCategory(memberNo, "음악", subcategory, sort);
		for (OffclassQueryVO vo : list) {
			log.info("Thumbnail::{}", vo.getThumbnailImage());
		}
		model.addAttribute("offclasses", list);
		model.addAttribute("sort", sort);

		return "/maincate/music";
	}
	
	@GetMapping("/cooking")
	public String cookingCate(HttpServletRequest req, Model model, 
			@RequestParam(value = "subcategory", required = false) String subcategory,
			@RequestParam(value = "sort", required = false) String sort) throws Exception {
		
		log.info("cookingCate()");
		log.info("subcategory::{}", subcategory);
		
		HttpSession session = req.getSession();
		Integer memberNo = (Integer) session.getAttribute("no");
		
		sort = parseSort(sort);

		List<OffclassQueryVO> list = service.searchByCategory(memberNo, "요리", subcategory, sort);
		for (OffclassQueryVO vo : list) {
			log.info("Thumbnail::{}", vo.getThumbnailImage());
		}
		model.addAttribute("offclasses", list);
		model.addAttribute("sort", sort);

		return "/maincate/cooking";
	}
	
	@GetMapping("/study")
	public String studyCate(HttpServletRequest req, Model model, 
			@RequestParam(value = "subcategory", required = false) String subcategory,
			@RequestParam(value = "sort", required = false) String sort) throws Exception {
		
		log.info("studyCate()");
		log.info("subcategory::{}", subcategory);
		
		HttpSession session = req.getSession();
		Integer memberNo = (Integer) session.getAttribute("no");
		
		sort = parseSort(sort);

		List<OffclassQueryVO> list = service.searchByCategory(memberNo, "스터디", subcategory, sort);
		for (OffclassQueryVO vo : list) {
			log.info("Thumbnail::{}", vo.getThumbnailImage());
		}
		model.addAttribute("offclasses", list);
		model.addAttribute("sort", sort);

		return "/maincate/study";
	}
	
	
	
	@PostMapping("/offclass/{offclassNo}/like")
	public ResponseEntity<String> likeOffclass(HttpServletRequest req, 
			@PathVariable("offclassNo") int classNo) throws Exception {
		
		HttpSession session = req.getSession();
		Integer memberNo = (Integer) session.getAttribute("no");
		
		// 로그인하지 않은 사용자는 httpstatus코드 401번을 반환한다.
		if(memberNo == null) {
			return new ResponseEntity<String>("Unauthorized", HttpStatus.UNAUTHORIZED);
		}
		// 성공하면 httpstatus코드 200을 반환한다. 
		service.updateOffclassLike(memberNo, classNo, true);
		return ResponseEntity.ok("Success");
		
	}
	
	@DeleteMapping("/offclass/{offclassNo}/like")
	public ResponseEntity<String> unLikeOffclass(HttpServletRequest req, 
			@PathVariable("offclassNo") int classNo) throws Exception {
		
		HttpSession session = req.getSession();
		Integer memberNo = (Integer) session.getAttribute("no");
		
		// 로그인하지 않은 사용자는 httpstatus코드 401번을 반환한다.
		if(memberNo == null) {
			return new ResponseEntity<String>("Unauthorized", HttpStatus.UNAUTHORIZED);
		}
		// 성공하면 httpstatus코드 200을 반환한다. 
		service.updateOffclassLike(memberNo, classNo, false);
		return ResponseEntity.ok("Success");
		
	}

	private String parseSort(String sort) {
		if (sort == null) {
			return "new";
		}

		switch (sort) {
		case "hprice":
		case "rprice":
			return sort;
		default:
			return "new";
		}
	}
	
	private List<OffclassQueryVO> toSubList(List<OffclassQueryVO> classes, int size){
		if(CollectionUtils.isEmpty(classes)) {
			return classes;
		}
		size = Math.min(classes.size(), size);
		
		return classes.subList(0, size);
	}
	
	// 크리에이터 홍보 페이지
	@GetMapping("/join")
	public void creatorJoin(HttpServletRequest req, AuthMember member, Model model) throws Exception{
		log.info("creator join()");
		
		List<ClassCategory> categoryList = offclassService.categoryList();
		model.addAttribute("categoryList", categoryList);
	}
	
	// 크리에이터 신청 페이지
	@GetMapping("/joinForm")
	public void getJoinForm(HttpServletRequest req, AuthMember member, Model model) throws Exception{
		log.info("creator getJoinForm()");
		
		model.addAttribute(new Creator());
	}
	
	// 크리에이터 신청 페이지
	@PostMapping("/joinForm")
	public String postJoinForm(Integer memberNo, Creator creator, Model model) throws Exception{
		log.info("creator postJoinForm()");
		
		offclassService.join(creator);
		offclassService.authUpdate(memberNo);
		return "redirect:/";
	}
}
