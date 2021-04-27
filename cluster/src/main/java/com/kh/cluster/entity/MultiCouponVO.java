package com.kh.cluster.entity;

import java.util.List;

public class MultiCouponVO {
	private List<CouponVO> coupons;
	
	@Override
	public String toString() {
		return "MultiCouponVO [coupons=" + coupons + "]";
	}

	public List<CouponVO> getCoupons() {
		return coupons;
	}

	public void setCoupons(List<CouponVO> coupons) {
		this.coupons = coupons;
	}
	
}
