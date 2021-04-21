package com.kh.cluster;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.cluster.interceptor.AuthInterceptor;
import com.kh.cluster.interceptor.AuthInterceptor2;

@Configuration
public class AuthConfig implements WebMvcConfigurer{
	
	@Autowired
	AuthInterceptor authInterceptor;
	@Autowired
	AuthInterceptor2 authInterceptor2;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptor)
				.addPathPatterns("/login/result","/login/logout", "/signup/welcome", "/class_detail/detail", "class_detail/classQuestion", "class_detail/review","class_order/order",
						"/mypage/**", "/creator/**", "/join", "/joinForm")
				.excludePathPatterns("/login/", "/signup/");
		
		registry.addInterceptor(authInterceptor2)
				.addPathPatterns("/", "/auth/check", "/event/**");
		
		//registry.addInterceptor(new PermissionInterceptor())
		//		.addPathPatterns("/creator/**", "/admin/**")
		//		.excludePathPatterns("/static-resource-root/**");
	}
}