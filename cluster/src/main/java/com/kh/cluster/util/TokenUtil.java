package com.kh.cluster.util;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

//토큰 관련 클래스
public class TokenUtil {
	private static final String SECRET_KEY = "secreat";
	
	//토큰 생성
	public static String createToken(String email) {
		//header설정
		Map<String, Object> headers = new HashMap<>();
        headers.put("typ", "JWT");
        headers.put("alg", "HS256");
		
        //claim 설정
        Map<String, Object> payloads = new HashMap<>();
        payloads.put("email", email);
        
        //토큰 유효시간 설정
        Long expiredTime = 1000 * 60L * 60L * 2L; // 토큰 유효 시간 (2시간)
        
        // 토큰 만료 시간
        Date ext = new Date(); 
        ext.setTime(ext.getTime() + expiredTime);
        
        //토큰 생성
        String jwt = Jwts.builder()
                .setHeader(headers) // Headers 설정
                .setClaims(payloads) // Claims 설정
                .setSubject("user") // 토큰 용도 
                .setExpiration(ext) // 토큰 만료 시간 설정
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY.getBytes()) // HS256과 Key로 Sign
                .compact(); // 토큰 생성
        
		return jwt;
	}
	//유효 토큰 확인
	//토큰 정보 확인
	//토큰 만료 시간 확인
	
}
