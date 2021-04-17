package com.kh.cluster.entity;

public class OffclassQueryVO {
	//offclass.class_no
	private int classNo;
	//member.member_no
	private int memberNo;
	//member.member_nick
	private String memberNick;
	//offclass.class_name
	private String className;
	//offclass.class_price
	private int classPrice;
	//classcategory.category_big
	private String categoryBig;
	//classcategory.category_small
	private String categorySmall;
	//class_image.fullname
	private String fullName;
	//classlike.classlike_no
	private int classlikeNo;
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
	public int getClasslikeNo() {
		return classlikeNo;
	}
	public void setClasslikeNo(int classlikeNo) {
		this.classlikeNo = classlikeNo;
	}
	@Override
	public String toString() {
		return "OffclassQueryVO [classNo=" + classNo + ", memberNo=" + memberNo + ", memberNick=" + memberNick
				+ ", className=" + className + ", classPrice=" + classPrice + ", categoryBig=" + categoryBig
				+ ", categorySmall=" + categorySmall + ", fullName=" + fullName + ", classlikeNo=" + classlikeNo + "]";
	}
	
}
