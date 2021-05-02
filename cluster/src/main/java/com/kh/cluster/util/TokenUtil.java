package com.kh.cluster.util;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.kh.cluster.interceptor.AuthInterceptor;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

//토큰 관련 클래스
@Component
public class TokenUtil {
	
	@Value("${jwt.secret}")
	private String secrect;
	
	private static final Logger log = LoggerFactory.getLogger(AuthInterceptor.class);
	public static final int TOKEN_EXPIREDTIME = 60 * 60 * 6; //토큰 유효 시간(6시간), 초
	public static final int	EMAIL_TOKEN_EXPIREDTIME = 60 * 10; //토큰 유효 시간(10분), 초
	
	//토큰 생성
	public String createToken(String email, int time) {
		log.info("createToken()");
		//header설정
		Map<String, Object> headers = new HashMap<>();
        headers.put("typ", "JWT");
        headers.put("alg", "HS256");
		
        //claim 설정
        Map<String, Object> payloads = new HashMap<>();
        payloads.put("email", email);
        
        long expiredTime = time * 1000L; //밀리초
        
        // 토큰 만료 시간
        Date ext = new Date(); 
        ext.setTime(ext.getTime() + expiredTime);
        
        //토큰 생성
        String jwt = Jwts.builder()
                .setHeader(headers) // Headers 설정
                .setClaims(payloads) // Claims 설정
                .setSubject("user") // 토큰 용도 
                .setExpiration(ext) // 토큰 만료 시간 설정
                .signWith(SignatureAlgorithm.HS256, secrect.getBytes()) // HS256과 Key로 Sign
                .compact(); // 토큰 생성
        
		return jwt;
	}
	
	public String createToken2(Integer memberNo, int time) {
		log.info("createToken()");
		//header설정
		Map<String, Object> headers = new HashMap<>();
        headers.put("typ", "JWT");
        headers.put("alg", "HS256");
		
        //claim 설정
        Map<String, Object> payloads = new HashMap<>();
        payloads.put("email", memberNo);
        
        long expiredTime = time * 1000L; //밀리초
        
        // 토큰 만료 시간
        Date ext = new Date(); 
        ext.setTime(ext.getTime() + expiredTime);
        
        //토큰 생성
        String jwt = Jwts.builder()
                .setHeader(headers) // Headers 설정
                .setClaims(payloads) // Claims 설정
                .setSubject("user") // 토큰 용도 
                .setExpiration(ext) // 토큰 만료 시간 설정
                .signWith(SignatureAlgorithm.HS256, secrect.getBytes()) // HS256과 Key로 Sign
                .compact(); // 토큰 생성
        
		return jwt;
	}
	
	//유효 토큰 확인
	public String validateToken(String token) {
		log.info("validateToken()");
		
		try{
			Claims claims = Jwts.parser().setSigningKey(secrect.getBytes()).parseClaimsJws(token).getBody();
			System.out.println("exp:"+claims.getExpiration());
			System.out.println("claim:"+claims.get("email", String.class));
			return claims.get("email", String.class);//유효 토큰이면 email정보 반환
		}
		catch(ExpiredJwtException e) { //토큰 만료 시
			e.printStackTrace();
		}
		catch(Exception e) { // 그 외 예외 발생 시
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Integer validateToken2(String token) {
		log.info("validateToken()");
		
		try{
			Claims claims = Jwts.parser().setSigningKey(secrect.getBytes()).parseClaimsJws(token).getBody();
			System.out.println("claim:"+claims.get("email", String.class));
			return claims.get("email", Integer.class);//유효 토큰이면 email정보 반환
		}
		catch(ExpiredJwtException e) { //토큰 만료 시
			e.printStackTrace();
		}
		catch(Exception e) { // 그 외 예외 발생 시
			e.printStackTrace();
		}
		
		return null;
	}
	
	//토큰 만료 시간 확인
	
}
