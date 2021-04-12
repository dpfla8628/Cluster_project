package com.kh.cluster.util;

//메일 전송 내용 작성 클래스
public class MailTextUtil {
	public static String mkSignUpText(Integer authNum) {
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body><div style='text-align: center;'><h1 style='color: #ffc107;'>CLUSTER</h1><p>환영합니다!</p>");
		sb.append("<p><a href='http://localhost:33333/signup/");
		sb.append(authNum);
		sb.append("'>링크</a>를 눌러서 회원가입을 완료해 주세요!</p><small>*만일 CLUSTER에 가입한 적이 없으시다면 해당 이메일을 무시하셔도 됩니다.</small></div></body></html>");
		String str = sb.toString();
		
		return str;
	}
}
