package com.kh.cluster.service;

import java.util.List;

import com.kh.cluster.entity.OffclassQueryVO;

public interface OffclassQueryService {
	
	public List<OffclassQueryVO> searchByCategory(String categoryBig, String categorySmall, String sort) throws Exception;
	
}
