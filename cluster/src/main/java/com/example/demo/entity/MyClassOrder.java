package com.example.demo.entity;

import java.sql.Date;

public class MyClassOrder {
	private int orderNo;
	private int classNo;
	private int memberNo;
	private String className;
	private String orderName;
	private int orderPrice;
	private Date orderDate;
	private String orderOk;
	private String classImage;
	private Date classEnd;
	private String classTalk;
	private String reviewContext;
	
	
	
	public String getReviewContext() {
		return reviewContext;
	}
	public void setReviewContext(String reviewContext) {
		this.reviewContext = reviewContext;
	}
	public String getClassImage() {
		return classImage;
	}
	public void setClassImage(String classImage) {
		this.classImage = classImage;
	}
	public Date getClassEnd() {
		return classEnd;
	}
	public void setClassEnd(Date classEnd) {
		this.classEnd = classEnd;
	}
	public String getClassTalk() {
		return classTalk;
	}
	public void setClassTalk(String classTalk) {
		this.classTalk = classTalk;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderOk() {
		return orderOk;
	}
	public void setOrderOk(String orderOk) {
		this.orderOk = orderOk;
	}
	
	
}
