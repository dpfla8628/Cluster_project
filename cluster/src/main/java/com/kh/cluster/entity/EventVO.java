package com.kh.cluster.entity;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class EventVO {
	private Integer eventNo;
	private String eventTitle;
	private String eventContent;
	private Date eventStart;
	private Date eventEnd;
	private MultipartFile eventFile;
	private String eventFileName;
	
	
	@Override
	public String toString() {
		return "EventVO [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", eventContent=" + eventContent
				+ ", eventStart=" + eventStart + ", eventEnd=" + eventEnd + ", eventFile=" + eventFile + "]";
	}
	public String getEventFileName() {
		return eventFileName;
	}
	public void setEventFileName(String eventFileName) {
		this.eventFileName = eventFileName;
	}
	public Integer getEventNo() {
		return eventNo;
	}
	public void setEventNo(Integer eventNo) {
		this.eventNo = eventNo;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public Date getEventStart() {
		return eventStart;
	}
	public void setEventStart(Date eventStart) {
		this.eventStart = eventStart;
	}
	public Date getEventEnd() {
		return eventEnd;
	}
	public void setEventEnd(Date eventEnd) {
		this.eventEnd = eventEnd;
	}
	public MultipartFile getEventFile() {
		return eventFile;
	}
	public void setEventFile(MultipartFile eventFile) {
		this.eventFile = eventFile;
	}
	
	
	
}
