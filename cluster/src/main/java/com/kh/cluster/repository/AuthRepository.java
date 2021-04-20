package com.kh.cluster.repository;

import java.util.HashMap;
import java.util.Map;

import com.kh.cluster.entity.AuthMember;

public interface AuthRepository {
	public AuthMember loginNormal(AuthMember member) ;
	public String checkNick(String memberNick) ;
	public String  checkId(String memberId) ;
	public void insertNormal(AuthMember member);
	public AuthMember selectMember(String memberId);
	public AuthMember checkMember(Integer memberNo);
	public void updateOne(HashMap<String, String> updateValue);
	public void updateNull(HashMap<String, String> updateValue);
	public void insertSNS(Map<String, String> member);
}
