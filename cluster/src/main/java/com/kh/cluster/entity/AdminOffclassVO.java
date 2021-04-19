package com.kh.cluster.entity;

import java.sql.Date;

public class AdminOffclassVO {
	private static final long serialVersionUID = 1L;
	
	private int classNo;
	private String className;
	private String classInfo;
	private int classPrice;
	private String classCheck;
	private String classEndCheck;
	private Date classStart;
	private Date classEnd;
	private Date classRegdate;
	private String classPlace;
	private int classMemberSet;
	private String classTalk;
	private String[] files;
	private int categoryNo;
	private int creatorNo;
	private String memberId;
	private String memberNick;
	private int count;
	
	
	public AdminOffclassVO() {
		super();
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getClassInfo() {
		return classInfo;
	}
	public void setClassInfo(String classInfo) {
		this.classInfo = classInfo;
	}
	public int getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(int classPrice) {
		this.classPrice = classPrice;
	}
	public String getClassCheck() {
		return classCheck;
	}
	public void setClassCheck(String classCheck) {
		this.classCheck = classCheck;
	}
	public String getClassEndCheck() {
		return classEndCheck;
	}
	public void setClassEndCheck(String classEndCheck) {
		this.classEndCheck = classEndCheck;
	}
	public Date getClassStart() {
		return classStart;
	}
	public void setClassStart(Date classStart) {
		this.classStart = classStart;
	}
	public Date getClassEnd() {
		return classEnd;
	}
	public void setClassEnd(Date classEnd) {
		this.classEnd = classEnd;
	}
	public Date getClassRegdate() {
		return classRegdate;
	}
	public void setClassRegdate(Date classRegdate) {
		this.classRegdate = classRegdate;
	}
	public String getClassPlace() {
		return classPlace;
	}
	public void setClassPlace(String classPlace) {
		this.classPlace = classPlace;
	}
	public int getClassMemberSet() {
		return classMemberSet;
	}
	public void setClassMemberSet(int classMemberSet) {
		this.classMemberSet = classMemberSet;
	}
	public String getClassTalk() {
		return classTalk;
	}
	public void setClassTalk(String classTalk) {
		this.classTalk = classTalk;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public int getCreatorNo() {
		return creatorNo;
	}
	public void setCreatorNo(int creatorNo) {
		this.creatorNo = creatorNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
