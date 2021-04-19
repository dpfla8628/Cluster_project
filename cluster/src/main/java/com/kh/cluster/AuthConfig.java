package com.kh.cluster;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.cluster.interceptor.AuthInterceptor;

@Configuration
public class AuthConfig implements WebMvcConfigurer{
	
	@Autowired
	AuthInterceptor authInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptor)
				.addPathPatterns("/login/result","/login/logout", "/signup/welcome")
				.excludePathPatterns("/login/", "/signup/");
	}
	
}
