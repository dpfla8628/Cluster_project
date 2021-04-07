package com.example.demo.entity;

import java.sql.Date;

public class MyCoupon {
	private int memberNo;
	private int couponNo;
	private int eventNo;
	private Date couponEnd;
	private String couponName;
	private String eventTitle;
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public Date getCouponEnd() {
		return couponEnd;
	}
	public void setCouponEnd(Date couponEnd) {
		this.couponEnd = couponEnd;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	
	
	
	
}
