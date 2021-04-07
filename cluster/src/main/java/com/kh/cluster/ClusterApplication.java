package com.kh.cluster;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.kh.cluster.repository")
public class ClusterApplication {
	public static void main(String[] args) {
		SpringApplication.run(ClusterApplication.class, args);
	}
}
