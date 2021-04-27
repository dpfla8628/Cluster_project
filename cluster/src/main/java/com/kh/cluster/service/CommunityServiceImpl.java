package com.kh.cluster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cluster.entity.Criteria;
import com.kh.cluster.entity.FAQ;
import com.kh.cluster.entity.Question;
import com.kh.cluster.repository.CommunityRepository;
import com.kh.cluster.util.PagingVO;
 import com.kh.cluster.util.PagingVo2;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private CommunityRepository repository;
	
	@Override
	public int listCount() throws Exception {
 		return repository.listCount();
	}
	
	@Override
	public int qInsert(Question question) throws Exception {
		return repository.qInsert(question);
	}
	
	@Override
	public int qEdit(Question question) throws Exception {
 		return repository.qEdit(question);
	}

	@Override
	public int aInsert(Question question) throws Exception {
		return repository.aInsert(question);
	}

	@Override
	public List<Question> questionList(PagingVo2 vo) throws Exception {
 		return repository.questionList(vo);
	}
 

	@Override
	public List<Question> adminQuestionList(PagingVo2 vo) throws Exception {
 		return repository.adminQuestionList(vo);
	}
	
	@Override
	public Question read(int questionNo) throws Exception {
 		return repository.read(questionNo);
	}

	@Override
	public int deleteQuestion(int questionNo) throws Exception {
 		return repository.deleteQuestion(questionNo);
	}

	@Override
	public int deleteA(int questionNo) throws Exception {
 		return repository.deleteA(questionNo);
	}

	@Override
	public Integer questionListCount(Integer memberNo) throws Exception {
 		return repository.questionListCount(memberNo);
	}

	@Override
	public int faqInsert(FAQ faq) throws Exception {
 		return repository.faqInsert(faq);
	}

	@Override
	public int faqEdit(FAQ faq) throws Exception {
		return repository.faqEdit(faq);
	}

	@Override
	public int faqDelete(int faqNo) throws Exception {
		return repository.faqDelete(faqNo);
	}

	@Override
	public FAQ faqRead(int faqNo) throws Exception {
		return repository.faqRead(faqNo);
	}

	@Override
	public List<FAQ> faqList(PagingVo2 vo) throws Exception {
		return repository.faqList(vo);
	}

	@Override
	public int faqCount() throws Exception {
 		return repository.faqCount();
	}








}
