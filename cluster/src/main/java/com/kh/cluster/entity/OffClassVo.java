package com.kh.cluster.entity;

import java.sql.Date;
import java.util.Arrays;

 
public class OffClassVo {
	
	private Integer classNo;
	private String className;
	private String classInfo;
	private Integer classPrice;
	private String classCheck;
	private String classEndCheck;
	private Date classStart;
	private Date classEnd;
	private Date classRegDate;
	private String classPlace;
	private Integer classMemberSet;
	private String classTalk;
	private Integer catogoryNo;
	private Integer creatorNo;
	private String[] files;
	private Integer memberNo; 
	private String fullName;
  
	private Creator creator;
	private Review review;
	private Member member;
	private ClassCategory classCategory;
	
	public Integer getClassNo() {
		return classNo;
	}
	public void setClassNo(Integer classNo) {
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
	public Integer getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(Integer classPrice) {
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
	public Date getClassRegDate() {
		return classRegDate;
	}
	public void setClassRegDate(Date classRegDate) {
		this.classRegDate = classRegDate;
	}
	public String getClassPlace() {
		return classPlace;
	}
	public void setClassPlace(String classPlace) {
		this.classPlace = classPlace;
	}
	public Integer getClassMemberSet() {
		return classMemberSet;
	}
	public void setClassMemberSet(Integer classMemberSet) {
		this.classMemberSet = classMemberSet;
	}
	public String getClassTalk() {
		return classTalk;
	}
	public void setClassTalk(String classTalk) {
		this.classTalk = classTalk;
	}
	public Integer getCatogoryNo() {
		return catogoryNo;
	}
	public void setCatogoryNo(Integer catogoryNo) {
		this.catogoryNo = catogoryNo;
	}
	public Integer getCreatorNo() {
		return creatorNo;
	}
	public void setCreatorNo(Integer creatorNo) {
		this.creatorNo = creatorNo;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Creator getCreator() {
		return creator;
	}
	public void setCreator(Creator creator) {
		this.creator = creator;
	}
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public ClassCategory getClassCategory() {
		return classCategory;
	}
	public void setClassCategory(ClassCategory classCategory) {
		this.classCategory = classCategory;
	}
	@Override
	public String toString() {
		return "OffClassVo [classNo=" + classNo + ", className=" + className + ", classInfo=" + classInfo
				+ ", classPrice=" + classPrice + ", classCheck=" + classCheck + ", classEndCheck=" + classEndCheck
				+ ", classStart=" + classStart + ", classEnd=" + classEnd + ", classRegDate=" + classRegDate
				+ ", classPlace=" + classPlace + ", classMemberSet=" + classMemberSet + ", classTalk=" + classTalk
				+ ", catogoryNo=" + catogoryNo + ", creatorNo=" + creatorNo + ", files=" + Arrays.toString(files)
				+ ", memberNo=" + memberNo + ", fullName=" + fullName + ", creator=" + creator + ", review=" + review
				+ ", member=" + member + ", classCategory=" + classCategory + "]";
	}
	
	
	 
	 
	 
}
