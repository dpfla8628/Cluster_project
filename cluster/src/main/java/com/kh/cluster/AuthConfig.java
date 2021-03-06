package com.kh.cluster;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.cluster.interceptor.AuthInterceptor;
import com.kh.cluster.interceptor.AuthInterceptor2;
import com.kh.cluster.interceptor.CreatorInterceptor;

@Configuration
public class AuthConfig implements WebMvcConfigurer{
	
	@Autowired
	AuthInterceptor authInterceptor;
	@Autowired
	AuthInterceptor2 authInterceptor2;
	@Autowired
	CreatorInterceptor creatorInterceptor;
 
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptor2)
				.addPathPatterns("/**", "/search/**");

		registry.addInterceptor(authInterceptor)
 				.addPathPatterns("/login/result","/login/logout", "/signup/welcome", 
 						"/class_detail/classQuestion/*/*", "/mypage/**", "/creator/**","/community/**",
 						"/join", "/joinForm")
 				.excludePathPatterns("/login/", "/signup/", "/mypage/**", "/creator/**","/community/faq");
		
		registry.addInterceptor(creatorInterceptor)
        		.addPathPatterns("/creator/**")
				.excludePathPatterns("/creator/home");
		//주석 test
		//registry.addInterceptor(new PermissionInterceptor())
		//		.addPathPatterns("/creator/**", "/admin/**")
		//		.excludePathPatterns("/static-resource-root/**");
 
	}
}