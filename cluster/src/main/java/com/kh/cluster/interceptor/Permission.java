package com.kh.cluster.interceptor;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target(METHOD)
public @interface Permission {
	// enum의 역할은 권한 부여를 하기 위함
	public enum MemberAuth {관리자, 강사, 일반}
	
	// 메서드 위에 어노테이션 작성  @Permission(authority = MemberType.admin)
	MemberAuth authority() default MemberAuth.일반;
}
