package com.kh.cluster.service;
 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.cluster.entity.OffClassVo;
import com.kh.cluster.entity.Review;
import com.kh.cluster.repository.ReviewRepository;

import java.util.List;
import java.util.Map;

 
 
//
// 
@Service 
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewRepository repository;
	

	@Override
	public void reviewInsert(Review review) throws Exception {
		repository.reviewInsert(review);
		
	}

	@Override
	public int reviewUpdate(Review review) throws Exception {
		return repository.reviewUpdate(review);
	}

	@Override
	public int reviewDelete(int reviewNo) throws Exception {
		return repository.reviewDelete(reviewNo);
		
	}
 
	@Override
	public int reviewCount(Integer classNo) throws Exception {
 		return repository.reviewCount(classNo);
	}

	@Override
	public List<Review> reviewList(Integer classNo) throws Exception {
 		return repository.reviewList(classNo);
	}

	@Override
	public List<Review> reviewList2(int memberNo) throws Exception {
		// TODO Auto-generated method stub
		return repository.reviewList2(memberNo);
	}
 

 
//	@Override
//	public List<Review> reviewList(Integer classNo, Integer endNum) throws Exception {
//		// TODO Auto-generated method stub
//		return repository.reviewList(classNo, endNum);
//	}
 
 
	 

}
