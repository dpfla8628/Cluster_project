package com.kh.cluster.entity;

//회원가입 시 닉네임, 아이디 중복 체크를 위한 클래스
public class AuthMemberCheckVO {
	private String check;
	private String value;
	
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}
