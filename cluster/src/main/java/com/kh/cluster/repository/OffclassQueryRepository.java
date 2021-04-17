package com.kh.cluster.repository;

import java.util.List;

import com.kh.cluster.entity.OffclassImageVO;
import com.kh.cluster.entity.OffclassQueryVO;

public interface OffclassQueryRepository {
	
	public List<OffclassQueryVO> searchByCategory(String categoryBig, String categorySmall, String sort) throws Exception;
	public List<OffclassImageVO> searchTumbnail(int classNo) throws Exception;
	
}
