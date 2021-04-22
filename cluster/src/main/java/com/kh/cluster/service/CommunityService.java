package com.kh.cluster.service;

import java.util.List;

import com.kh.cluster.entity.Question;

public interface CommunityService{

	public int qInsert(Question question) throws Exception;
	
	public int qEdit(Question question) throws Exception;
	
	public int aInsert(Question question) throws Exception;
	
	public List<Question> questionList(int memberNo) throws Exception;
	
	public Question read(int questionNo) throws Exception;
	
	public int deleteQuestion(int questionNo) throws Exception;
	
	public int deleteA(int questionNo) throws Exception;
}
