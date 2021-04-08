package com.kh.cluster.entity;

import java.util.Date;

public class AuthMember {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberNick;
	private String memberPhone;
	private Date memberDate;
	private String memberAuth;
	private String memberAccessToken;
	private String memberRefreshToken;
	private String fullName;
	private String[] files;
	


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
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public Date getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(Date memberDate) {
		this.memberDate = memberDate;
	}
	public String getMemberAuth() {
		return memberAuth;
	}
	public void setMemberAuth(String memberAuth) {
		this.memberAuth = memberAuth;
	}
	public String getMemberAccessToken() {
		return memberAccessToken;
	}
	public void setMemberAccessToken(String memberAccessToken) {
		this.memberAccessToken = memberAccessToken;
	}
	public String getMemberRefreshToken() {
		return memberRefreshToken;
	}
	public void setMemberRefreshToken(String memberRefreshToken) {
		this.memberRefreshToken = memberRefreshToken;
	}
}
