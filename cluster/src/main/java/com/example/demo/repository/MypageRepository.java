package com.example.demo.repository;

import java.util.List;

import com.example.demo.entity.MyClassOrder;
import com.example.demo.entity.MyMember;
import com.example.demo.entity.MyClassLike;
import com.example.demo.entity.MyCoupon;
import com.example.demo.entity.MyClassQuestion;
import com.example.demo.entity.MyReview;

public interface MypageRepository {
	public MyMember read(Integer memberNo) throws Exception;
	public Integer count(MyMember member) throws Exception;
	public List<MyMember> list() throws Exception;
	public void update(MyMember member) throws Exception;
	public List<MyClassQuestion> readq(Integer memberNo) throws Exception;
	public List<MyClassOrder> orderlist(Integer memberNo) throws Exception;
	public List<MyReview> reviewlist(Integer memberNo) throws Exception;
	public void reviewedit(MyReview review) throws Exception;
	public MyReview reviewcheck(Integer reviewNo) throws Exception;
	public MyReview reviewwrite(Integer classNo) throws Exception;
	public void reviewremove(Integer reviewNo) throws Exception;
	public void orderremove(Integer orderNo) throws Exception;
	public void questionremove(Integer questoinrNo) throws Exception;
	public List<MyClassLike> classlike(Integer memberNo) throws Exception;
	public Integer couponcount(Integer memberNo) throws Exception ;
	public List<MyCoupon> couponlist(Integer memberNo) throws Exception;
	public void addAttach(String fullName, Integer memberNo) throws Exception;
	public List<String> getAttach(Integer memberNo) throws Exception;
	public Integer getMemberNo() throws Exception;
	public void delete(Integer memberNo) throws Exception;
}
