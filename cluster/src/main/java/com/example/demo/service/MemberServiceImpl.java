package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.ClassOrder;
import com.example.demo.entity.Member;
import com.example.demo.entity.ClassQuestion;
import com.example.demo.entity.Review;
import com.example.demo.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberRepository repository; 

	@Override
	public Member read(Integer memberNo) throws Exception {
		return repository.read(memberNo);
	}

	@Override
	public Integer count(Member member) throws Exception {
		return repository.count(member);
	}
	
	@Override
	public void modify(Member member) throws Exception {
		repository.update(member);
	}

	@Override
	public List<Member> list() throws Exception {
		return repository.list();
	}

	@Override
	public List<ClassQuestion> readq(Integer memberNo) throws Exception {
		return repository.readq(memberNo);
	}

	@Override
	public List<ClassOrder> orderlist(Integer memberNo) throws Exception {
		return repository.orderlist(memberNo);
	}

	@Override
	public List<Review> riviewlist(Integer memberNo) throws Exception {
		return repository.reviewlist(memberNo);
	}

	@Override
	public void reviewedit(Review review) throws Exception {
		repository.reviewedit(review);
	}

	@Override
	public Review reviewcheck(Integer reviewNo) throws Exception {
		return repository.reviewcheck(reviewNo);
	}

	@Override
	public void reviewremove(Integer reviewNo) throws Exception {
		repository.reviewremove(reviewNo);
	}

	@Override
	public void orderremove(Integer orderNo) throws Exception {
		repository.orderremove(orderNo);
		
	}

	@Override
	public void questionremove(Integer questoinrNo) throws Exception {
		repository.questionremove(questoinrNo);
	}


}
