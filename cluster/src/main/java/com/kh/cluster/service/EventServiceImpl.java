package com.kh.cluster.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cluster.controller.EventController;
import com.kh.cluster.entity.CouponVO;
import com.kh.cluster.entity.EventInfoforList;
import com.kh.cluster.entity.EventVO;
import com.kh.cluster.entity.MemberCoupon;
import com.kh.cluster.entity.MultiCouponVO;
import com.kh.cluster.repository.EventRepository;

@Service
public class EventServiceImpl implements EventService {
	private static final Logger log = LoggerFactory.getLogger(EventServiceImpl.class);
	
	@Autowired
	EventRepository eventRepo;
	
	//이벤트 등록
	@Override
	public void registerEvent(EventVO event, MultiCouponVO coupons) {
		log.info("registerEvent()");
		
		//eventNo 생성하기
		Integer eventNo = eventRepo.getEventNo();
		event.setEventNo(eventNo);
		
		//생성한 no로 event 등록하기
		eventRepo.insertEvent(event);
		
		//eventNo를 외래키로 coupon등록하기
		for(CouponVO coupon : coupons.getCoupons()) {
			coupon.setEventNO(eventNo);
		}
		eventRepo.foreachCoupons(coupons.getCoupons());
	}
	
	//이벤트 리스트 조회
	@Override
	public List<EventVO> eventList(EventInfoforList eventInfo) {
		log.info("eventList()");
		
		//오늘날짜 구하기
		Date date = new Date();
		SimpleDateFormat f = new SimpleDateFormat("yyyyMMdd");
		String sysdate = f.format(date);
		eventInfo.setSysdate(sysdate);
		
		//이벤트 리스트 조회
		List<EventVO> eventList = null;
		if("ongoing".equals(eventInfo.getType())) {
			eventList = eventRepo.selectOngoingEventList(eventInfo);
		}
		else if("finished".equals(eventInfo.getType())) {
			eventList = eventRepo.selectFinishedEventList(eventInfo);
		}
		
		return eventList;
	}
	
	//이벤트 상세조회
	@Override
	public Map<String, Object> eventDetail(Integer eventNo) {
		log.info("eventDetail()");
		
		Map<String, Object> result = new HashMap<>();

		EventVO event = eventRepo.selectEvent(eventNo);
		List<CouponVO> coupons = eventRepo.selectCoupons(eventNo);
		
		if(event!=null) {
			result.put("event", event);
		}
		if(coupons != null) {
			result.put("coupons", coupons);
		}
		
		if(!result.isEmpty()) return result;
		
		return null;
	}
	
	//쿠폰 다운로드
	@Override
	public void couponDownload(Integer couponNo, Integer memberNo) {
		log.info("couponDownload()");
		
		HashMap<String, Integer> num = new HashMap<>();
		num.put("memberNo", memberNo);
		num.put("couponNo", couponNo);
		
		//멤버쿠폰 등록
		eventRepo.insertMemberCoupon(num);
	}
	
	//쿠폰 유무 확인
	@Override
	public boolean checkCoupon(Integer couponNo, Integer memberNo) {
		log.info("checkCoupon()");
		
		HashMap<String, Integer> num = new HashMap<>();
		num.put("memberNo", memberNo);
		num.put("couponNo", couponNo);
		
		MemberCoupon memberCoupon = eventRepo.selectMemberCoupon(num);
		
		//쿠폰이 없다면 true반환
		return memberCoupon == null;
	}
	
	//이벤트 수정
	@Override
	public void modifyEvent(EventVO event, MultiCouponVO coupons) {
		log.info("modifyEvent()");
		
		//이벤트 수정
		eventRepo.updateEvent(event);
		
		//쿠폰 전체 삭제
		eventRepo.deleteCoupons(event.getEventNo());
		
		//쿠폰 저장
		for(CouponVO coupon : coupons.getCoupons()) {
			coupon.setEventNO(event.getEventNo());
		}
		eventRepo.foreachCoupons(coupons.getCoupons());
		
	}
	
	//이벤트 삭제
	@Override
	public void deleteEvent(Integer eventNo) {
		
		//이벤트 삭제
		eventRepo.deleteEvent(eventNo);
		
		//쿠폰 삭제
		eventRepo.deleteCoupons(eventNo);
		
	}
}
