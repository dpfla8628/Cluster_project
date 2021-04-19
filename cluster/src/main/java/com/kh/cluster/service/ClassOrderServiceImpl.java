package com.kh.cluster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cluster.entity.MyClassOrder;
import com.kh.cluster.entity.MyCoupon;
import com.kh.cluster.repository.ClassOrderRepository;

@Service
public class ClassOrderServiceImpl implements ClassOrderService{
	
	@Autowired 
	private ClassOrderRepository repository;
	
	
	@Override
	public List<MyCoupon> couponList(Integer memberNo) throws Exception {
		return repository.couponList(memberNo);
	}

	@Override
	public int order(MyClassOrder myClassOrder) throws Exception {
		return repository.order(myClassOrder);
	}

	@Override
	public int useCoupon(MyClassOrder myClassOrder) throws Exception {
 		return repository.useCoupon(myClassOrder);
	}

	@Override
	public MyClassOrder kakaopay(Integer orderNo) throws Exception {
		return repository.kakaopay(orderNo);
		
	}

	@Override
	public int payOk(Integer orderNo) throws Exception {
 		return repository.payOk(orderNo);
	}

	@Override
	public int getNo(Integer memberNo) throws Exception {
		return repository.getNo(memberNo);
	}

	@Override
	public void changePhone(MyClassOrder myClassOrder) throws Exception {
		repository.changePhone(myClassOrder);
	}
	
}
