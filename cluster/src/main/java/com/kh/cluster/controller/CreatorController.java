package com.kh.cluster.controller;


import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

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

import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.Creator;
import com.kh.cluster.entity.Offclass;
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
	
	// 크리에이터 홍보 페이지
	@GetMapping("/join")
	public void creatorJoin(/*Member member,*/Model model) throws Exception{
		log.info("creator join()");
		
		List<ClassCategory> categoryList = service.categoryList();
		
		model.addAttribute("categoryList", categoryList);
		
	}
	
	// 크리에이터 신청 페이지
	@GetMapping("/joinForm")
	public void getJoinForm(/*Member member,*/Model model) throws Exception{
		log.info("creator getJoinForm()");
		
		model.addAttribute(new Creator());
	}
	
	// 크리에이터 신청 페이지
	@PostMapping("/joinForm")
	public String postJoinForm(Integer memberNo, Creator creator, Model model) throws Exception{
		log.info("creator postJoinForm()");
		
		service.join(creator);
		service.authUpdate(memberNo);
		return "redirect:/";
	}
	
	// 크리에이터 페이지 메인
	@GetMapping("/")
	public String home() {
		log.info("creator home()");
		
		return "/creator/home";
	}
		
	// 크리에이터 진행 중 강의 정보
	@GetMapping("/classinfo")
	public String home(Creator creator, PagingVO vo, Model model
					,@RequestParam(value="nowPage", required = false)String nowPage
					,@RequestParam(value="cntPerPage", required = false)String cntPerPage) throws Exception {
		log.info("creator classinfo()");
		
		int total = service.countClass();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("list", service.selectClass(vo));
		//model.addAttribute("list", service.classList());
				
		return "/creator/classinfo";
	}
	
	// 크리에이터 검수 중 강의 정보
	@GetMapping("/classcheck")
	public String register(Creator creator, PagingVO vo, Model model
					,@RequestParam(value="nowPage", required = false)String nowPage
					,@RequestParam(value="cntPerPage", required = false)String cntPerPage) throws Exception {
		log.info("creator classcheck()");
		
		int total = service.countCheck();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("list", service.selectCheck(vo));
		
		//model.addAttribute("list", service.checkList());
		
		return "/creator/classcheck";
	}

	// 크리에이터 강의별 매출 정보
	@GetMapping("salesbyclass")
	public String salesbyclass(Creator creator, PagingVO vo, Model model
					,@RequestParam(value="nowPage", required = false)String nowPage
					,@RequestParam(value="cntPerPage", required = false)String cntPerPage) throws Exception {
		log.info("creator salesbyclass()");
		
		int total = service.countClass();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("list", service.selectClass(vo));
		
		//model.addAttribute("list", service.checkList());
		
		return "/creator/salesbyclass";
	}
	
	// 크리에이터 기간 별 매출정보
	@GetMapping("salesbyperiod")
	public String salesbyperiod(Creator creator, Model model) throws Exception{
		log.info("creator salesbypreiod()");
		
		return "/creator/salesbyperiod";
	}
	
	// 강의 검수 데이터 등록
	@GetMapping("/registerForm")
	public String registerForm(Creator creator, Model model) throws Exception {
		log.info("creator registerForm()");
		
		List<ClassCategory> categoryList = service.categoryList();
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute(new Offclass());
		
		return "/creator/registerForm";
	}
	
	// 강의 검수 데이터 저장
	@PostMapping("/registerForm")
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
	public void getStartDateModify(int classNo, Model model) throws Exception{
		log.info("creator getStartDateUpdate()");
		
		model.addAttribute(service.readDate(classNo));
	}
	
	// 검수 후 설정한 날짜로 수정
	@PostMapping("/startdatemodify")
	public String postStartDateModify(Offclass offclass, Model model) throws Exception{
		log.info("creator postStartDateUpdate()");
		
		service.startDateModify(offclass);
		
		return "redirect:classinfo";
	}
	
	// 검수 후 종료날짜 설정
	@GetMapping("/enddate")
	public void getEndDateModify(int classNo, Model model) throws Exception{
		log.info("creator getEndDateUpdate()");
		
		model.addAttribute(service.readDate(classNo));
	}
	
	// 검수 후 설정한 날짜로 수정
	@PostMapping("/enddatemodify")
	public String postEndDateModify(Offclass offclass, Model model) throws Exception{
		log.info("creator postEndDateUpdate()");
		
		service.endDateModify(offclass);
		
		return "redirect:classinfo";
	}
		
	// 검수 진행 중, 반려 시 데이터 삭제
	@GetMapping("/delete")
	public String removeClass(int classNo, Model model) throws Exception{
		log.info("creator deleteClass()");
		
		service.classRemove(classNo);
		
		return "redirect:classcheck";
	}
	
	@PostMapping(value = "/uploadAjax", produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		log.info("원본 파일명 : " + file.getOriginalFilename());
		
		String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		log.info("savedName: " + savedName);
		
		return new ResponseEntity<String>(savedName, HttpStatus.CREATED);
	}
	
	@GetMapping("/displayFile")
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