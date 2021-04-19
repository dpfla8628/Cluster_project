package com.kh.cluster.service;

import java.util.List;

import com.kh.cluster.entity.OffclassQueryVO;

public interface OffclassQueryService {
	
	// memberNo가 Null이면 로그인 하지 않은 사용자에 대한 강의리스트를 반환한다.
	public List<OffclassQueryVO> searchByCategory(Integer memberNo, String categoryBig, String categorySmall, String sort) throws Exception;
	public void updateOffclassLike(int memberNo, int classNo, boolean isLike) throws Exception;
}
