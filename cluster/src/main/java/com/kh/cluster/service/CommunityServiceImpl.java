package com.kh.cluster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cluster.entity.Question;
import com.kh.cluster.repository.CommunityRepository;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private CommunityRepository repository;
	
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
	public List<Question> questionList(int memberNo) throws Exception {
		return repository.questionList(memberNo);
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



}
