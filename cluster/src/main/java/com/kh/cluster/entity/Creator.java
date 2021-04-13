package com.kh.cluster.entity;

public class Creator {

	private int creatorNo;
	private String creatorAccount;
	private String creatorInfo;
	private int memberNo;
	
	public int getCreatorNo() {
		return creatorNo;
	}
	public void setCreatorNo(int creatorNo) {
		this.creatorNo = creatorNo;
	}
	public String getCreatorAccount() {
		return creatorAccount;
	}
	public void setCreatorAccount(String creatorAccount) {
		this.creatorAccount = creatorAccount;
	}
	public String getCreatorInfo() {
		return creatorInfo;
	}
	public void setCreatorInfo(String creatorInfo) {
		this.creatorInfo = creatorInfo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "Creator [creatorNo=" + creatorNo + ", creatorAccount=" + creatorAccount + ", creatorInfo=" + creatorInfo
				+ ", memberNo=" + memberNo + "]";
	}
	
	
	
}
