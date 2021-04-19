package com.kh.cluster.service;

import java.util.List;

import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.Creator;
import com.kh.cluster.entity.Offclass;
import com.kh.cluster.util.PagingVO;

public interface OffclassService {

	// 크리에이터 가입
	public void join(Creator creator) throws Exception;
	
	// 회원 권한 변경
	public void authUpdate(Integer memberNo) throws Exception;
	
	// 강의목록 확인
	public List<Offclass> classList() throws Exception;
	
	// 검수 진행 목록 확인
	public List<Offclass> checkList() throws Exception;
	
	// 강의 신청
	public void registClass(Offclass offclass) throws Exception;
	
	// 강의 상세정보 확인
	public Offclass classDetail(Integer classNo) throws Exception;
	
	// 진행 중 강의 총 개수
	public int countClass(Integer creatorNo) throws Exception;
	
	// 검수 중 강의 총 개수
	public int countCheck(Integer creatorNo) throws Exception;
	
	// 페이징 처리 후 강의목록 확인
	public List<Offclass> selectClass(PagingVO vo) throws Exception;
	
	// 페이징 처리 후 검수 진행 목록 확인
	public List<Offclass> selectCheck(PagingVO vo) throws Exception;
	
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
	
	// 날짜 확인
	public Offclass readDate(Integer classNo) throws Exception;
	
	// 시작날짜 수정
	public void startDateModify(Offclass offclass) throws Exception;
	
	// 종료날짜 수정
	public void endDateModify(Offclass offclass) throws Exception;

	// 크리에이터 정보 확인
	public Creator setcreator(int memberNo) throws Exception;

	// 크리에이터 정보 수정
	public void creatorEdit(Creator creator) throws Exception;

	
	
}
