package com.kh.cluster.repository;

import java.util.List;
import java.util.Set;

import com.kh.cluster.entity.OffclassImageVO;
import com.kh.cluster.entity.OffclassQueryVO;

public interface OffclassQueryRepository {
	
	public List<OffclassQueryVO> searchByCategory(String categoryBig, String categorySmall, String sort) throws Exception;
	public List<OffclassImageVO> searchTumbnail(int classNo) throws Exception;
	public Set<Integer> likeForMembers(int memberNo, List<Integer> ids) throws Exception;
	// 원래 아래 2개 메소드는 offclass repository로 가는것이 적절하다.
	public void likeOffclass(int memberNo, int classNo) throws Exception;
	public void unLikeOffclass(int memberNo, int classNo) throws Exception; 
	
}
