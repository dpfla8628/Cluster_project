package com.kh.cluster.service;

import java.util.List;

import com.kh.cluster.entity.Criteria;
import com.kh.cluster.entity.FAQ;
import com.kh.cluster.entity.Question;
import com.kh.cluster.util.PagingVO;
 import com.kh.cluster.util.PagingVo2;

public interface CommunityService{

	public int listCount() throws Exception;

	public Integer questionListCount(Integer memberNo) throws Exception;

	public int qInsert(Question question) throws Exception;
	
	public int qEdit(Question question) throws Exception;
	
	public int aInsert(Question question) throws Exception;
	
	public List<Question> questionList(PagingVo2 vo) throws Exception;
	
	public List<Question> adminQuestionList(PagingVo2 vo) throws Exception;

	public Question read(int questionNo) throws Exception;
	
	public int deleteQuestion(int questionNo) throws Exception;
	
	public int deleteA(int questionNo) throws Exception;
	//
	public int faqInsert(FAQ faq) throws Exception;
	public int faqEdit(FAQ faq) throws Exception;
	public int faqDelete(int faqNo) throws Exception;
	public FAQ faqRead(int faqNo) throws Exception;
	public List<FAQ> faqList(PagingVo2 vo) throws Exception;
	public int faqCount() throws Exception;
}
