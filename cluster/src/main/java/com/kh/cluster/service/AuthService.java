package com.kh.cluster.service;

import java.util.Map;

import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.entity.AuthMemberCheckVO;
import com.kh.cluster.util.Subject;

public interface AuthService {
	public boolean checkSignUpInfo(Map<String, String> signupVo);
	public void sendMail(String to, Integer authNum, Subject subject);
	public Integer signUpNormal(AuthMember authMember);
	public String signUpComplete(Integer authNum);
	public String loginNormal(String id, String pw);
}
