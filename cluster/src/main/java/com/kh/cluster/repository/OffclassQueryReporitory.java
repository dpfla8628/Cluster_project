package com.kh.cluster.repository;

import java.util.List;

import com.kh.cluster.entity.OffclassQueryVO;

public interface OffclassQueryReporitory {
	
	public List<OffclassQueryVO> searchByCategory() throws Exception;
	
}
