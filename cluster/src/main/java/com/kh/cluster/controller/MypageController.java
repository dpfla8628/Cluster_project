package com.kh.cluster.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cluster.util.MediaUtils;
import com.kh.cluster.util.UploadFileUtils;
import com.kh.cluster.entity.MyClassLike;
import com.kh.cluster.entity.MyClassOrder;
import com.kh.cluster.entity.MyCoupon;
import com.kh.cluster.entity.MyMember;
import com.kh.cluster.entity.MyReview;
import com.kh.cluster.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private final static Logger log =
			LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MypageService service;
	
	@Value("${upload.path}")
	private String uploadPath;
	
	//session으로 받아와야하는 멤버 번호이다 일단은 1으로 생각하고 쓰자
	int memberNo=1;
	
	//오늘 날짜
	SimpleDateFormat f = new SimpleDateFormat ("yyyy-MM-dd");
	Date time = new Date();
	String sysdate = f.format(time);
	
	@GetMapping("/index")
	public String index(Model model, MyClassLike like) throws Exception {
		log.info("index()");
		MyMember mymember = service.read(memberNo);
		model.addAttribute("mymember",mymember);
		model.addAttribute("likeList",service.classlike(memberNo));
		model.addAttribute("ordercount",service.count(mymember));
		model.addAttribute("couponcount", service.couponcount(memberNo));
		return "/mypage/index";
	}
	
	@GetMapping("/myedit")
	public String getEdit(Model model)throws Exception{
		log.info("getEdit()");
		MyMember mymember = new MyMember();
		mymember=service.read(memberNo);
		model.addAttribute("mymember",mymember);
		return "/mypage/myedit";
	}

	@PostMapping("/mydelete")
	public String deleteProfile() throws Exception {
		log.info("postdelete()");
		service.delete(memberNo);
		return "redirect:/mypage/myedit";
	}
	@PostMapping("/myedit")
	public String postModify(MyMember mymember, Model model) throws Exception {
		try {
		log.info("postModify()");
		String[] files = mymember.getFiles();
		for(int i = 0; i < files.length; i++) {
			log.info("files[i] = " + files[i]);
		}
		service.modify(mymember);
		return "redirect:/mypage/index";
		
		}catch(Exception e) {
			return "redirect:/mypage/index";
		}
	}
	
	@GetMapping("/mycoupon")
	public String coupon(Model model)throws Exception{
		model.addAttribute("couponlist",service.couponlist(memberNo));
		return "mypage/mycoupon";
	}
	
	@GetMapping("/myclass")
	public String myclass(Model model)throws Exception{
		model.addAttribute("orderList", service.orderlist(memberNo));
		model.addAttribute("sysdate",sysdate);
		return "/mypage/myclass";
	}
	
	@GetMapping("/myreview_list")
	public String myreview_list(Model model)throws Exception{
		log.info("review_list()");
		
		model.addAttribute("reviewList",service.riviewlist(memberNo));
		
		return "mypage/myreview_list";
	}
	
	@GetMapping("/myreview_edit")
	public void get_myreview_edit(Model model, Integer reviewNo)throws Exception{
		
		MyReview myreview = (service.reviewcheck(reviewNo));
		model.addAttribute("myreview",myreview);

	}
	@PostMapping("/myreview_edit")
	public String post_myreview_edit(Model model, MyReview myreview)throws Exception{
		service.reviewedit(myreview);
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
	
	@GetMapping("/myreview_write")
	public void g_myreview_write(Model model, Integer classNo)throws Exception{
		MyReview myreview = (service.reviewwrite(classNo));
		model.addAttribute("myreview",myreview);
	}
	@PostMapping("/myreview_write")
	public String p_myreview_write(MyReview myreview)throws Exception{
		service.reviewedit(myreview);
		return "redirect:/mypage/myreview_list";
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
	
	
	@PostMapping(value = "/uploadAjax", produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> uploadAjax (MultipartFile file) throws Exception {
		
		log.info("원본 파일명: " + file.getOriginalFilename());
		
		// 유틸 라이브러리 작성 필요
		String savedName = UploadFileUtils.uploadFile(
				uploadPath, file.getOriginalFilename(), file.getBytes());
		
		return new ResponseEntity<String>(savedName, HttpStatus.CREATED);
	}
	
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		log.info("파일명: " + fileName);
		
		try {
			String formatName = 
					fileName.substring(fileName.lastIndexOf(".") + 1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName);
			
			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" +
						new String(fileName.getBytes("UTF-8"), 
								"ISO-8859-1") + "\"");
			}
			
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		
		return entity;
	}
	@GetMapping("/getAttach/{memberNo}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("memberNo") Integer memberNo) 
			throws Exception {
		
		return service.getAttach(memberNo);
	}
}
