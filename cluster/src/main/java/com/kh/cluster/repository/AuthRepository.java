package com.kh.cluster.repository;

import java.util.HashMap;

import com.kh.cluster.entity.AuthMember;

public interface AuthRepository {
	public AuthMember loginNormal(AuthMember member) ;
	public String checkNick(String memberNick) ;
	public String  checkId(String memberId) ;
	public void insertNormal(AuthMember member);
	public AuthMember selectMember(String memberId);
	public String checkAuthNum(Integer authNum);
	public void updateOne(HashMap<String, String> updateValue);
}
