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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.entity.AuthMemberVO;
import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.Creator;
import com.kh.cluster.entity.Offclass;
import com.kh.cluster.interceptor.Permission;
import com.kh.cluster.interceptor.Permission.MemberAuth;
import com.kh.cluster.service.OffclassService;
import com.kh.cluster.util.MediaUtils;
import com.kh.cluster.util.PagingVO;
import com.kh.cluster.util.UploadFileUtils;

@Controller
@RequestMapping("/creator")
public class CreatorController {
	
	private static final Logger log = LoggerFactory.getLogger(CreatorController.class);
	
	@Autowired
	private OffclassService service;
	
	@Value("${upload.path}")
	private String uploadPath;
	
	HttpSession session;
	
	// 크리에이터 페이지 메인
	@GetMapping("/home")
	@Permission(authority = MemberAuth.강사)
	public void home(HttpServletRequest req, Creator creator, Model model) throws Exception{
		log.info("creator home()");
		
		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		int memberNo = member.getMemberNo();
		//String memberAuth = member.getMemberAuth();
		
		//if(memberAuth != null && memberAuth.equals("강사")) {
			model.addAttribute("Creator", service.setcreator(memberNo));
		//	return "/creator/home";
		//}else {
		//	return "redirect:/";
		//}
		
	}
	
	// 크리에이터 정보 수정
	@GetMapping("/edit")
	@Permission(authority = MemberAuth.강사)
	public void getEdit(HttpServletRequest req, Model model) throws Exception{
		log.info("creator getEdit()");
		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		model.addAttribute("Creator", service.setcreator(memberNo));
	}
	
	// 크리에이터 정보 수정
	@PostMapping("/edit")
	@Permission(authority = MemberAuth.강사)
	public String postEdit(Creator creator, Model model) throws Exception {
		log.info("creator postEdit()");
		
		service.creatorEdit(creator);
		
		return "redirect:classinfo";
	}
	
