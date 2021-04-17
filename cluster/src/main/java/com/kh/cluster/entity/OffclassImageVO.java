package com.kh.cluster.entity;

import java.util.Date;

public class OffclassImageVO {
	
	private String fullName;
	private Date regDate;
	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "OffclassImageVO [fullName=" + fullName + ", regDate=" + regDate + "]";
	}
		
}