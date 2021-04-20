package com.kh.cluster.entity;

import java.sql.Date;
	
public class AdminClassorderVO {
	private int orderNo;
	private int classNo;
	private int memberNo;
	private String orderName;
	private int orderPrice;
	private Date orderDate;
	private String orderOk;
	
	//클래스 이름
	private String className;
	
	//리스트로 일매출+월매출 찍어내는용
	private String salesdate;
	private long daysales;
	private long monthsales;
	
	//리스트 상단 연매출용
	private String year;
	private long yearsales;
	
	//리스트 상단 월매출용
	private String yearMonth;
	private long salesForMonth; //위에 monthsales랑 다른거임
	
	
	public AdminClassorderVO() {
		super();
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


	public String getClassName() {
		return className;
	}


	public void setClassName(String className) {
		this.className = className;
	}


	public String getSalesdate() {
		return salesdate;
	}


	public void setSalesdate(String salesdate) {
		this.salesdate = salesdate;
	}


	public long getDaysales() {
		return daysales;
	}


	public void setDaysales(long daysales) {
		this.daysales = daysales;
	}


	public long getMonthsales() {
		return monthsales;
	}


	public void setMonthsales(long monthsales) {
		this.monthsales = monthsales;
	}


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = year;
	}


	public long getYearsales() {
		return yearsales;
	}


	public void setYearsales(long yearsales) {
		this.yearsales = yearsales;
	}


	public String getYearMonth() {
		return yearMonth;
	}


	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}


	public long getSalesForMonth() {
		return salesForMonth;
	}


	public void setSalesForMonth(long salesForMonth) {
		this.salesForMonth = salesForMonth;
	}

	
	
	
	
	
}
