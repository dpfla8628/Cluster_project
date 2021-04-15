package com.kh.cluster.entity;

public class AdminClassorderVO {
	
	//리스트로 일매출+월매출 찍어내는용
	private String orderdate;
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
	
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
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
