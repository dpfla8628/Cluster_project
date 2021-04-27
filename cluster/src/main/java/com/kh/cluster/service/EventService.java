package com.kh.cluster.service;

import java.util.List;
import java.util.Map;

import com.kh.cluster.entity.EventInfoforList;
import com.kh.cluster.entity.EventVO;
import com.kh.cluster.entity.MultiCouponVO;

public interface EventService {
	public void registerEvent(EventVO event, MultiCouponVO coupons);
	public List<EventVO> eventList(EventInfoforList eventInfo);
	public Map<String, Object> eventDetail(Integer eventNo);
	public void couponDownload(Integer couponNo, Integer memberNo);
	public boolean checkCoupon(Integer couponNo, Integer memberNo);
	public void modifyEvent(EventVO event, MultiCouponVO coupons);
	public void deleteEvent(Integer eventNo);
}