	// 크리에이터 진행 중 강의 정보
	@GetMapping("/classinfo")
	@Permission(authority = MemberAuth.강사)
	public void home(HttpServletRequest req, PagingVO vo, Model model
					,@RequestParam(value="nowPage", required = false)String nowPage
					,@RequestParam(value="cntPerPage", required = false)String cntPerPage) throws Exception {
		log.info("creator classinfo()");
		
		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		Creator creator = service.setcreator(memberNo);
		model.addAttribute("Creator", creator);
		
		int creatorNo = creator.getCreatorNo();
		log.info("creatorNo =" + creatorNo );
		
		int total = service.countClass(creatorNo);
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), creatorNo);
		model.addAttribute("paging", vo);
		model.addAttribute("list", service.selectClass(vo));
	}
	
	// 크리에이터 검수 중 강의 정보
	@GetMapping("/classcheck")
	@Permission(authority = MemberAuth.강사)
	public void register(HttpServletRequest req, PagingVO vo, Model model
					,@RequestParam(value="nowPage", required = false)String nowPage
					,@RequestParam(value="cntPerPage", required = false)String cntPerPage) throws Exception {
		log.info("creator classcheck()");
		
		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		int memberNo = member.getMemberNo();

		Creator creator = service.setcreator(memberNo);
		model.addAttribute("Creator", creator);
		
		int creatorNo = creator.getCreatorNo();
		log.info("creatorNo =" + creatorNo );
		
		int total = service.countCheck(creatorNo);
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), creatorNo);
		model.addAttribute("paging", vo);
		model.addAttribute("list", service.selectCheck(vo));
	}

	// 크리에이터 강의별 매출 정보
	@GetMapping("salesbyclass")
	@Permission(authority = MemberAuth.강사)
	public void salesbyclass(HttpServletRequest req, PagingVO vo, Model model
					,@RequestParam(value="nowPage", required = false)String nowPage
					,@RequestParam(value="cntPerPage", required = false)String cntPerPage) throws Exception {
		log.info("creator salesbyclass()");
		
		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		Creator creator = service.setcreator(memberNo);
		model.addAttribute("Creator", creator);
		
		int creatorNo = creator.getCreatorNo();
		log.info("creatorNo =" + creatorNo );
		
		int total = service.countClass(creatorNo);
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), creatorNo);
		model.addAttribute("paging", vo);
		model.addAttribute("list", service.selectClass(vo));
	}
	
	// 크리에이터 기간 별 매출정보
	@GetMapping("salesbyperiod")
	@Permission(authority = MemberAuth.강사)
	public void salesbyperiod(HttpServletRequest req, Model model) throws Exception{
		log.info("creator salesbypreiod()");
		
		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		model.addAttribute("Creator", service.setcreator(memberNo));
	}
	
	// 강의 검수 데이터 등록
	@GetMapping("/registerForm")
	@Permission(authority = MemberAuth.강사)
	public void registerForm(HttpServletRequest req, Model model) throws Exception {
		log.info("creator registerForm()");
		
		AuthMemberVO member = (AuthMemberVO) req.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		model.addAttribute("Creator", service.setcreator(memberNo));
		
		List<ClassCategory> categoryList = service.categoryList();
				
		model.addAttribute("categoryList", categoryList);
		model.addAttribute(new Offclass());
	}
	
	// 강의 검수 데이터 저장
	@PostMapping("/registerForm")
	@Permission(authority = MemberAuth.강사)
	public String registClass(Offclass offclass, Model model) throws Exception{
		log.info("creator registClass()");
		
		String[] files = offclass.getFiles();
		
		for(int i = 0; i < files.length; i++) {
			log.info("files[i] = "+files[i]);
		}
		
		service.registClass(offclass);
				
		return "redirect:classcheck";
	}
	
	// 검수 후 시작날짜 설정
	@GetMapping("/startdate")
	@Permission(authority = MemberAuth.강사)
	public void getStartDateModify(int classNo, Model model) throws Exception{
		log.info("creator getStartDateUpdate()");
		
		model.addAttribute(service.readDate(classNo));
	}
	
	// 검수 후 설정한 날짜로 수정
	@PostMapping("/startdatemodify")
	@Permission(authority = MemberAuth.강사)
	public String postStartDateModify(Offclass offclass, Model model) throws Exception{
		log.info("creator postStartDateUpdate()");
		
		service.startDateModify(offclass);
		
		return "redirect:classinfo";
	}
	
	// 검수 후 종료날짜 설정
	@GetMapping("/enddate")
	@Permission(authority = MemberAuth.강사)
	public void getEndDateModify(int classNo, Model model) throws Exception{
		log.info("creator getEndDateUpdate()");
		
		model.addAttribute(service.readDate(classNo));
	}
	
	// 검수 후 설정한 날짜로 수정
	@PostMapping("/enddatemodify")
	@Permission(authority = MemberAuth.강사)
	public String postEndDateModify(Offclass offclass, Model model) throws Exception{
		log.info("creator postEndDateUpdate()");
		
		service.endDateModify(offclass);
		
		return "redirect:classinfo";
	}
		
	// 검수 진행 중, 반려 시 데이터 삭제
	@GetMapping("/delete")
	@Permission(authority = MemberAuth.강사)
	public String removeClass(int classNo, Model model) throws Exception{
		log.info("creator deleteClass()");
		
		service.classRemove(classNo);
		
		return "redirect:classcheck";
	}
	
	@PostMapping(value = "/uploadAjax", produces = "text/plain; charset=UTF-8")
	@Permission(authority = MemberAuth.강사)
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		log.info("원본 파일명 : " + file.getOriginalFilename());
		
		String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		log.info("savedName: " + savedName);
		
		return new ResponseEntity<String>(savedName, HttpStatus.CREATED);
	}
	
	@GetMapping("/displayFile")
	@Permission(authority = MemberAuth.강사)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		log.info("파일명: " + fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName );
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\""); 
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
	
	
}