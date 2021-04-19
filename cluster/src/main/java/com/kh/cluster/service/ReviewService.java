package com.kh.cluster.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cluster.entity.OffClassVo;
import com.kh.cluster.entity.Review;

 

public interface ReviewService { 
    
	public List<Review> reviewList(Integer classNo) throws Exception;
	
    public int reviewCount(Integer classNo) throws Exception;

    public void reviewInsert(Review review) throws Exception;
    
    public int reviewUpdate(Review review) throws Exception; 
    
    public int reviewDelete(int reviewNo) throws Exception; 
    
	public List<Review> reviewList2(int memberNo) throws Exception;

     
 
//    public List<Review> reviewList(Integer classNo, Integer endNum) throws Exception;

 
     
}




 