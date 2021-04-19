package com.kh.cluster.entity;

import java.sql.Date;
import java.util.Arrays;

 
public class Review {
	private Integer reviewNo;
	private Integer memberNo;
	private Integer classNo;
	private String reviewContext;
	private Date reviewDate;
	private String reviewOk;
	private String memberNick;
	private String fullName;
	private String[] files;
	public Integer getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(Integer reviewNo) {
		this.reviewNo = reviewNo;
	}
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	public Integer getClassNo() {
		return classNo;
	}
	public void setClassNo(Integer classNo) {
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
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", memberNo=" + memberNo + ", classNo=" + classNo + ", reviewContext="
				+ reviewContext + ", reviewDate=" + reviewDate + ", reviewOk=" + reviewOk + ", memberNick=" + memberNick
				+ ", fullName=" + fullName + ", files=" + Arrays.toString(files) + "]";
	}
	
	
 
	
	
	
}
