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
	
	@GetMapping("/home")
	public String home(Creator creator, PagingVO vo, Model model
					,@RequestParam(value="nowPage", required = false)String nowPage
					,@RequestParam(value="cntPerPage", required = false)String cntPerPage) throws Exception {
		log.info("creator home()");
		
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
				
		return "/creator/home";
	}
	
	@GetMapping("/register")
	public String register(Creator creator, PagingVO vo, Model model
					,@RequestParam(value="nowPage", required = false)String nowPage
					,@RequestParam(value="cntPerPage", required = false)String cntPerPage) throws Exception {
		log.info("creator register()");
		
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
		model.addAttribute("list", service.selectCheck(vo));
		
		//model.addAttribute("list", service.checkList());
		
		return "/creator/register";
	}

	@GetMapping("/registerForm")
	public String registerForm(Creator creator, Model model) throws Exception {
		log.info("creator registerForm()");
		
		List<ClassCategory> categoryList = service.categoryList();
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute(new Offclass());
		
		log.info("categoryList = "+ categoryList);
		
		return "/creator/registerForm";
	}
	
	@PostMapping("/registerForm")
	public String registClass(Offclass offclass, Model model) throws Exception{
		log.info("creator registClass()");
		
		String[] files = offclass.getFiles();
		
		log.info("files : " +files);
		
		for(int i = 0; i < files.length; i++) {
			log.info("files[i] = "+files[i]);
		}
		
		service.registClass(offclass);
				
		return "redirect:register";
	}
	
	@GetMapping("test")
	public String test(Offclass offclass, Model model) throws Exception{
		log.info("creator test()");
		
		int classNo = 5;
		model.addAttribute("image", service.getImage(classNo));
				
		return "/creator/mainImage";
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