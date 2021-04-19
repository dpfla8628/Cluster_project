package com.kh.cluster.service;

import java.util.Map;

import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.entity.AuthMemberCheckVO;
import com.kh.cluster.entity.AuthMemberInfoCheckVO;
import com.kh.cluster.entity.AuthMemberVO;
import com.kh.cluster.util.Subject;

public interface AuthService {
	public boolean checkSignUpInfo(AuthMemberInfoCheckVO signupVo);
	public void sendMail(AuthMember authMember, Subject subject);
	public AuthMember signUpNormal(AuthMember authMember);
	public Map<String, String> signUpComplete(Integer authNum, Integer memberNo);
	public AuthMember loginNormal(AuthMember loginMember);
	public boolean checkSignup(AuthMemberCheckVO authMember);
	public AuthMemberVO isRightToken(String memberId, String token);
	public void updateToken(String memberId, String token);
	public void deleteToken(String memberId);
	public void resendMail(String memberId, Subject subject);
	public AuthMember isMember(String memberId);
}
