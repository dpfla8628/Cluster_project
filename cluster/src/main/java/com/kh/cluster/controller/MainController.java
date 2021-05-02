package com.kh.cluster.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Collections;
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
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.entity.AuthMemberVO;
import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.Creator;
import com.kh.cluster.entity.OffclassQueryVO;
import com.kh.cluster.service.ClassDetailService;
import com.kh.cluster.service.OffclassQueryService;
import com.kh.cluster.service.OffclassService;
import com.kh.cluster.util.MediaUtils;

@Controller
public class MainController {

	private static final Logger log = LoggerFactory.getLogger(MainController.class);

	@Autowired
	OffclassQueryService service;

	@Autowired
	private OffclassService offclassService;
	 

	@Value("${upload.path}")
	private String uploadPath;

	@GetMapping("/")
	public String main(HttpServletRequest req, Model model) throws Exception {
		log.info("main()");

		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		Integer memberNo = extractMemberNo(member);
//		HttpSession session = req.getSession();
//		Integer memberNo = (Integer) session.getAttribute("no");

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
	
	@GetMapping("/search")
	public String search(HttpServletRequest req, Model model, 
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "sort", required = false) String sort) throws Exception {

		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		Integer memberNo = extractMemberNo(member);
//		HttpSession session = req.getSession();
//		Integer memberNo = (Integer) session.getAttribute("no");

		// 구현의 편의를 위해 전체 카테고리별로 조회한다.
		List<OffclassQueryVO> search = Collections.emptyList();
		
		if(keyword != null) {
			search = service.searchByKeyword(memberNo, keyword, "new");
		}
		
		model.addAttribute("offclasses", toSubList(search, 16));
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);

		return "/search/index";
	}

	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		log.info("파일명: " + fileName);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			log.info("fullFilePath ::{}", uploadPath + fileName);
			in = new FileInputStream(uploadPath + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}

		return entity;
	}

	@GetMapping("/crafts")
	public String craftsCate(HttpServletRequest req, Model model,
			@RequestParam(value = "subcategory", required = false) String subcategory,
			@RequestParam(value = "sort", required = false) String sort) throws Exception {

		log.info("craftCate()");
		log.info("subcategory::{}", subcategory);

		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		Integer memberNo = extractMemberNo(member);

		sort = parseSort(sort);

		List<OffclassQueryVO> list = service.searchByCategory(memberNo, "공예", subcategory, sort);
		for (OffclassQueryVO vo : list) {
			log.info("Thumbnail::{}", vo.getThumbnailImage());
		}
		model.addAttribute("offclasses", list);
		model.addAttribute("sort", sort);
		model.addAttribute("member", member);

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
	public ResponseEntity<String> likeOffclass(HttpServletRequest req, @PathVariable("offclassNo") int classNo)
			throws Exception {

		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		Integer memberNo = null;

		// 성공하면 httpstatus코드 200을 반환한다.
		if (member != null) {
			memberNo = member.getMemberNo();
			service.updateOffclassLike(memberNo, classNo, true);
 			return ResponseEntity.ok("Success");
		}
		// 로그인하지 않은 사용자는 httpstatus코드 401번을 반환한다.
		return new ResponseEntity<String>("Unauthorized", HttpStatus.UNAUTHORIZED);

	}

	@DeleteMapping("/offclass/{offclassNo}/like")
	public ResponseEntity<String> unLikeOffclass(HttpServletRequest req, @PathVariable("offclassNo") int classNo)
			throws Exception {

		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		Integer memberNo = member.getMemberNo();

		// 로그인하지 않은 사용자는 httpstatus코드 401번을 반환한다.
		if (memberNo == null) {
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

	private List<OffclassQueryVO> toSubList(List<OffclassQueryVO> classes, int size) {
		if (CollectionUtils.isEmpty(classes)) {
			return classes;
		}
		size = Math.min(classes.size(), size);

		return classes.subList(0, size);
	}

	private Integer extractMemberNo(AuthMemberVO member) {
		if (member != null) {
			return member.getMemberNo();
		}
		return null;
	}

	// 크리에이터 홍보 페이지
	@GetMapping("/join")
	public void creatorJoin(HttpServletRequest req, AuthMember member, Model model) throws Exception {
		log.info("creator join()");

		List<ClassCategory> categoryList = offclassService.categoryList();
		model.addAttribute("categoryList", categoryList);
	}

	// 크리에이터 신청 페이지
	@GetMapping("/joinForm")
	public void getJoinForm(HttpServletRequest req, AuthMember member, Model model) throws Exception {
		log.info("creator getJoinForm()");

		model.addAttribute(new Creator());
	}

	// 크리에이터 신청 페이지
	@PostMapping("/joinForm")
	public String postJoinForm(Integer memberNo, Creator creator, Model model) throws Exception {
		log.info("creator postJoinForm()");

		offclassService.join(creator);
		offclassService.authUpdate(memberNo);
		return "redirect:/login/";
	}
}
