package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.ClassOrder;
import com.example.demo.entity.Member;
import com.example.demo.entity.ClassQuestion;
import com.example.demo.entity.Review;

public interface MemberService {
	public Member read(Integer member_no) throws Exception;
	public Integer count(Member member) throws Exception;
	public void modify(Member member) throws Exception;
	public List<Member> list() throws Exception;
	public List<ClassQuestion> readq(Integer memberNo) throws Exception;
	public List<ClassOrder> orderlist(Integer memberNo) throws Exception;
	public List<Review> riviewlist(Integer memberNo) throws Exception;
	public void reviewedit(Review review) throws Exception;
	public Review reviewcheck(Integer reviewNo) throws Exception;
	public void reviewremove(Integer reviewNo) throws Exception;
	public void orderremove(Integer orderNo) throws Exception;
	public void questionremove(Integer questoinrNo) throws Exception;
}
