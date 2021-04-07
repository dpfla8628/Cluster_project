package com.kh.cluster.entity;

public class ClassCategory {

	private int categoryNo;
	private String categoryBig;
	private String categorySmall;
	
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
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
	@Override
	public String toString() {
		return "ClassCategory [categoryNo=" + categoryNo + ", categoryBig=" + categoryBig + ", categorySmall="
				+ categorySmall + "]";
	}
	
	
	
}
