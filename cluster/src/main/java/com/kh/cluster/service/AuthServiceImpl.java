package com.kh.cluster.service;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.entity.AuthMemberCheckVO;
import com.kh.cluster.repository.AuthRepository;
import com.kh.cluster.util.MailTextUtil;
import com.kh.cluster.util.Subject;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private AuthRepository repo;
	@Autowired
	private JavaMailSender mailSender;
	
	//회원가입 시 이메일, 닉네임 중복 확인
	@Override
	public boolean checkSignUpInfo(Map<String, String> signupVo) {
		String result;
		
		if("nick".equals(signupVo.get("check"))) {
			result = repo.checkNick(signupVo.get("value"));
		}
		else {
			result = repo.checkId(signupVo.get("value"));
		}
		
		return result != null ? true : false;
	}
	
	//메일 전송
	@Override
	public void sendMail(String to, Integer authNum, Subject subject) {
		
		switch (subject) {
		case SIGNUP:
			sendMail(to, subject.getSubject(), MailTextUtil.mkSignUpText(authNum));
			break;

		case PASSWORD:
			 
			break;
		
		default:
			break;
		}
		
	}
	
	private void sendMail(String to, String subject, String text) {
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom("khfinalcluster@gmail.com", "CLUSTER");
			helper.setSubject(subject);
			helper.setTo(to);
			helper.setText(text, true);
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//회원가입
	//이메일 고유번호 때문에 Integer 반환
	@Override
	public Integer signUpNormal(AuthMember authMember) {
		//회원가입
		repo.insertNormal(authMember);
		
		//회원의 이메일 고유번호 확인
		Integer result = repo.selectMember(authMember.getMemberId()).getMemberAuthNum();
		
		return result; 
	}
	
	//회원가입 완료
	@Override
	public String signUpComplete(Integer authNum) {
		
		String memberId = repo.checkAuthNum(authNum);
		if(memberId == null) {
			return null;
		}
		else {
			HashMap<String, String> map = new HashMap<>();
			map.put("column", "member_status");
			map.put("changeVal", "y");
			map.put("memberId", memberId);
			repo.updateOne(map);
			
			return memberId;
		}
	}
	
	
	//로그인
	@Override
	public String loginNormal(String id, String pw) {
		
		return "";
	}
	

}
