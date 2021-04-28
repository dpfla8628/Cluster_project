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
import com.kh.cluster.util.TokenUtil;

@Service
public class AuthServiceImpl implements AuthService {
	private static final Logger log = LoggerFactory.getLogger(AuthServiceImpl.class);

	@Autowired
	private AuthRepository repo;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private TokenUtil tokenUtil;
	
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
		log.info("sendMail()");
		
		switch (subject) {
		case SIGNUP:
			sendMail(authMember.getMemberId(), subject.getSubject(), MailTextUtil.mkSignUpText(authMember));
			break;

		case PASSWORD:
			sendMail(authMember.getMemberId(), subject.getSubject(), MailTextUtil.mkFindPwText(authMember));
			break;
		}
		
	}
	
	private void sendMail(String to, String subject, String text) {
		log.info("sendMail2()");
		
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
		log.info("resendMail()");
		
		AuthMember authMember = repo.selectMember(memberId);
		this.sendMail(authMember, subject);
	}
	
	//회원가입
	//회원가입하고 이메일 전송 때문에 AuthMember도 반환
	@Override
	public AuthMember signUpNormal(AuthMember authMember) {
		log.info("signUpNormal()");
		
		//토큰 발급
		String token = tokenUtil.createToken(authMember.getMemberId(), TokenUtil.EMAIL_TOKEN_EXPIREDTIME);
		authMember.setMemberAuthNum(token);
		
		//회원가입
		repo.insertNormal(authMember);
		
		//회원정보 가져오기
		return repo.selectMember(authMember.getMemberId()); 
	}
	
	//회원가입 완료
	@Override
	public Map<String, String> signUpComplete(String authNum, Integer memberNo) {
		log.info("signUpComplete()");
		
		Map<String, String> result = new HashMap<>();
		
		AuthMember authMember = repo.checkMember(memberNo);
		if(authMember == null) {
			return null;
		}
		else {//회원이 존재하면
			
			//토큰유효성검사
			String rightToken = tokenUtil.validateToken(authNum);
			if(rightToken == null) {
				//메일 재전송
				this.sendSignUpMail(authMember);
				
				result.put("resend", "resend");
				return result;
			}
			
			result.put("memberStatus", authMember.getMemberStatus());
			result.put("memberId", authMember.getMemberId());
			
			//이미 가입된 회원이라면
			if("y".equals(authMember.getMemberStatus())) return result;
			
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
	
	//회원가입 완료 메일 재전송
	@Override
	public void sendSignUpMail(AuthMember authMember) {
		log.info("sendSignUpMail()");
		
		//토큰 재발급
		String token = tokenUtil.createToken(authMember.getMemberId(), TokenUtil.EMAIL_TOKEN_EXPIREDTIME);
		
		//db에 저장
		HashMap<String, Object> map = new HashMap<>();
		map.put("column", "member_auth_num");
		map.put("changeVal", token);
		map.put("memberNo", authMember.getMemberNo());
		repo.updateOne2(map);
		
		//auth_num저장
		authMember.setMemberAuthNum(token);
		
		//링크 재전송
		this.sendMail(authMember, Subject.SIGNUP);
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
	
	//sns회원가입
	@Override
	public AuthMember signUpSNS(Map<String, String> member) {
		log.info("signUpSNS()");
		
		//회원가입 처리
		repo.insertSNS(member);
		//회원정보 반환
		return repo.selectMember(member.get("email"));
	}
	
	//비밀번호 찾기 메일 전송 + 토큰 발급
	@Override
	public void sendFindPasswordMail(AuthMember authMember) {
		log.info("sendFindPasswordMail()");
		
		//토큰 발급
		String token = tokenUtil.createToken(authMember.getMemberId(), TokenUtil.EMAIL_TOKEN_EXPIREDTIME);
		
		//토큰 저장 - member_auth_num에 저장
		HashMap<String, String> map = new HashMap<>();
		map.put("column", "member_auth_num");
		map.put("changeVal", token);
		map.put("memberId", authMember.getMemberId());
		repo.updateOne(map);
		
		authMember.setMemberAuthNum(token);
		
		//이메일 전송
		this.sendMail(authMember, Subject.PASSWORD);
		
	}
	
	//비밀번호 찾기 링크 재전송
	@Override
	public void resendFindPasswordMail(Integer memberNo) {
		log.info("resendFindPasswordMail()");
		
		AuthMember member = repo.selectMember2(memberNo);
		this.sendFindPasswordMail(member);
	}
	
	//비밀번호 찾기 링크 유효성 검사
	@Override
	public Map<String , Object> checkResetPasswordURL(Integer memberNo, String authNum) {
		log.info("checkResetPasswordURL()");
		
		Map<String, Object> resultMap = new HashMap<>();

		//토큰유효성검사
		String result = tokenUtil.validateToken(authNum);
		if(result == null) {
			//링크 재전송
			this.resendFindPasswordMail(memberNo);
			
			resultMap.put("path", "redirect:/login/wr");
			return resultMap;
		}
		
		//db정보와 일치하는지 확인
		HashMap<String, Object> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("memberAuthNum", authNum);
		AuthMember member = repo.checkAuthNum(map);
		
		if(member != null) {
			resultMap.put("path", "/auth/change-password");
			resultMap.put("memberNo", member.getMemberNo());
			
			return resultMap;
		}
		
		//db정보와 일치하지 않는경우
		resultMap.put("path", "redirect:/");
		return resultMap;
	}
	
	//비밀번호 찾기 시 유효성 검사
	@Override
	public boolean checkResetPw(AuthMemberCheckVO authMember) {
		log.info("checkResetPw()");
		
		String pwString = authMember.getMemberPw();
		String pwCheckString = authMember.getMemberPwCheck();
		
		//null, 빈 문자열 검사
		if(	
				!(	pwString == "" || pwString == null
					|| pwCheckString == "" || pwCheckString == null	)
		) 
		{
			//정규표현식 검사
			String pwRegex = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$";
			boolean pwRegexCheck = Pattern.matches(pwRegex, pwString);
			
			//비밀번호 동일 검사
			boolean pw = pwString.equals(pwCheckString);
				
			return pwRegexCheck && pw;
		}
		
		return false;
	}
	
	//비밀번호 변경
	@Override
	public void resetPassword(AuthMemberCheckVO authMember) {
		log.info("resetPassword()");
		
		//비밀번호 변경
		HashMap<String, Object> map = new HashMap<>();
		map.put("column", "member_pw");
		map.put("changeVal", authMember.getMemberPw());
		map.put("memberNo", authMember.getMemberNo());
		repo.updateOne2(map);
		
		//auth_num null로 변경
		map.put("column", "member_auth_num");
		map.put("memberNo", authMember.getMemberNo());
		repo.updateNull2(map);
	}

}
