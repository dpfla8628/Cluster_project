package com.kh.cluster.entity;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class CouponVO {
	private Integer couponNo;
	private String couponName;
	private Date couponStart;
	private Date couponEnd;
	private Integer couponDiscount;
	private MultipartFile couponFile;
	private String couponFileName;
	private Integer eventNo;
	
	@Override
	public String toString() {
		return "CouponVO [couponNo=" + couponNo + ", couponName=" + couponName + ", couponStart=" + couponStart
				+ ", couponEnd=" + couponEnd + ", couponDiscount=" + couponDiscount + ", couponFile=" + couponFile
				+ ", eventNo=" + eventNo + "]";
	}
	public String getCouponFileName() {
		return couponFileName;
	}
	public void setCouponFileName(String couponFileName) {
		this.couponFileName = couponFileName;
	}
	public Integer getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(Integer couponNo) {
		this.couponNo = couponNo;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public Date getCouponStart() {
		return couponStart;
	}
	public void setCouponStart(Date couponStart) {
		this.couponStart = couponStart;
	}
	public Date getCouponEnd() {
		return couponEnd;
	}
	public void setCouponEnd(Date couponEnd) {
		this.couponEnd = couponEnd;
	}
	public Integer getCouponDiscount() {
		return couponDiscount;
	}
	public void setCouponDiscount(Integer couponDiscount) {
		this.couponDiscount = couponDiscount;
	}
	public MultipartFile getCouponFile() {
		return couponFile;
	}
	public void setCouponFile(MultipartFile couponFile) {
		this.couponFile = couponFile;
	}
	public Integer getEventNO() {
		return eventNo;
	}
	public void setEventNO(Integer eventNo) {
		this.eventNo = eventNo;
	}
	
	
	
}
