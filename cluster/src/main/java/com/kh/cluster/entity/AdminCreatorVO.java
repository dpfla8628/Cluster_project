package com.kh.cluster.entity;

import java.sql.Date;

public class AdminCreatorVO {
	private int creatorNo;
	private String creatorNick;
	private int countIng;
	private int countComingSoon;
	private int countEnd;
	
	//크리에이터 정산시 필요
	private String className;
	private Date orderDate;
	private long classSales;
	private long creatorIncome;
	private String orderCalc;
	
	
	
	public AdminCreatorVO() {
		super();
	}
	public int getCreatorNo() {
		return creatorNo;
	}
	public void setCreatorNo(int creatorNo) {
		this.creatorNo = creatorNo;
	}
	public String getCreatorNick() {
		return creatorNick;
	}
	public void setCreatorNick(String creatorNick) {
		this.creatorNick = creatorNick;
	}
	public int getCountIng() {
		return countIng;
	}
	public void setCountIng(int countIng) {
		this.countIng = countIng;
	}
	public int getCountComingSoon() {
		return countComingSoon;
	}
	public void setCountComingSoon(int countComingSoon) {
		this.countComingSoon = countComingSoon;
	}
	public int getCountEnd() {
		return countEnd;
	}
	public void setCountEnd(int countEnd) {
		this.countEnd = countEnd;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public long getClassSales() {
		return classSales;
	}
	public void setClassSales(long classSales) {
		this.classSales = classSales;
	}
	public long getCreatorIncome() {
		return creatorIncome;
	}
	public void setCreatorIncome(long creatorIncome) {
		this.creatorIncome = creatorIncome;
	}
	public String getOrderCalc() {
		return orderCalc;
	}
	public void setOrderCalc(String orderCalc) {
		this.orderCalc = orderCalc;
	}
	
	
	
	
	
}
