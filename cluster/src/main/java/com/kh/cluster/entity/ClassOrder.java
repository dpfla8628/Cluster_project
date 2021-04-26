package com.kh.cluster.entity;

import java.sql.Date;

public class ClassOrder {

	private int orderNo;
	private int classNo;
	private int memberNo;
	private String orderName;
	private int orderPrice;
	private Date orderDate;
	private String orderOk;
	private String orderCalc;
	
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
	public String getOrderCalc() {
		return orderCalc;
	}
	public void setOrderCalc(String orderCalc) {
		this.orderCalc = orderCalc;
	}
	
	
	
}
