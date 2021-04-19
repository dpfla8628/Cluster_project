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
	private String memberToken;
	private String fullName;
	private String[] files;
	private String memberAgreement1;
	private String memberAgreement2;
	private Integer memberAuthNum;
	private String memberStatus;
	private String memberBy;
	

	public String getMemberBy() {
		return memberBy;
	}

	public void setMemberBy(String memberBy) {
		this.memberBy = memberBy;
	}

	public String getMemberToken() {
		return memberToken;
	}

	public void setMemberToken(String memberToken) {
		this.memberToken = memberToken;
	}

	public Integer getMemberAuthNum() {
		return memberAuthNum;
	}

	public void setMemberAuthNum(Integer memberAuthNum) {
		this.memberAuthNum = memberAuthNum;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMemberAgreement1() {
		return memberAgreement1;
	}

	public void setMemberAgreement1(String memberAgreement1) {
		this.memberAgreement1 = memberAgreement1;
	}

	public String getMemberAgreement2() {
		return memberAgreement2;
	}

	public void setMemberAgreement2(String memberAgreement2) {
		this.memberAgreement2 = memberAgreement2;
	}

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
	
}
