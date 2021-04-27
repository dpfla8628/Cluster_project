package com.kh.cluster.service;

import java.util.List;

import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.ClassQuestion;
import com.kh.cluster.entity.Creator;
import com.kh.cluster.entity.Offclass;
import com.kh.cluster.entity.OffclassQnAVO;
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
	public Integer countClass(Integer creatorNo) throws Exception;
	
	// 검수 중 강의 총 개수
	public Integer countCheck(Integer creatorNo) throws Exception;
	
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
	public Creator setcreator(Integer memberNo) throws Exception;

	// 크리에이터 정보 수정
	public void creatorEdit(Creator creator) throws Exception;

	// 크리에이터 총 오픈했던 강의 개수 확인
	public Integer totalClass(Integer creatorNo) throws Exception;

	// 크리에이터 현재 오픈 중인 강의 개수 확인
	public Integer openClass(Integer creatorNo) throws Exception;

	// 모든 강의에서 좋아요 받은 개수 확인
	public Integer totalLike(Integer creatorNo) throws Exception;

	// 모든 강의에 참가했던 인원 수 확인
	public Integer totalEntrant(Integer creatorNo) throws Exception;

	// 페이징 처리 후 강의에 대한 질문 목록 확인
	public List<OffclassQnAVO> selectClassQnA(PagingVO vo) throws Exception;

	// 강의에 대한 질문 확인
	public ClassQuestion readQuestion(Integer classqNo)throws Exception;

	// 강의에 대한 질문 답변 입력
	public void classAnswer(ClassQuestion classQuestion) throws Exception;

	// 강의에 대한 질문 총 개수
	public Integer countQuestion(Integer creatorNo) throws Exception;

	// 강의에 대한 질문 답변 총 개수
	public Integer countAnswer(Integer creatorNo) throws Exception;

	
	
}
