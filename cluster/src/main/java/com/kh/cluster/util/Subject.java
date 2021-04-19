package com.kh.cluster.util;

//메일 유형 클래스
public enum Subject {
	SIGNUP("회원가입을 완료해주세요!"), PASSWORD("비밀번호를 변경해주세요!");
	
	private String subject;
	
	Subject(String s){
		subject = s;
	}
	
	public String getSubject() {
		return subject;
	}
}
