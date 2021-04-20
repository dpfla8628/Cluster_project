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
import com.kh.cluster.entity.Offclass;

public interface AdminService {
	
	//페이징에 따른 회원목록 조회
	public List<AdminMemberVO> memberList(Map<String, Object> map) throws Exception;
	//검색을 통한 회원목록 조회	(검색타입이 회원번호가 아닌 경우)
	public List<AdminMemberVO> searchMemberList(Map<String, Object> map) throws Exception;
	//검색을 통한 회원목록 조회	(검색타입이 회원번호인 경우)
	public List<AdminMemberVO> searchOneMember(Map<String, Object> map) throws Exception;
	//회원이 몇명인지 조회
	public Integer countMemberList() throws Exception;
	//검색일때 회원이 몇명인지 조회
	public Integer countSearchMemberList(String type, String key) throws Exception;
	
	//검색이 아닐때 주문한 회원 목록
	public List<AdminClassorderVO> getMemberOrderList(Map<String, Object> map) throws Exception;
	//검색이 아닐때 주문한 회원 수
	public Integer countMemberOrder() throws Exception;
	//검색일때 주문한 회원 목록
	public List<AdminClassorderVO> getSearchMemberOrderList(Map<String, Object> map) throws Exception;
	//검색일때 주문한 회원 목록 몇개인지
	public Integer countSearchMemberOrder(Map<String, Object> map) throws Exception;
	//'확인완료' 버튼 클릭시 order_ok 값을 '입금완료'로 변경
	public void confirmPayment(int orderNo) throws Exception;
	
	
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
	
	//검색이 아닐때 크리에이터 리스트 가져오기
	public List<AdminCreatorVO> getCreatorList(Map<String, Object> map) throws Exception;
	//검색시 크리에이터 리스트 가져오기
	public List<AdminCreatorVO> getSearchCreatorList(Map<String, Object> map) throws Exception;
	//검색이 아닐때 크리에이터 리스트 개수
	public Integer countCreatorList() throws Exception;
	//검색시 크리에이터 리스트 개수
	public Integer countSearchCreatorList(String key) throws Exception;
	
	//검색이 아닐때 크리에이터 정산 목록
	public List<AdminCreatorVO> getCreatorIncomeList() throws Exception;
	//검색일때 크리에이터 정산 목록
	public List<AdminCreatorVO> getSearchCreatorIncomeList(Map<String, Object> map) throws Exception;
	//크리에이터 정산하기
	public void calcCreatorIncome(String date) throws Exception;
	
	
	
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
	
	
	//현재달의 일매출+월매출 가져오기
	public List<AdminClassorderVO> getSalesList() throws Exception;
	//현재달의 월매출
	public AdminClassorderVO getThisMonthSales() throws Exception;
	//올해 연매출
	public AdminClassorderVO getYearSales() throws Exception;
	//검색한 해당 년월에 해당하는 일매출+월매출 가져오기
	public List<AdminClassorderVO> getSearchSalesList(String yearMonth) throws Exception;
	//검색한 해당 년월의 월매출
	public AdminClassorderVO getSearchMonthSales(String yearMonth) throws Exception;
	//검색시 해당년에 해당하는 연매출
	public AdminClassorderVO getSearchYearSales(String yearMonth) throws Exception;
	
	//진행중인 클래스 목록 가져오기(셀렉박스에 넣어주기 위함)
	public List<Offclass> getOpenClassList() throws Exception;
	//검색한 클래스의 해당년월 일매출+월매출 가져오기
	public List<AdminClassorderVO> getParticularSales(Map<String, Object> map) throws Exception;
	//검색시 해당 클래스의 연매출
	public AdminClassorderVO getParticularYearSales(Map<String, Object> map) throws Exception;
	//검색시 해당 클래스의 월매출 
	public AdminClassorderVO getParticularMonthSales(Map<String, Object> map) throws Exception;
	//검색이 아닐때(맨처음 페이지 들어올시) 셀렉박스의 첫번째 강의의 현재년월의 월매출+일매출
	public List<AdminClassorderVO> getParticularSales() throws Exception;
	//검색이 아닐때(맨처음 페이지 들어올시) 셀렉박스의 첫번째 강의의 올해 연매출
	public AdminClassorderVO getParticularYearSales() throws Exception;
	//검색이 아닐때(맨처음 페이지 들어올시) 셀렉박스의 첫번째 강의의 올해 월매출
	public AdminClassorderVO getParticularMonthSales() throws Exception;
	
	
	
	//카테고리 추가
	public void addCategory(String categoryBig, String categorySmall) throws Exception;
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
