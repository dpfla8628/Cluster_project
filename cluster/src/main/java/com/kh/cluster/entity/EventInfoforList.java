package com.kh.cluster.entity;

//이벤트 목록 조회를 위한 클래스
public class EventInfoforList {
	private String type; //이벤트 필터
	private Integer start; //시작 행
	private Integer end; //종료 행
	private String sysdate; //현재 날짜
	
	
	public EventInfoforList(String type, Integer start, Integer end, String sysdate) {
		super();
		this.type = type;
		this.start = start;
		this.end = end;
		this.sysdate = sysdate;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getEnd() {
		return end;
	}
	public void setEnd(Integer end) {
		this.end = end;
	}
	public String getSysdate() {
		return sysdate;
	}
	public void setSysdate(String sysdate) {
		this.sysdate = sysdate;
	}
	
}
