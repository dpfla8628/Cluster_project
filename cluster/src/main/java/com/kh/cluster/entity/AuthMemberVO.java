package com.kh.cluster.entity;

//인터셉터에서 컨트롤러로 넘겨주는 회원정보 클래스
public class AuthMemberVO {
	private Integer memberNo;
	private String memberId;
	private String memberAuth;
	private String memberNick;
 	private String memberPhone;
 	private String memberBy;
 	
	public AuthMemberVO(AuthMember member) {
		this.setMemberNo(member.getMemberNo());
		this.setMemberId(member.getMemberId());
		this.setMemberAuth(member.getMemberAuth());
		this.setMemberNick(member.getMemberNick());
 		this.setMemberPhone(member.getMemberPhone());
 		this.setMemberBy(member.getMemberBy());
 	}
	
	public String getMemberBy() {
		return memberBy;
	}

	public void setMemberBy(String memberBy) {
		this.memberBy = memberBy;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberAuth() {
		return memberAuth;
	}
	public void setMemberAuth(String memberAuth) {
		this.memberAuth = memberAuth;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	
}
