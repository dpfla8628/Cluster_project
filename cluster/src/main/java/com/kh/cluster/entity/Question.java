package com.kh.cluster.entity;

import java.sql.Date;

public class Question {

	private int questionNo;
	private int memberNo;
	private String questionTitle;
	private String questionQ;
	private String questionA;
	private Date questionDate;
	private String questionOk;
	private String memberNick;
	
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionQ() {
		return questionQ;
	}
	public void setQuestionQ(String questionQ) {
		this.questionQ = questionQ;
	}
	public String getQuestionA() {
		return questionA;
	}
	public void setQuestionA(String questionA) {
		this.questionA = questionA;
	}
	public Date getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}
	public String getQuestionOk() {
		return questionOk;
	}
	public void setQuestionOk(String questionOk) {
		this.questionOk = questionOk;
	}
	
	
}
