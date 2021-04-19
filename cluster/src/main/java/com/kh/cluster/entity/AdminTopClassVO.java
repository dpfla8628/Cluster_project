package com.kh.cluster.entity;

public class AdminTopClassVO {

	private String creator;
	private String className;
	private long count;
	private int rank;
	
	public AdminTopClassVO() {
		super();
	}
	
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
	
	
}
