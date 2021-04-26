package com.kh.cluster.repository;

import java.util.HashMap;
import java.util.List;

import com.kh.cluster.entity.CouponVO;
import com.kh.cluster.entity.EventInfoforList;
import com.kh.cluster.entity.EventVO;
import com.kh.cluster.entity.MemberCoupon;

public interface EventRepository {
	public Integer getEventNo();
	public void insertEvent(EventVO event);
	public void foreachCoupons(List<CouponVO> coupons);
	public List<EventVO> selectOngoingEventList(EventInfoforList eventInfo);
	public List<EventVO> selectFinishedEventList(EventInfoforList eventInfo);
	public EventVO selectEvent(Integer eventNo);
	public List<CouponVO> selectCoupons(Integer eventNo);
	public void insertMemberCoupon(HashMap<String, Integer> number);
	public MemberCoupon selectMemberCoupon(HashMap<String, Integer> number);
}
