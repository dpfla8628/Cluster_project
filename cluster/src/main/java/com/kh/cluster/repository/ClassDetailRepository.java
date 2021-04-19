package com.kh.cluster.repository;


import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

import com.kh.cluster.entity.ClassLike;
import com.kh.cluster.entity.ClassQuestion;
import com.kh.cluster.entity.Criteria;
import com.kh.cluster.entity.OffClassVo;
import com.kh.cluster.entity.Offclass;

 
public interface ClassDetailRepository {
	
	public OffClassVo read(Integer classNo) throws Exception;
	
 	
	public List <OffClassVo> list(Criteria cri) throws Exception;
	
	public int listCount() throws Exception;
	
	//문의하기
	public void askClass(ClassQuestion qna) throws Exception; 
	
	//리뷰 답변
	public void reviewOk(Integer reviewNo) throws Exception;
	
	//클래스 이미지
	public List<Offclass> readImg(Integer classNo) throws Exception;
	
	public int classMemberCount(Integer classNo) throws Exception;
  }
