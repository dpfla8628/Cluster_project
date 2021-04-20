package com.kh.cluster;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@MapperScan(basePackages = "com.kh.cluster.repository")
@ServletComponentScan(basePackages = "com.kh.cluster.filter")
@PropertySource(value = {"classpath:auth.properties"})
public class ClusterApplication {
	public static void main(String[] args) {
		SpringApplication.run(ClusterApplication.class, args);
	}
}
