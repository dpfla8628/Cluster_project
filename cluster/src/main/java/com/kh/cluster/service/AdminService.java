package com.kh.cluster.service;

import java.util.List;
import java.util.Map;

import com.kh.cluster.entity.AdminClassorderVO;
import com.kh.cluster.entity.AdminCreatorVO;
import com.kh.cluster.entity.AdminMemberVO;
import com.kh.cluster.entity.AdminOffclassVO;
import com.kh.cluster.entity.AdminTopClassVO;
import com.kh.cluster.entity.AdminTopSalesVO;
import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.Event;

public interface AdminService {
	
	//페이징에 따른 회원목록 조회
	public List<AdminMemberVO> memberList(Map<String, Object> map) throws Exception;

	//검색을 통한 회원목록 조회	
	public List<AdminMemberVO> searchMemberList(Map<String, Object> map) throws Exception;
	
	//회원이 몇명인지 조회
	public Integer countMemberList() throws Exception;
	
	//검색일때 회원이 몇명인지 조회
	public Integer countSearchMemberList(String type, String key) throws Exception;
	
	//관리자 메인페이지 총매출액 TOP10 클래스 조회
	public List<AdminTopSalesVO> getTop10Sales() throws Exception;
	
	//관리자 메인페이지 총판매수 Top10 클래스 조회
	public List<AdminTopClassVO> getTop10Class() throws Exception;
	
	//이번달 + 최근 6개월간 기간별 회원수
	public List<Integer> getCountMember() throws Exception;
	
	//오늘 ~ 6일전 회원가입 수
	public List<Integer> getCountJoin() throws Exception;
	
	//최근 6개월 + 이번달 월 매출액
	public List<Long> getMonthSales() throws Exception;
	
	//최근 6일 + 오늘 매출액
	public List<Long> getDaySales() throws Exception;
	
	//크리에이터 리스트 가져오기
	public List<AdminCreatorVO> getCreatorList() throws Exception;
	
	//클래스 검수 페이지에 출력할 클래스 리스트
	public List<AdminOffclassVO> getClassList(Map<String, Object> map) throws Exception;
	//클래스 검수페이지에서 검색시 출력할 클래스 리스트
	public List<AdminOffclassVO> getSearchClassList(Map<String, Object> map) throws Exception;
	//클래스 검수페이지 목록 개수
	public Integer countClassList() throws Exception;
	//클래스 검수페이지 검색시 목록 개수
	public Integer countSearchClassList(String type, String key) throws Exception;
	
	
	//진행중인 클래스 리스트 가져오기
	public List<AdminOffclassVO> getOpenClassList(Map<String, Object> map) throws Exception;
	//검색 시 진행중인 클래스 리스트 가져오기
	public List<AdminOffclassVO> getSearchOpenClassList(Map<String, Object> map) throws Exception;
	//진행중인 클래스 리스트 개수
	public Integer countOpenClassList() throws Exception;
	//검색 시 진행중인 클래스 리스트 개수
	public Integer countSearchOpenClassList(String type, String key) throws Exception;
	
	
	//오픈 예정 클래스 가져오기
	public List<AdminOffclassVO> getComingSoonClassList(Map<String, Object> map) throws Exception;
	//검색 시 오픈 예정 클래스 리스트 가져오기
	public List<AdminOffclassVO> getSearchComingSoonClassList(Map<String, Object> map) throws Exception;
	//오픈 예정 클래스 리스트 개수
	public Integer countComingSoonClassList() throws Exception;
	//검색 시 오픈 예정 클래스 리스트 개수
	public Integer countSearchComingSoonClassList(String type, String key) throws Exception;
	
	
	//종료된 클래스 가져오기
	public List<AdminOffclassVO> getClosedClassList(Map<String, Object> map) throws Exception;
	//검색 시 종료된 클래스 리스트 가져오기
	public List<AdminOffclassVO> getSearchClosedClassList(Map<String, Object> map) throws Exception;
	//종료된 클래스 리스트 개수
	public Integer countClosedClassList() throws Exception;
	//검색 시 종료된 클래스 리스트 개수
	public Integer countSearchClosedClassList(String type, String key) throws Exception;
	
	
	//일자별 전체 매출 목록 가져오기
	public List<AdminClassorderVO> getTotalSales() throws Exception;
	//검색 시 일자별 전체 매출 목록 가져오기
	public List<AdminClassorderVO> getSearchTotalSales(Map<String, Object> map) throws Exception;
	
	
	//카테고리 추가
	public void addCategory(ClassCategory classCategory) throws Exception;
	//카테고리 중복체크
	public boolean checkCategory(String categoryBig, String categorySmall) throws Exception;
	//카테고리 대분류 리스트
	public List<String> getcategoryBigList() throws Exception;
	//카테고리 소분류 리스트
	public List<String> getcategorySmallList() throws Exception;
	
	//카테고리 목록
	public List<ClassCategory> getCategoryList(Map<String, Object> map) throws Exception;
	//검색시 카테고리 목록
	public List<ClassCategory> getSearchCategoryList(Map<String, Object> map) throws Exception;
	//카테고리 목록 개수
	public Integer countCategoryList() throws Exception;
	//검색시 카테고리 목록 개수
	public Integer countSearchCategoryList(String type, String key) throws Exception;
	
	//카테고리 번호로 카테고리 상세정보 가져오기
	public ClassCategory getCategoryDetail(int categoryNo) throws Exception;
	
	//카테고리 수정
	public void editCategory(ClassCategory classCategory) throws Exception;
	
	//카테고리 삭제
	public void deleteCategory(int categoryNo) throws Exception;
	
	//검색이 아닐때 이벤트 리스트
	public List<Event> getEventList() throws Exception;
	//검색이 아니고 셀렉박스 옵션이 '진행중' 일때
	public List<Event> getIngEventList() throws Exception;
	//검색이 아니고 셀렉박스 옵션이 '진행예정' 일때
	public List<Event> getComingSoonEventList() throws Exception;
	//검색이 아니고 셀렉박스 옵션이 '진행종료' 일때
	public List<Event> getEndEventList() throws Exception;
	
	//검색일때 이벤트 리스트
	public List<Event> getSearchEventList(String key) throws Exception;
	//검색이면서 셀렉박스 옵션이 '진행중' 일때
	public List<Event> getSearchIngEventList(String key) throws Exception;
	//검색이면서 셀렉박스 옵션이 '진행예정' 일때
	public List<Event> getSearchComingSoonEventList(String key) throws Exception;
	//검색이면서 셀렉박스 옵션이 '진행종료' 일때
	public List<Event> getSearchEndEventList(String key) throws Exception;
	
	
 	

}
