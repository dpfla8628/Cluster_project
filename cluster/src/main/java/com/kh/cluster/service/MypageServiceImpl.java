package com.kh.cluster.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cluster.entity.MyClassLike;
import com.kh.cluster.entity.MyClassOrder;
import com.kh.cluster.entity.MyClassQuestion;
import com.kh.cluster.entity.MyCoupon;
import com.kh.cluster.entity.MyMember;
import com.kh.cluster.entity.MyReview;
import com.kh.cluster.repository.MypageRepository;

@Service
public class MypageServiceImpl implements MypageService{

	private static final Logger log =
			LoggerFactory.getLogger(MypageServiceImpl.class);
	
	@Autowired
	private MypageRepository repository; 

	@Override
	public MyMember read(Integer memberNo) throws Exception {
		return repository.read(memberNo);
	}

	@Override
	public Integer count(MyMember member) throws Exception {
		return repository.count(member);
	}
	
	@Override
	public void modify(MyMember member) throws Exception {
		repository.update(member);
		String[] files = member.getFiles();
		Integer memberNo = member.getMemberNo();
		if (files == null) {
			return;
		}
		
		for (String fileName : files) {
			repository.addAttach(fileName, memberNo);
			log.info("붙일 파일 명은??"+fileName);
		}
		
	}

	@Override
	public List<MyMember> list() throws Exception {
		return repository.list();
	}

	@Override
	public List<MyClassQuestion> readq(Integer memberNo) throws Exception {
		return repository.readq(memberNo);
	}

	@Override
	public List<MyClassOrder> orderlist(Integer memberNo) throws Exception {
		return repository.orderlist(memberNo);
	}

	@Override
	public List<MyReview> riviewlist(Integer memberNo) throws Exception {
		return repository.reviewlist(memberNo);
	}

	@Override
	public void reviewedit(MyReview review) throws Exception {
		repository.reviewedit(review);
	}

	@Override
	public MyReview reviewcheck(Integer reviewNo) throws Exception {
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

	@Override
	public MyReview reviewwrite(Integer classNo) throws Exception {
		return repository.reviewwrite(classNo);
	}

	@Override
	public List<MyClassLike> classlike(Integer memberNo) throws Exception {
		return repository.classlike(memberNo);
	}

	@Override
	public Integer couponcount(Integer memberNo) throws Exception {
		return repository.couponcount(memberNo);
	}

	@Override
	public List<MyCoupon> couponlist(Integer memberNo) throws Exception {
		return repository.couponlist(memberNo);
	}

	@Override
	public List<String> getAttach(Integer memberNo) throws Exception {
		return repository.getAttach(memberNo);
	}

	@Override
	public void delete(Integer memberNo) throws Exception {
		repository.delete(memberNo);
	}

	@Override
	public List<MyClassOrder> orderlisttest(Integer memberNo) throws Exception {
		return repository.orderlisttest(memberNo);
	}



}
