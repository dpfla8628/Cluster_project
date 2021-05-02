package com.kh.cluster.repository;


import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.kh.cluster.entity.ClassLike;
import com.kh.cluster.entity.ClassQuestion;
import com.kh.cluster.entity.Criteria;
import com.kh.cluster.entity.MyClassLike;
import com.kh.cluster.entity.OffClassVo;
import com.kh.cluster.entity.Offclass;

 
public interface ClassDetailRepository {
	
	//클래스 정보
	public OffClassVo read(int classNo) throws Exception;
	
	public List <OffClassVo> list(Criteria cri) throws Exception;
	public int listCount() throws Exception;
	
	//문의하기
	public void askClass(ClassQuestion qna) throws Exception; 
	//클래스 이미지
	public List<Offclass> readImg(Integer classNo) throws Exception;
	//클래스 주문 인원 체크
	public int classMemberCount(Integer classNo) throws Exception;
	
	public MyClassLike likeForMembers(int memberNo, int classNo) throws Exception;
 	public int likeCount(int classNo) throws Exception;
  }
