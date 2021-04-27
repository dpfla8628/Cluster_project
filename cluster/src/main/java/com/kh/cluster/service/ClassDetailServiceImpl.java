package com.kh.cluster.service;


import java.lang.reflect.Member;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cluster.entity.ClassLike;
import com.kh.cluster.entity.ClassQuestion;
import com.kh.cluster.entity.Criteria;
import com.kh.cluster.entity.MyClassLike;
import com.kh.cluster.entity.OffClassVo;
import com.kh.cluster.entity.Offclass;
import com.kh.cluster.repository.ClassDetailRepository;

 

@Service
public class ClassDetailServiceImpl implements ClassDetailService{

	@Autowired
	private ClassDetailRepository repository;
	
	@Override
	public OffClassVo read(int classNo) throws Exception {
		return repository.read(classNo);
	} 
	
	@Override
	public int listCount() throws Exception {
 		return repository.listCount();
	}
	
	@Override
	public List<OffClassVo> list(Criteria cri) throws Exception {
 		return repository.list(cri);
	}

	@Override
	public void askClass(ClassQuestion qna) throws Exception {
		repository.askClass(qna);
	} 
 

	@Override
	public List<Offclass> readImg(Integer classNo) throws Exception {
 		return repository.readImg(classNo);
	}

	@Override
	public int classMemberCount(Integer classNo) throws Exception {
 		return repository.classMemberCount(classNo);
	}

	@Override
	public MyClassLike likeForMembers(int memberNo, int classNo) throws Exception {
 		return repository.likeForMembers(memberNo, classNo);
	}

	@Override
	public int likeCount(int classNo) throws Exception {
 		return repository.likeCount(classNo);
	}
 
	 
	
 
	 
}
