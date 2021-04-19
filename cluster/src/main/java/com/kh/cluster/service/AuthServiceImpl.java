package com.kh.cluster.service;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kh.cluster.entity.AuthMember;
import com.kh.cluster.entity.AuthMemberCheckVO;
import com.kh.cluster.entity.AuthMemberInfoCheckVO;
import com.kh.cluster.entity.AuthMemberVO;
import com.kh.cluster.repository.AuthRepository;
import com.kh.cluster.util.MailTextUtil;
import com.kh.cluster.util.Subject;

@Service
public class AuthServiceImpl implements AuthService {
	private static final Logger log = LoggerFactory.getLogger(AuthServiceImpl.class);

	@Autowired
	private AuthRepository repo;
	@Autowired
	private JavaMailSender mailSender;
	
	//회원가입 시 이메일, 닉네임 중복 확인
	@Override
	public boolean checkSignUpInfo(AuthMemberInfoCheckVO signupVo) {
		log.info("checkSignUpInfo()");
		
		String result;
		
		if("nick".equals(signupVo.getCheck())) {
			result = repo.checkNick(signupVo.getValue());
		}
		else {
			result = repo.checkId(signupVo.getValue());
		}
		
		return result != null ? true : false;
	}
	
	//회원가입 시 유효성 검사
	@Override
	public boolean checkSignup(AuthMemberCheckVO authMember) {
		log.info("checkSignup()");
		
		String idString = authMember.getMemberId();
		String nickString = authMember.getMemberNick();
		String pwString = authMember.getMemberPw();
		String pwCheckString = authMember.getMemberPwCheck();
		String agree1String = authMember.getMemberAgreement1();
		String agree2String = authMember.getMemberAgreement2();
		
		//null, 빈 문자열 검사
		if(	
				!(	idString == "" || idString == null
					|| nickString == "" || nickString == null
					|| pwString == "" || pwString == null
					|| pwCheckString == "" || pwCheckString == null
					|| agree1String == "" || agree1String == null
					|| agree2String == "" || agree2String == null	)
		) 
		{
			//정규표현식 검사
			String idRegex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
			String nickRegex = "[가-힣A-Za-z0-9]{2,10}";
			String pwRegex = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$";
			
			boolean idRegexCheck = Pattern.matches(idRegex, idString);
			boolean nickRegexCheck = Pattern.matches(nickRegex, nickString);
			boolean pwRegexCheck = Pattern.matches(pwRegex, pwString);
			
			if(idRegexCheck && nickRegexCheck && pwRegexCheck) {
				//id, nick 중복 검사
				boolean id = checkSignUpInfo(new AuthMemberInfoCheckVO("id", idString));
				boolean nick = checkSignUpInfo(new AuthMemberInfoCheckVO("nick",nickString));
				
				//비밀번호 동일 검사
				boolean pw = pwString.equals(pwCheckString);
				
				return !id && !nick && pw;
			}
		}
		
		return false;
	}
	
	//메일 전송
	@Override
	public void sendMail(AuthMember authMember, Subject subject) {
		
		switch (subject) {
		case SIGNUP:
			sendMail(authMember.getMemberId(), subject.getSubject(), MailTextUtil.mkSignUpText(authMember));
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
	
	@Override
	public void resendMail(String memberId, Subject subject) {
		AuthMember authMember = repo.selectMember(memberId);
		this.sendMail(authMember, subject);
	}
	
	//회원가입
	//회원가입하고 이메일 전송 때문에 AuthMember도 반환
	@Override
	public AuthMember signUpNormal(AuthMember authMember) {
		//회원가입
		repo.insertNormal(authMember);
		
		//회원정보 가져오기
		return repo.selectMember(authMember.getMemberId()); 
	}
	
	//회원가입 완료
	@Override
	public Map<String, String> signUpComplete(Integer authNum, Integer memberNo) {
		log.info("signUpComplete()");
		
		AuthMember authMember = repo.checkMember(memberNo);
		if(authMember == null) {
			return null;
		}
		else {//회원이 존재하면
			
			Map<String, String> result = new HashMap<>();
			result.put("memberStatus", authMember.getMemberStatus());
			result.put("memberId", authMember.getMemberId());
			
			//이미 가입된 회원이라면
			if("y".equals(authMember.getMemberStatus())) return result;
			System.out.println(authMember.getMemberStatus());
			//authNum이 다르다면
			if(!authNum.equals(authMember.getMemberAuthNum())) return null;
			
			//authNum이 동일하다면
			HashMap<String, String> map = new HashMap<>();
			map.put("column", "member_status");
			map.put("changeVal", "y");
			map.put("memberId", authMember.getMemberId());
			repo.updateOne(map);
			
			map = new HashMap<>();
			map.put("column", "member_auth_num");
			map.put("memberId", authMember.getMemberId());
			repo.updateNull(map);
			
			return result;
		}
	}
	
	
	//로그인
	@Override
	public AuthMember loginNormal(AuthMember loginMember) {
		log.info("loginNormal()");
		
		AuthMember member = repo.loginNormal(loginMember);
		return member;
	}
	
	//토큰 인자와 디비에 있는 토큰이 동일한지 확인
	@Override
	public AuthMemberVO isRightToken(String memberId, String token) {
		log.info("isRightToken()");
		
		AuthMember member = repo.selectMember(memberId);
		if(token.equals(member.getMemberToken())) return new AuthMemberVO(member);
		
		return null;
	}
	
	//DB에 토큰 저장
	@Override
	public void updateToken(String memberId, String token) {
		log.info("updateToken()");
		HashMap<String, String> map = new HashMap<>();
		map.put("column", "member_token");
		map.put("changeVal", token);
		map.put("memberId", memberId);
		repo.updateOne(map);
	}
	
	//DB에서 토큰 삭제
	@Override
	public void deleteToken(String memberId) {
		log.info("deleteToken()");
		HashMap<String, String> map = new HashMap<>();
		map.put("column", "member_token");
		map.put("memberId", memberId);
		repo.updateNull(map);
	}
	
	//회원정보 조회
	@Override
	public AuthMember isMember(String memberId) {
		log.info("isMember()");
		return repo.selectMember(memberId);
	}

}
