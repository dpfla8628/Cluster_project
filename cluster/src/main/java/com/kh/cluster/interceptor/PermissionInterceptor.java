package com.kh.cluster.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.cluster.interceptor.Permission.MemberAuth;

public class PermissionInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		// handler를 HandlerMethod 타입으로 다운캐스팅/ 요청을 처리할 메소드
		HandlerMethod method = (HandlerMethod) handler;
		
		// 메소드에 붙은 어노테이션 참조
		Permission permission = method.getMethodAnnotation(Permission.class);
		
		if(permission == null) {
			// 메소드에 붙은 permission 어노테이션이 없다면 권한 제약이 없다는 것으로 생각하고 통과
			return true;
		}
		
		if(handler instanceof HandlerMethod == false){
			// handler가 HandlerMethod 타입이 아닌 경우 return fasle;
			return true;
		}
		
		// 로그인 시에 미리 세션에 저장해둔 유저의 MemberAuth를 꺼냄
		String authority = (String) request.getSession().getAttribute("memberAuth");
		
		
		// 어노테이션의 memberAuth 값이 관리자인 경우
		if(permission.authority().equals(MemberAuth.관리자)) {
			if(authority.equals(MemberAuth.관리자.name())) {
				// 세션에 저장된 유저의 memberAuth가 관리자가 맞는지 확인 후 통과
				return true;
			}
		}
		
		// 어노테이션의 memberAuth 값이 강사인 경우
		if(permission.authority().equals(MemberAuth.강사)) {
			if(authority.equals(MemberAuth.강사.name())) {
				// 세션에 저장된 유저의 memberAuth가 강사가 맞는지 확인 후 통과
				return true;
			}
		}
		
		// 그렇지 않다면 권한이 없는 유저의 접근이므로 에러 처리
		throw new RuntimeException("No access");
	}
	
}
