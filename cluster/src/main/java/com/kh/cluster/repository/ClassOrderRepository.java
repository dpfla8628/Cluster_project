package com.kh.cluster.repository;

import java.util.List;

import com.kh.cluster.entity.MyClassOrder;
import com.kh.cluster.entity.MyCoupon;

public interface ClassOrderRepository {
	
	//주문자의 쿠폰 리스트 조회
	public List<MyCoupon> couponList(Integer memberNo) throws Exception;
	
	//주문하기
	public int order(MyClassOrder myClassOrder) throws Exception;
	
	//사용 쿠폰 지우기
	public int useCoupon(MyClassOrder myClassOrder) throws Exception;
	
	public MyClassOrder kakaopay(Integer orderNo) throws Exception;
	
	//입금대기 -> 입금완료
	public int payOk(Integer orderNo) throws Exception;
	
	public int getNo(Integer memberNo) throws Exception;
	
	public void changePhone(MyClassOrder myClassOrder) throws Exception;
}
