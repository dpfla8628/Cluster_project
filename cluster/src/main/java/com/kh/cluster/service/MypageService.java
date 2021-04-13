package com.kh.cluster.service;

import java.util.List;

import com.kh.cluster.entity.Creator;
import com.kh.cluster.entity.MyClassLike;
import com.kh.cluster.entity.MyClassOrder;
import com.kh.cluster.entity.MyClassQuestion;
import com.kh.cluster.entity.MyCoupon;
import com.kh.cluster.entity.MyMember;
import com.kh.cluster.entity.MyReview;

public interface MypageService {
	public MyMember read(Integer member_no) throws Exception;
	public Integer count(MyMember member) throws Exception;
	public void modify(MyMember member) throws Exception;
	public List<MyMember> list() throws Exception;
	public List<MyClassQuestion> readq(Integer memberNo) throws Exception;
	public List<MyClassOrder> orderlist(Integer memberNo) throws Exception;
	public List<MyReview> riviewlist(Integer memberNo) throws Exception;
	public void reviewedit(MyReview review) throws Exception;
	public MyReview reviewcheck(Integer reviewNo) throws Exception;
	public void reviewremove(Integer reviewNo) throws Exception;
	public void orderremove(Integer orderNo) throws Exception;
	public void questionremove(Integer questoinrNo) throws Exception;
	public MyReview reviewwrite(Integer classNo) throws Exception;
	public List<MyClassLike> classlike(Integer memberNo) throws Exception;
	public Integer couponcount(Integer memberNo) throws Exception;
	public List<MyCoupon> couponlist(Integer memberNo) throws Exception;
	public List<String> getAttach(Integer memberNo) throws Exception;
	public void delete(Integer memberNo) throws Exception;
	public List<MyClassOrder> orderlisttest(Integer memberNo) throws Exception;
	public void memberout(Integer memberNo) throws Exception;
	public void reviewwww(MyReview myreview) throws Exception;
	public Creator setcreator(int memberNo)throws Exception;
}
