package com.kh.cluster.entity;

//회원가입 시 데이터 유효성 검사 위한 클래스
public class AuthMemberCheckVO {
	private String memberId;
	private String memberNick;
	private String memberPw;
	private String memberPwCheck;
	private String memberAgreement1;
	private String memberAgreement2;
	private Integer memberNo;
	
	public Integer getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "AuthMemberCheckVO [memberId=" + memberId + ", memberNick=" + memberNick + ", memberPw=" + memberPw
				+ ", memberPwCheck=" + memberPwCheck + ", memberAgreement1=" + memberAgreement1 + ", memberAgreement2="
				+ memberAgreement2 + "]";
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberPwCheck() {
		return memberPwCheck;
	}
	public void setMemberPwCheck(String memberPwCheck) {
		this.memberPwCheck = memberPwCheck;
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
	
	
}
