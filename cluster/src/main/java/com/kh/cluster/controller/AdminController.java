package com.kh.cluster.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.service.AdminService;
import com.kh.cluster.util.DateUtil;
import com.kh.cluster.util.MediaUtils;
import com.kh.cluster.util.PagingUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private final static Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService service;
	
	@Value("${upload.path}")
	private String uploadPath;
	
	@GetMapping("/home")
	public String adminHome(HttpServletRequest req, Locale locale, Model model) throws Exception {
		
		log.info("adminHome()");
		
		//현재 날짜
		Date date = new Date();
		
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String serverTime = dateFormat.format(date);
		
		model.addAttribute("serverTime", serverTime);
		
		
		//////////////총 회원수 구하는 코드 시작
		
		//최근 6개월 + 이번달 구해서 monthList에 넣기. DateUtil의 addMonth메소드사용
		Date[] monthList = new Date[7];
		
		for(int i=0, j=-6; i <= 6; j++, i++) {
			if(i == 6) {
				monthList[i] = date;
				break;
			}
			monthList[i] = DateUtil.addMonth(date, j);  
		}
		
		model.addAttribute("monthList", monthList);
		
		//최근 6개월  ~ 이번달까지 해당 시기의 총 회원수 구하기. ex) 2021년3월의 총 회원수, 2021년 4월의 총 회원수 ...
		model.addAttribute("memberCountList", service.getCountMember());
		
		///////////////////윗줄까지 총 회원수 구하는 코드 끝
		
		
		
		////////////////////일별 회원가입 수 구하는 코드 시작
		//오늘 포함 최근 7일에 관한 날짜 정보를 구해서 dayList 배열에 넣기. DateUtil의 addDays메소드사용
		
		Date[] dayList = new Date[7];
		
		for(int i=0, j=-6; i <= 6; j++, i++) {
			if(i == 6) {
				dayList[i] = date;
				break;
			}
			dayList[i] = DateUtil.addDays(date, j);  
		}
		
		model.addAttribute("dayList", dayList);
		
		//오늘 ~ 6일전까지 일별 회원가입 수 데이터 구하기
		model.addAttribute("memberJoinList",service.getCountJoin());
		
		//////////////윗줄까지 일별 회원가입 수 구하는 코드 끝
	
		
		//////////////최근 6개월 + 이번달 월매출액 가져오기
		model.addAttribute("monthSales", service.getMonthSales());
		
		
		/////////////최근 6일 + 오늘 매출액 가져오기
		model.addAttribute("daySales", service.getDaySales());
		
		
		//매출액 Top10 클래스 가져오기
		model.addAttribute("listForTop10Sales", service.getTop10Sales());
		
		//판매수 Top10 클래스 가져오기
		model.addAttribute("listForTop10Class", service.getTop10Class());
		
		return "admin/home";
	}
	
	
	
	@GetMapping("/creator/creatorList")
	public String creatorList(@RequestParam(value="p", required=false) Integer p, @RequestParam(value="type", required=false) String type, @RequestParam(value="key", required=false) String key, Model model) throws Exception {
		
		log.info("creatorList()");
		
		Map<String, Object> map = PagingUtil.getPaging(p, type, key, 15, 5, "creatorList");
		
		model.addAttribute("list", map.get("adminCreatorVOList"));
		model.addAttribute("startNum", map.get("startNum"));
		model.addAttribute("endNum", map.get("endNum"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("p", map.get("p"));
		model.addAttribute("type", map.get("type"));
		model.addAttribute("key", map.get("key"));
		model.addAttribute("isSearch", map.get("isSearch"));
		
		return "admin/creator/creatorList";
		
	}
	
	@GetMapping("/creator/income")
	public String income(@RequestParam(value="date", required=false) String date, @RequestParam(value="type", required=false) String type, @RequestParam(value="key", required=false) String key, Model model) throws Exception {
		
		log.info("income");
		
		boolean isSearch = date != null && key != null;
		
		//날짜와 크리에이터명으로 검색시
		if(isSearch) {
			Map<String, Object> map = new HashMap<>();
			map.put("date", date);
			map.put("type", type);
			map.put("key", key);
			
			model.addAttribute("list", service.getSearchCreatorIncomeList(map));
		}
		else {
			//날짜검색이 아닐때 현재날짜의 정산목록
			model.addAttribute("list", service.getCreatorIncomeList());
		}
		
		model.addAttribute("date", date);
		model.addAttribute("type", type);
		model.addAttribute("key", key);
		
		
		return "admin/creator/income";
	}
	
	@PostMapping("/creator/calcIncome")
	@ResponseBody
	public String calcIncome(@RequestParam(value="date", required=true) String date) throws Exception {
		
		service.calcCreatorIncome(date);
		
		return date;
	}
	
	
	@GetMapping("/class/checkClassOpen")
	public String checkClassOpen(@RequestParam(value="p", required=false) Integer p, @RequestParam(value="type", required=false) String type, @RequestParam(value="key", required=false) String key, Model model) throws Exception {
		
		log.info("checkClassOpen()");
		
		Map<String, Object> map = PagingUtil.getPaging(p, type, key, 15, 5, "checkClassOpen");
		
		model.addAttribute("list", map.get("adminOffclassVOList"));
		model.addAttribute("startNum", map.get("startNum"));
		model.addAttribute("endNum", map.get("endNum"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("p", map.get("p"));
		model.addAttribute("type", map.get("type"));
		model.addAttribute("key", map.get("key"));
		model.addAttribute("isSearch", map.get("isSearch"));
		
		
		return "admin/class/checkClassOpen";
	}
	
	@PostMapping("/class/checkClassOpen")
	@ResponseBody
	public int postCheckClassOpen(@RequestParam(value="classNo", required = true) int classNo, @RequestParam(value="classCheck", required=true) String classCheck, Model model) throws Exception {
		
		log.info("postCheckClassOpen()");
		
		//승인시
		if(classCheck.equals("승인")) {
			service.yesClassOpen(classNo);
		}
		//반려시
		else if(classCheck.equals("반려")) {
			service.noClassOpen(classNo);
		}
		//대기시
		else {
			service.waitClassOpen(classNo);
		}
		
		
		return classNo;
	}
	
	@GetMapping("/class/openClass")
	public String openClass(@RequestParam(value="p", required=false) Integer p, @RequestParam(value="type", required=false) String type, @RequestParam(value="key", required=false) String key, Model model) throws Exception {
		
		log.info("openClass()");
		
		Map<String, Object> map = PagingUtil.getPaging(p, type, key, 15, 5, "openClass");
		
		model.addAttribute("list", map.get("adminOffclassVOList"));
		model.addAttribute("startNum", map.get("startNum"));
		model.addAttribute("endNum", map.get("endNum"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("p", map.get("p"));
		model.addAttribute("type", map.get("type"));
		model.addAttribute("key", map.get("key"));
		model.addAttribute("isSearch", map.get("isSearch"));
		
		return "admin/class/openClass";
	}
	
	@GetMapping("/class/comingSoonClass")
	public String comingSoonClass(@RequestParam(value="p", required=false) Integer p, @RequestParam(value="type", required=false) String type, @RequestParam(value="key", required=false) String key, Model model) throws Exception {
		
		log.info("comingSoonClass()");
		
		Map<String, Object> map = PagingUtil.getPaging(p, type, key, 15, 5, "comingSoonClass");
		
		model.addAttribute("list", map.get("adminOffclassVOList"));
		model.addAttribute("startNum", map.get("startNum"));
		model.addAttribute("endNum", map.get("endNum"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("p", map.get("p"));
		model.addAttribute("type", map.get("type"));
		model.addAttribute("key", map.get("key"));
		model.addAttribute("isSearch", map.get("isSearch"));
		
		return "admin/class/comingSoonClass";
	}
	
	
	@GetMapping("/class/closedClass")
	public String closedClass(@RequestParam(value="p", required=false) Integer p, @RequestParam(value="type", required=false) String type, @RequestParam(value="key", required=false) String key, Model model) throws Exception {
		
		log.info("closedClass()");
		
		Map<String, Object> map = PagingUtil.getPaging(p, type, key, 15, 5, "closedClass");
		
		model.addAttribute("list", map.get("adminOffclassVOList"));
		model.addAttribute("startNum", map.get("startNum"));
		model.addAttribute("endNum", map.get("endNum"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("p", map.get("p"));
		model.addAttribute("type", map.get("type"));
		model.addAttribute("key", map.get("key"));
		model.addAttribute("isSearch", map.get("isSearch"));
		
		return "admin/class/closedClass";
		
	}
	
	@GetMapping("/class/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		//DB에 파일 이름 앞에 'me=' 붙은거 때문에 해줘야함 
		fileName = fileName.substring(fileName.indexOf("=") + 1);
		log.info("파일명 : " + fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			MediaType mediaType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);
			
			if(mediaType != null) {
				headers.setContentType(mediaType);
			}
			else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" +
							new String(fileName.getBytes("UTF-8"),
							"ISO-8859-1") + "\"");
			}
			
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		finally {
			in.close();
		}
		
		return entity;
		
	}
	
	
	@GetMapping("/member/memberList")
	public String memberList(@RequestParam(value="p", required=false) Integer p, @RequestParam(value="type", required=false) String type, @RequestParam(value="key", required=false) String key, Model model) throws Exception {
		
		log.info("memberList()");
		
		
		Map<String, Object> map = PagingUtil.getPaging(p, type, key, 15, 5, "memberList");
			
		model.addAttribute("list", map.get("adminMemberVOList"));
		model.addAttribute("startNum", map.get("startNum"));
		model.addAttribute("endNum", map.get("endNum"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("p", map.get("p"));
		model.addAttribute("type", map.get("type"));
		model.addAttribute("key", map.get("key"));
		model.addAttribute("isSearch", map.get("isSearch"));
	
			
		return "admin/member/memberList";
		
	}
	
	@GetMapping("/member/memberOrder")
	public String memberOrder(
			@RequestParam(value="p", required=false) Integer p,
			@RequestParam(value="type", required=false) String type,
			@RequestParam(value="key", required=false) String key,
			@RequestParam(value="startDate", required=false) String startDate,
			@RequestParam(value="endDate", required=false) String endDate,
			Model model) throws Exception {
		
		log.info("memberOrder()");
		
		Map<String, Object> map = PagingUtil.getPaging(p, type, key, startDate, endDate, 15, 5, "memberOrder");
		
		model.addAttribute("list", map.get("adminClassorderList"));
		model.addAttribute("startNum", map.get("startNum"));
		model.addAttribute("endNum", map.get("endNum"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("p", map.get("p"));
		model.addAttribute("type", map.get("type"));
		model.addAttribute("key", map.get("key"));
		model.addAttribute("startDate", map.get("startDate"));
		model.addAttribute("endDate", map.get("endDate"));
		model.addAttribute("isSearch", map.get("isSearch"));
		
		return "admin/member/memberOrder";
	}
	
	@GetMapping("/member/confirmPayment")
	public ResponseEntity<Integer> confirmPayment(@RequestParam(value="orderNo", required=true) int orderNo) throws Exception {
		
		service.confirmPayment(orderNo);
		
		return new ResponseEntity<Integer>(orderNo, HttpStatus.OK);
		
	}
	
	@GetMapping("/sales/total")
	public String total(@RequestParam(value="yearMonth", required=false) String yearMonth, Model model) throws Exception {
	
		log.info("total()");
		
		boolean isSearch = yearMonth != null; 
		
		
		if(isSearch) {
			//검색한 년월 값
			model.addAttribute("yearMonth", yearMonth);
			//검색시 월매출
			model.addAttribute("monthSales", service.getSearchMonthSales(yearMonth));
			//검색시 연매출
			model.addAttribute("yearSales", service.getSearchYearSales(yearMonth));
			//검색시 해당년월의 일매출+월매출
			model.addAttribute("list", service.getSearchSalesList(yearMonth));
			//검색시 올해 전체 월매출
			model.addAttribute("totalSales", service.getTotalSales(yearMonth));
			
		}
		
		else {
			//검색이 아닐때 이번달 월매출
			model.addAttribute("monthSales", service.getThisMonthSales());
			//검색이 아닐때 오늘날짜 이번년 연매출
			model.addAttribute("yearSales", service.getYearSales());
			//검색이 아닐때 올해 이번달 일매출+월매출
			model.addAttribute("list", service.getSalesList());
			//검색이 아닐때 올해 전체 월매출
			model.addAttribute("totalSales", service.getTotalSales());
			
		}
		
		
		return "admin/sales/total";
	}
	
	@GetMapping("/sales/particular")
	public String particular(@RequestParam(value="classNo", required=false) Integer classNo, @RequestParam(value="yearMonth", required=false) String yearMonth, Model model) throws Exception {
	
		log.info("particular()");
		
		//검색인지 판정
		boolean isSearch = classNo != null && yearMonth != null;
		
		
		//검색일때
		if(isSearch) {
			
			Map<String, Object> map = new HashMap<>();
			map.put("classNo", classNo);
			map.put("yearMonth", yearMonth);
			
			//검색한 클래스+년월의 일매출+월매출 가져오기
			model.addAttribute("salesList", service.getParticularSales(map));
			//검색시 해당 클래스의 연매출
			model.addAttribute("yearSales", service.getParticularYearSales(map));
			//검색시 해당 클래스의 월매출 
			model.addAttribute("monthSales", service.getParticularMonthSales(map));
			//검색시 해당 클래스의 해당년도 전체 월매출
			model.addAttribute("totalSales", service.getParticularTotalSales(map));
		}
		else {
			//검색이 아닐때(맨처음 페이지 들어올시) 셀렉박스의 첫번째 강의의 현재년월의 월매출+일매출
			model.addAttribute("salesList", service.getParticularSales());
			//검색이 아닐때(맨처음 페이지 들어올시) 셀렉박스의 첫번째 강의의 올해 연매출
			model.addAttribute("yearSales", service.getParticularYearSales());
			//검색이 아닐때(맨처음 페이지 들어올시) 셀렉박스의 첫번째 강의의 올해 월매출
			model.addAttribute("monthSales", service.getParticularMonthSales());
			//검색이 아닐때(맨처음 페이지 들어올시) 셀렉박스의 첫번째 강의 올해 전체 월매출
			model.addAttribute("totalSales", service.getParticularTotalSales());
		}
		
		
		//진행중인 클래스 목록 가져와서 셀렉박스에 찍어줘야함
		model.addAttribute("openClassList", service.getOpenClassList());
		//클래스 번호 넘겨주기
		model.addAttribute("classNo", classNo);
		//년월 넘겨주기
		model.addAttribute("yearMonth", yearMonth);
		
		return "admin/sales/particular";
	}
	
	@GetMapping("/event/eventList")
	public String eventList(@RequestParam(value="key", required=false) String key, @RequestParam(value="option", required=false) String option, Model model) throws Exception {
		
		log.info("eventList() - "+option);
		
		//검색인지 아닌지 확인
		boolean isSearch = key != null;
		
		//오늘날짜 구해서 넘겨주기
		Date date = new Date();
		model.addAttribute("today", date);
		
		//검색일때
		if(isSearch) {
			//옵션이 null 이거나 '전체'일때
			if(option == null || option.equals("all")) {
				model.addAttribute("list", service.getSearchEventList(key));
			}
			//옵션이 '진행중'일때
			else if(option.equals("ing")) {
				model.addAttribute("list", service.getSearchIngEventList(key));
			}
			//옵션이 '진행예정'일때
			else if(option.equals("comingSoon")) {
				model.addAttribute("list", service.getSearchComingSoonEventList(key));
			}
			//옵션이 '진행종료'일때
			else if(option.equals("end")) {
				model.addAttribute("list", service.getSearchEndEventList(key));
			}
			
			model.addAttribute("key", key);
		}
		//검색이 아닐때
		else {
			//셀렉박스 옵션에 맞게 필터링한 목록
			
			//셀렉박스 옵션을 선택안하거나 옵션이'전체'일때
			if(option == null || option.equals("all")) {
				model.addAttribute("list", service.getEventList());
			}
			
			//셀렉박스 옵션이 '진행중'일때
			else if(option.equals("ing")) {
				model.addAttribute("list", service.getIngEventList());
			}
			//셀렉박스 옵션이 '진행예정'일때
			else if(option.equals("comingSoon")) {
				model.addAttribute("list", service.getComingSoonEventList());
			}
			//셀렉박스 옵션이 '진행종료'일때
			else if(option.equals("end")) {
				model.addAttribute("list", service.getEndEventList());
			}
		}
		
		
		model.addAttribute("option", option);
		
		return "admin/event/eventList";
	}
	
	
	
	@GetMapping("/category/categoryList")
	public String categoryList(@RequestParam(value="p", required=false) Integer p, @RequestParam(value="type", required=false) String type, @RequestParam(value="key", required=false) String key, Model model) throws Exception {
		
		log.info("categoryList()");
		
		Map<String, Object> map = PagingUtil.getPaging(p, type, key, 15, 5, "categoryList");
		
		model.addAttribute("list", map.get("classCategoryList"));
		model.addAttribute("startNum", map.get("startNum"));
		model.addAttribute("endNum", map.get("endNum"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("p", map.get("p"));
		model.addAttribute("type", map.get("type"));
		model.addAttribute("key", map.get("key"));
		model.addAttribute("isSearch", map.get("isSearch"));
		
		return "admin/category/categoryList";
	}
	
	@GetMapping("/category/addCategory")
	public String categoryAddForm(Model model) throws Exception {
		
		log.info("categoryAddForm()");
		
		model.addAttribute("categoryBigList", service.getcategoryBigList());
		model.addAttribute("categorySmallList", service.getcategorySmallList());
		
		
		return "admin/category/addCategory";
	}
	
	
	@PostMapping("/category/addCategory")
	@ResponseBody
	public String addCategory(String categoryBig, @RequestParam String categorySmall) throws Exception {
		
		log.info("addCategory()");
		
		boolean isExisting = service.checkCategory(categoryBig, categorySmall);
		
		if(isExisting) {
			
			return "fail";
		}
		else {
			
			service.addCategory(categoryBig, categorySmall);
			
			return "success";
		}
	}
	
	@GetMapping("/category/edit")
	public String getEditCategory(@RequestParam(value="categoryNo", required=true) int categoryNo, Model model) throws Exception {
		
		log.info("getEditCategory()");
		
		model.addAttribute(service.getCategoryDetail(categoryNo));
		
		return "admin/category/edit";
	}
	
	@PostMapping("/category/edit")
	public String postEditCategory(@ModelAttribute ClassCategory classCategory) throws Exception {
		
		log.info("postEditCategory()");
		
		service.editCategory(classCategory);
		
		return "redirect:categoryList";
	}
	
	@GetMapping("/category/delete")
	@ResponseBody
	public int deleteCategory(@RequestParam(value="categoryNo", required=true) int categoryNo) throws Exception {
		
		log.info("deleteCategory()");
		
		service.deleteCategory(categoryNo);
		
		return categoryNo;
	}
	
}