package com.kh.cluster.service;



import java.lang.reflect.Member;
import java.util.List;

import com.kh.cluster.entity.ClassLike;
import com.kh.cluster.entity.ClassQuestion;
import com.kh.cluster.entity.Criteria;
import com.kh.cluster.entity.MyClassLike;
import com.kh.cluster.entity.OffClassVo;
import com.kh.cluster.entity.Offclass;

 

public interface ClassDetailService {
	

	public OffClassVo read(int classNo) throws Exception; 
	
	public List<OffClassVo> list(Criteria cri) throws Exception;
	public int listCount() throws Exception;
	
	public void askClass(ClassQuestion qna) throws Exception; 
 	public List<Offclass> readImg(Integer classNo) throws Exception;
	public int classMemberCount(Integer classNo) throws Exception;
	
	public MyClassLike likeForMembers(int memberNo, int classNo) throws Exception;
	public int likeCount(int classNo) throws Exception;
}
