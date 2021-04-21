package com.kh.cluster.entity;

public class OffclassQnAVO {

	private int classqNo;
	private int classNo;
	private int memberNo;
	private String classQ;
	private String classA;
	private String className;
	private int creatorNo;
	private String memberNick;
	
	public int getClassqNo() {
		return classqNo;
	}
	public void setClassqNo(int classqNo) {
		this.classqNo = classqNo;
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
	public String getClassQ() {
		return classQ;
	}
	public void setClassQ(String classQ) {
		this.classQ = classQ;
	}
	public String getClassA() {
		return classA;
	}
	public void setClassA(String classA) {
		this.classA = classA;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getCreatorNo() {
		return creatorNo;
	}
	public void setCreatorNo(int creatorNo) {
		this.creatorNo = creatorNo;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	@Override
	public String toString() {
		return "OffclassQnAVO [classqNo=" + classqNo + ", classNo=" + classNo + ", memberNo=" + memberNo + ", classQ="
				+ classQ + ", classA=" + classA + ", className=" + className + ", creatorNo=" + creatorNo
				+ ", memberNick=" + memberNick + "]";
	}
	
	
	
}
