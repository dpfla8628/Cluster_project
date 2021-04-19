package com.kh.cluster.entity;

public class OffclassQueryVO {
	private int classNo;
	private int memberNo;
	private String memberNick;
	private String className;
	private int classPrice;
	private String categoryBig;
	private String categorySmall;
	private String thumbnailImage;
	private boolean isLiked;
	
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
	public String getThumbnailImage() {
		return thumbnailImage;
	}
	public void setThumbnailImage(String thumbnailImage) {
		this.thumbnailImage = thumbnailImage;
	}
	public boolean isLiked() {
		return isLiked;
	}
	public void setLiked(boolean isLiked) {
		this.isLiked = isLiked;
	}
	
	@Override
	public String toString() {
		return "OffclassQueryVO [classNo=" + classNo + ", memberNo=" + memberNo + ", memberNick=" + memberNick
				+ ", className=" + className + ", classPrice=" + classPrice + ", categoryBig=" + categoryBig
				+ ", categorySmall=" + categorySmall + ", thumbnailImage=" + thumbnailImage + ", isLiked=" + isLiked
				+ "]";
	}
}
