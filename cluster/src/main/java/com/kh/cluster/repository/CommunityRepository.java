package com.kh.cluster.repository;

import java.util.List;

import com.kh.cluster.entity.Question;

public interface CommunityRepository {

	public int qInsert(Question question) throws Exception;
	
	public int qEdit(Question question) throws Exception;
	
	public int aInsert(Question question) throws Exception;
	
	public List<Question> questionList(int memberNo) throws Exception;
	
	public Question read(int questionNo) throws Exception;
	
	public int deleteQuestion(int quesitionNo) throws Exception;
	
	public int deleteA(int questionNo) throws Exception;
}
