package com.kh.cluster.entity;

import java.sql.Date;

public class MyReview {
	private int reviewNo;
	private int memberNo;
	private int classNo;
	private String reviewContext;
	private Date reviewDate;
	private String reviewOk;
	private String className;
	
	
	
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public String getReviewContext() {
		return reviewContext;
	}
	public void setReviewContext(String reviewContext) {
		this.reviewContext = reviewContext;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewOk() {
		return reviewOk;
	}
	public void setReviewOk(String reviewOk) {
		this.reviewOk = reviewOk;
	}
	
	

}
