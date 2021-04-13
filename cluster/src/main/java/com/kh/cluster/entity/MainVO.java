package com.kh.cluster.entity;

import java.util.Arrays;

public class MainVO {
	private int classNo;
	private int memberNo;
	private String memberNick;
	private String className;
	private int classPrice;
	private String categoryBig;
	private String categorySmall;
	private String fullName;
	private String[] files;
	
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
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(int classPrice) {
		this.classPrice = classPrice;
	}
	public String getCategoryBig() {
		return categoryBig;
	}
	public void setCategoryBig(String categoryBig) {
		this.categoryBig = categoryBig;
	}
	public String getCategorySmall() {
		return categorySmall;
	}
	public void setCategorySmall(String categorySmall) {
		this.categorySmall = categorySmall;
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
		return "MainVO [classNo=" + classNo + ", memberNo=" + memberNo + ", memberNick=" + memberNick + ", className="
				+ className + ", classPrice=" + classPrice + ", categoryBig=" + categoryBig + ", categorySmall="
				+ categorySmall + ", fullName=" + fullName + ", files=" + Arrays.toString(files) + "]";
	}
}
