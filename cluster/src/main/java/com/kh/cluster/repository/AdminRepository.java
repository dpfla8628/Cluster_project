package com.kh.cluster.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.cluster.entity.AdminClassorderVO;
import com.kh.cluster.entity.AdminCreatorVO;
import com.kh.cluster.entity.AdminMemberVO;
import com.kh.cluster.entity.AdminOffclassVO;
import com.kh.cluster.entity.AdminTopClassVO;
import com.kh.cluster.entity.AdminTopSalesVO;
import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.Event;
import com.kh.cluster.entity.Offclass;

@Repository
public interface AdminRepository {

	public List<AdminMemberVO> memberList(Map<String, Object> map) throws Exception;
	public List<AdminMemberVO> searchMemberList(Map<String, Object> map) throws Exception;
	public List<AdminMemberVO> searchOneMember(Map<String, Object> map) throws Exception;
	public Integer countMemberList() throws Exception;
	public Integer countSearchMemberList(String type, String key) throws Exception;
	
	public List<AdminClassorderVO> getMemberOrderList(Map<String, Object> map) throws Exception;
	public List<AdminClassorderVO> getSearchMemberOrderList(Map<String, Object> map) throws Exception;
	public Integer countMemberOrder() throws Exception;
	public Integer countSearchMemberOrder(Map<String, Object> map) throws Exception;
	public void confirmPayment(int orderNo) throws Exception;

	public List<AdminTopSalesVO> getTop10Sales() throws Exception;
	public List<AdminTopClassVO> getTop10Class() throws Exception;


	public Integer get6MonthAgoNumberOfMember() throws Exception;
	public Integer get5MonthAgoNumberOfMember() throws Exception;
	public Integer get4MonthAgoNumberOfMember() throws Exception;
	public Integer get3MonthAgoNumberOfMember() throws Exception;
	public Integer get2MonthAgoNumberOfMember() throws Exception;
	public Integer get1MonthAgoNumberOfMember() throws Exception;
	public Integer getThisMonthNumberOfMember() throws Exception;
	
	public Integer countJoinToday() throws Exception;
	public Integer countJoinTodayMinus1() throws Exception;
	public Integer countJoinTodayMinus2() throws Exception;
	public Integer countJoinTodayMinus3() throws Exception;
	public Integer countJoinTodayMinus4() throws Exception;
	public Integer countJoinTodayMinus5() throws Exception;
	public Integer countJoinTodayMinus6() throws Exception;
	
	public Long get6MonthAgoSales() throws Exception;
	public Long get5MonthAgoSales() throws Exception;
	public Long get4MonthAgoSales() throws Exception;
	public Long get3MonthAgoSales() throws Exception;
	public Long get2MonthAgoSales() throws Exception;
	public Long get1MonthAgoSales() throws Exception;
	public Long getThisMonthSales() throws Exception;
	
	public Long getTodayMinus6Sales() throws Exception;
	public Long getTodayMinus5Sales() throws Exception;
	public Long getTodayMinus4Sales() throws Exception;
	public Long getTodayMinus3Sales() throws Exception;
	public Long getTodayMinus2Sales() throws Exception;
	public Long getTodayMinus1Sales() throws Exception;
	public Long getTodaySales() throws Exception;
	
	public List<AdminCreatorVO> getCreatorList(Map<String, Object> map) throws Exception;
	public List<AdminCreatorVO> getSearchCreatorList(Map<String, Object> map) throws Exception;
	public Integer countCreatorList() throws Exception;
	public Integer countSearchCreatorList(String key) throws Exception;
	
	public List<AdminCreatorVO> getCreatorIncomeList() throws Exception;
	public List<AdminCreatorVO> getSearchCreatorIncomeList(Map<String, Object> map) throws Exception;
	public void calcCreatorIncome(String date) throws Exception;
	
	
	public List<AdminOffclassVO> getClassList(Map<String, Object> map) throws Exception;
	public List<AdminOffclassVO> getSearchClassList(Map<String, Object> map) throws Exception;
	public Integer countClassList() throws Exception;
	public Integer countSearchClassList(String type, String key) throws Exception;
	
	public List<AdminOffclassVO> getOpenClassList(Map<String, Object> map) throws Exception;
	public List<AdminOffclassVO> getSearchOpenClassList(Map<String, Object> map) throws Exception;
	public Integer countOpenClassList() throws Exception;
	public Integer countSearchOpenClassList(String type, String key) throws Exception;
	
	public List<AdminOffclassVO> getComingSoonClassList(Map<String, Object> map) throws Exception;
	public List<AdminOffclassVO> getSearchComingSoonClassList(Map<String, Object> map) throws Exception;
	public Integer countComingSoonClassList() throws Exception;
	public Integer countSearchComingSoonClassList(String type, String key) throws Exception;
	
	
	public List<AdminOffclassVO> getClosedClassList(Map<String, Object> map) throws Exception;
	public List<AdminOffclassVO> getSearchClosedClassList(Map<String, Object> map) throws Exception;
	public Integer countClosedClassList() throws Exception;
	public Integer countSearchClosedClassList(String type, String key) throws Exception;
	
	
	public List<AdminClassorderVO> getSalesList() throws Exception;
	public List<AdminClassorderVO> getSearchSalesList(String yearMonth) throws Exception;
	public AdminClassorderVO getYearSales() throws Exception;
	public AdminClassorderVO getSearchYearSales(String yearMonth) throws Exception;
	public AdminClassorderVO getThisMonthSales2() throws Exception;
	public AdminClassorderVO getSearchMonthSales(String yearMonth) throws Exception;
	
	public List<Offclass> getOpenClass() throws Exception;
	public List<AdminClassorderVO> getSearchParticularSales(Map<String, Object> map) throws Exception;
	public AdminClassorderVO getSearchParticularYearSales(Map<String, Object> map);
	public AdminClassorderVO getSearchParticularMonthSales(Map<String, Object> map);
	public List<AdminClassorderVO> getNoSearchParticularSales() throws Exception;
	public AdminClassorderVO getParticularThisYearSales() throws Exception;
	public AdminClassorderVO getParticularThisMonthSales() throws Exception;
	
	
	public void addCategory(String categoryBig, String categorySmall) throws Exception;
	public ClassCategory checkCategory(String categoryBig, String categorySmall) throws Exception;
	public List<String> getcategoryBigList() throws Exception;
	public List<String> getcategorySmallList() throws Exception;
	
	public List<ClassCategory> getCategoryList(Map<String, Object> map) throws Exception;
	public List<ClassCategory> getSearchCategoryList(Map<String, Object> map) throws Exception;
	public Integer countCategoryList() throws Exception;
	public Integer countSearchCategoryList(String type, String key) throws Exception;
	
	public ClassCategory getCategoryDetail(int categoryNo) throws Exception;
	
	public void editCategory(ClassCategory classCategory) throws Exception;
	
	public void deleteCategory(int categoryNo) throws Exception;
	
	public List<Event> getEventList() throws Exception;
	public List<Event> getIngEventList() throws Exception;
	public List<Event> getComingSoonEventList() throws Exception;
	public List<Event> getEndEventList() throws Exception;
	
	public List<Event> getSearchEventList(String key) throws Exception;
	public List<Event> getSearchIngEventList(String key) throws Exception;
	public List<Event> getSearchComingSoonEventList(String key) throws Exception;
	public List<Event> getSearchEndEventList(String key) throws Exception;
	
}
