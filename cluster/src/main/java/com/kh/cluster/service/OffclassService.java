package com.kh.cluster.service;

import java.util.List;

import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.Offclass;
import com.kh.cluster.util.PagingVO;

public interface OffclassService {

	// 강의목록 확인
	public List<Offclass> classList() throws Exception;
	
	// 검수 진행 목록 확인
	public List<Offclass> checkList() throws Exception;
	
	// 강의 신청
	public void registClass(Offclass offclass) throws Exception;
	
	// 강의 상세정보 확인
	public Offclass classDetail(Integer classNo) throws Exception;
	
	// 강의 총 개수
	public int countClass();
	
	// 페이징 처리 후 강의목록 확인
	public List<Offclass> selectClass(PagingVO vo);
	
	// 페이징 처리 후 검수 진행 목록 확인
	public List<Offclass> selectCheck(PagingVO vo);
	
	// 검수 진행 중 강의 삭제
	public void classRemove(Integer classNo) throws Exception;
	
	// 카테고리 목록 확인
	public List<ClassCategory> categoryList() throws Exception;
	
	// 이미지 출력 테스트
	public String getPicture(Integer classNo) throws Exception;
	
	// 강의에 연결된 이미지 확인
	public List<String> getImage(Integer classNo) throws Exception;
	
	// 강의 번호 확인
	public Integer getClassNo() throws Exception;
	
}
