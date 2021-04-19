package com.kh.cluster.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.cluster.entity.OffClassVo;
import com.kh.cluster.entity.Review;

 
  
@Repository
 public interface ReviewRepository {
    // 댓글 개수
    public int reviewCount(Integer classNo) throws Exception;
 
    // 댓글 목록
    public List<Review> reviewList(Integer classNo) throws Exception;
 
    // 댓글 작성
    public void reviewInsert(Review review) throws Exception;
    
    // 댓글 수정
    public int reviewUpdate(Review review) throws Exception;
 
    // 댓글 삭제
    public int reviewDelete(Integer reviewNo) throws Exception;
 
    
	public List<Review> reviewList2(int memberNo) throws Exception;

 
//    public List<Review> reviewList(Integer classNo, Integer endNum) throws Exception;

 }
