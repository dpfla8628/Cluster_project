package com.example.demo.repository;

import java.util.List;

import com.example.demo.entity.ClassOrder;
import com.example.demo.entity.Member;
import com.example.demo.entity.ClassQuestion;
import com.example.demo.entity.Review;

public interface MemberRepository {
	public Member read(Integer memberNo) throws Exception;
	public Integer count(Member member) throws Exception;
	public List<Member> list() throws Exception;
	public void update(Member member) throws Exception;
	public List<ClassQuestion> readq(Integer memberNo) throws Exception;
	public List<ClassOrder> orderlist(Integer memberNo) throws Exception;
	public List<Review> reviewlist(Integer memberNo) throws Exception;
	public void reviewedit(Review review) throws Exception;
	public Review reviewcheck(Integer reviewNo) throws Exception;
	public void reviewremove(Integer reviewNo) throws Exception;
	public void orderremove(Integer orderNo) throws Exception;
	public void questionremove(Integer questoinrNo) throws Exception; 
}
