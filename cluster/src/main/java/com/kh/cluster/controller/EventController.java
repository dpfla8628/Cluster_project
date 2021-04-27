package com.kh.cluster.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cluster.entity.AuthMemberVO;
import com.kh.cluster.entity.CouponVO;
import com.kh.cluster.entity.EventInfoforList;
import com.kh.cluster.entity.EventVO;
import com.kh.cluster.entity.MultiCouponVO;
import com.kh.cluster.service.EventService;
import com.kh.cluster.util.MediaUtils;
import com.kh.cluster.util.UploadFileUtils;

@Controller
@RequestMapping("/event")
public class EventController {
	private static final Logger log = LoggerFactory.getLogger(EventController.class);
	
	@Value("${upload.path}")
	String uploadPath;
	@Autowired
	EventService service;
	
	//이벤트 목록
	@GetMapping("/")
	public String getList(Model model) {
		log.info("getList()");
		
		//이벤트 목록 불러오기
		List<EventVO> evnetList = service.eventList(new EventInfoforList("ongoing", 1, 12, null));
		model.addAttribute("event", evnetList);
		
		return "/event/list";
	}
	
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		log.info("displayFile()");
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
	
	//이벤트 목록 조회 ajax
	@PostMapping("/getList")
	@ResponseBody
	public ResponseEntity<List<EventVO>> postGetList(EventInfoforList eventInfo){
		log.info("postGetList()");
		
		//이벤트 목록 불러오기
		List<EventVO> events = service.eventList(eventInfo);
		
		return new ResponseEntity<List<EventVO>>(events, HttpStatus.OK);
	}
	
	//이벤트 상세보기
	@GetMapping("/detail")
	public void getDetail(@RequestParam("no") Integer eventNo, Model model) {
		log.info("getDetail()");
		
		//이벤트와 쿠폰 조회
		Map<String , Object> detail = service.eventDetail(eventNo);

		if(detail != null) {
			EventVO event = (EventVO)detail.get("event");
			@SuppressWarnings("unchecked")
			List<CouponVO> coupons = (List<CouponVO>)detail.get("coupons");
			
			model.addAttribute("event", event);
			model.addAttribute("coupons", coupons);
		}
		
	}
	
	//이벤트 작성
	@GetMapping("/write")
	public void getWrite() {
		log.info("getWrite()");
	}
	
	@PostMapping("/write")
	public String postWrite(EventVO event, MultiCouponVO coupons) throws Exception {
		log.info("postWrite()");
		/*
		 * System.out.println("event_getOriginalFilename():"+event.getEventFile().
		 * getOriginalFilename());
		 * System.out.println("event_getName() : "+event.getEventFile().getName());
		 * List<CouponVO> couponVO = coupons.getCoupons(); int i = 0; for(CouponVO
		 * coupon : couponVO) {
		 * System.out.println("coupon["+i+"]_getOriginalFilename():"+
		 * coupon.getCouponFile().getOriginalFilename());
		 * System.out.println("coupon["+i+"]_getName() : "+coupon.getCouponFile().
		 * getName()); i++; } System.out.println("event:"+ event);
		 * System.out.println("coupons: "+ coupons);
		 */
		
		//upload처리 - UploadFileUtils 사용 + 파일이름 저장
		if(event.getEventFile() != null) {
			String eventFilename = UploadFileUtils.uploadFile(uploadPath, event.getEventFile().getOriginalFilename(), event.getEventFile().getBytes());
			event.setEventFileName(eventFilename);
			System.out.println("eventFilename: "+eventFilename);
		}
		for(CouponVO coupon : coupons.getCoupons()) {
			if(coupon.getCouponFile() != null) {
				String couponFilename = UploadFileUtils.uploadFile(uploadPath, coupon.getCouponFile().getOriginalFilename(), coupon.getCouponFile().getBytes());
				coupon.setCouponFileName(couponFilename);
				System.out.println("couponFilename: "+ couponFilename);
			}
		}
		
		//db처리 - 이벤트 저장, 쿠폰 저장
		service.registerEvent(event, coupons);
		
		/* file.transferTo(new File("C://upload2", "upload.jpg")); */
		
		return "redirect:/event/";
	}
	
	//이벤트 수정
	@GetMapping("/modify")
	public void getUpdate(@RequestParam("no") Integer eventNo, Model model) {
		log.info("getUpdate()");
		
		//이벤트와 쿠폰 정보 조회
		Map<String , Object> detail = service.eventDetail(eventNo);

		if(detail != null) {
			EventVO event = (EventVO)detail.get("event");
			@SuppressWarnings("unchecked")
			List<CouponVO> coupons = (List<CouponVO>)detail.get("coupons");
			
			model.addAttribute("event", event);
			model.addAttribute("coupons", coupons);
		}
	}
	
	@PostMapping("/modify")
	public String postModify(EventVO event, MultiCouponVO coupons) throws IOException, Exception {
		log.info("postModify()");
		System.out.println("event:"+event.getEventFile().getOriginalFilename());
		System.out.println("coupon:"+coupons.getCoupons().get(0).getCouponFile().getOriginalFilename());
		
		//파일 정보가 넘어온 경우 업로드 처리
		if(!event.getEventFile().isEmpty()) {
			String eventFilename = UploadFileUtils.uploadFile(uploadPath, event.getEventFile().getOriginalFilename(), event.getEventFile().getBytes());
			event.setEventFileName(eventFilename);
			System.out.println("eventFilename: "+eventFilename);
		}
		for(CouponVO coupon : coupons.getCoupons()) {
			if(!coupon.getCouponFile().isEmpty()) {
				String couponFilename = UploadFileUtils.uploadFile(uploadPath, coupon.getCouponFile().getOriginalFilename(), coupon.getCouponFile().getBytes());
				coupon.setCouponFileName(couponFilename);
				System.out.println("couponFilename: "+ couponFilename);
			}
		}
		
		//이벤트, 쿠폰 정보 수정
		service.modifyEvent(event, coupons);
		
		return "redirect:/admin/event/eventList";
	}
	
	//이벤트 삭제
	@GetMapping("/delete")
	public String getDelte(@RequestParam("no")Integer eventNo) {
		
		//이벤트 삭제
		service.deleteEvent(eventNo);
		
		return "redirect:/admin/event/eventList";
	}
	
	//쿠폰 다운로드
	@PostMapping("/coupon")
	@ResponseBody
	public ResponseEntity<String> getCoupon(Integer couponNo, HttpServletRequest req) {
		log.info("getCoupon()");
		
		AuthMemberVO member = (AuthMemberVO)req.getAttribute("member");
		
		//회원인경우 쿠폰 다운로드
		if(member != null && couponNo != null) {
			//쿠폰이 없다면
			if(service.checkCoupon(couponNo, member.getMemberNo())) {
				service.couponDownload(couponNo, member.getMemberNo());
			
				return new ResponseEntity<String>("쿠폰이 발급되었습니다.", HttpStatus.CREATED);
			}
			
			return new ResponseEntity<String>(HttpStatus.FORBIDDEN);
		}
		
		return new ResponseEntity<String>(HttpStatus.UNAUTHORIZED);
	}
}
