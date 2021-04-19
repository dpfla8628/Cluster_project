package com.kh.cluster.entity;

public class ClassQuestion {
	private int classqNo;
	private int classNo;
	private int memberNo;
	private String classQ;
	private String classA;
	
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
	@Override
	public String toString() {
		return "ClassQuestion [classqNo=" + classqNo + ", classNo=" + classNo + ", memberNo=" + memberNo + ", classQ="
				+ classQ + ", classA=" + classA + "]";
	}
	
	
}
