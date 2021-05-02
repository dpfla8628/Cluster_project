package com.kh.cluster.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cluster.entity.AdminClassorderVO;
import com.kh.cluster.entity.AdminCreatorVO;
import com.kh.cluster.entity.AdminMemberVO;
import com.kh.cluster.entity.AdminOffclassVO;
import com.kh.cluster.entity.AdminTopClassVO;
import com.kh.cluster.entity.AdminTopSalesVO;
import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.Event;
import com.kh.cluster.entity.Offclass;
import com.kh.cluster.repository.AdminRepository;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminRepository repository;
	
	@Override
	public List<AdminMemberVO> memberList(Map<String, Object> map) throws Exception {
		return repository.memberList(map);
	}

	@Override
	public List<AdminMemberVO> searchMemberList(Map<String, Object> map) throws Exception {
		
		return repository.searchMemberList(map);
	}
	
	@Override
	public List<AdminMemberVO> searchOneMember(Map<String, Object> map) throws Exception {
		return repository.searchOneMember(map);
	}

	@Override
	public Integer countMemberList() throws Exception {
		return repository.countMemberList();
	}
	
	@Override
	public Integer countSearchMemberList(String type, String key) throws Exception {
		return repository.countSearchMemberList(type, key);
	}
	
	@Override
	public List<AdminClassorderVO> getMemberOrderList(Map<String, Object> map) throws Exception {
		return repository.getMemberOrderList(map);
	}

	@Override
	public Integer countMemberOrder() throws Exception {
		return repository.countMemberOrder();
	}
	
	@Override
	public List<AdminClassorderVO> getSearchMemberOrderList(Map<String, Object> map) throws Exception {
		return repository.getSearchMemberOrderList(map);
	}

	@Override
	public Integer countSearchMemberOrder(Map<String, Object> map) throws Exception {
		return repository.countSearchMemberOrder(map);
	}
	
	@Override
	public void confirmPayment(int orderNo) throws Exception {
		repository.confirmPayment(orderNo);
	}
	

	@Override
	public List<AdminTopSalesVO> getTop10Sales() throws Exception {
		return repository.getTop10Sales();
	}
	
	@Override
	public List<AdminTopClassVO> getTop10Class() throws Exception {
		return repository.getTop10Class();
	}
	
	
	@Override
	public List<Integer> getCountMember() throws Exception {
		List<Integer> list = new ArrayList<>();
		
		list.add(repository.get6MonthAgoNumberOfMember());
		list.add(repository.get5MonthAgoNumberOfMember());
		list.add(repository.get4MonthAgoNumberOfMember());
		list.add(repository.get3MonthAgoNumberOfMember());
		list.add(repository.get2MonthAgoNumberOfMember());
		list.add(repository.get1MonthAgoNumberOfMember());
		list.add(repository.getThisMonthNumberOfMember());
		
		return list;
	}
	

	@Override
	public List<Integer> getCountJoin() throws Exception {
		List<Integer> list = new ArrayList<>();
		
		list.add(repository.countJoinTodayMinus6());
		list.add(repository.countJoinTodayMinus5());
		list.add(repository.countJoinTodayMinus4());
		list.add(repository.countJoinTodayMinus3());
		list.add(repository.countJoinTodayMinus2());
		list.add(repository.countJoinTodayMinus1());
		list.add(repository.countJoinToday());
		
		return list;
	}

	@Override
	public List<Long> getMonthSales() throws Exception {
		List<Long> list = new ArrayList<>();
		
		list.add(repository.get6MonthAgoSales());
		list.add(repository.get5MonthAgoSales());
		list.add(repository.get4MonthAgoSales());
		list.add(repository.get3MonthAgoSales());
		list.add(repository.get2MonthAgoSales());
		list.add(repository.get1MonthAgoSales());
		list.add(repository.getThisMonthSales());
		
		return list;
	}

	@Override
	public List<Long> getDaySales() throws Exception {
		List<Long> list = new ArrayList<>();
		
		list.add(repository.getTodayMinus6Sales());
		list.add(repository.getTodayMinus5Sales());
		list.add(repository.getTodayMinus4Sales());
		list.add(repository.getTodayMinus3Sales());
		list.add(repository.getTodayMinus2Sales());
		list.add(repository.getTodayMinus1Sales());
		list.add(repository.getTodaySales());
		
		return list;
	}
	
	@Override
	public List<AdminCreatorVO> getCreatorList(Map<String, Object> map) throws Exception {
		return repository.getCreatorList(map);
	}

	@Override
	public List<AdminCreatorVO> getSearchCreatorList(Map<String, Object> map) throws Exception {
		return repository.getSearchCreatorList(map);
	}

	@Override
	public Integer countCreatorList() throws Exception {
		return repository.countCreatorList();
	}

	@Override
	public Integer countSearchCreatorList(String key) throws Exception {
		return repository.countSearchCreatorList(key);
	}
	
	@Override
	public List<AdminCreatorVO> getCreatorIncomeList() throws Exception {
		return repository.getCreatorIncomeList();
	}
	
	@Override
	public List<AdminCreatorVO> getSearchCreatorIncomeList(Map<String, Object> map) throws Exception {
		return repository.getSearchCreatorIncomeList(map);
	}
	
	@Override
	public void calcCreatorIncome(String date) throws Exception {
		repository.calcCreatorIncome(date);
	}

	

	@Override
	public List<AdminOffclassVO> getClassList(Map<String, Object> map) throws Exception {
		
		return repository.getClassList(map);
	}
	@Override
	public List<AdminOffclassVO> getSearchClassList(Map<String, Object> map) throws Exception {
		return repository.getSearchClassList(map);
	}
	
	@Override
	public Integer countClassList() throws Exception {
		return repository.countClassList();
	}
	
	@Override
	public Integer countSearchClassList(String type, String key) throws Exception {
		return repository.countSearchClassList(type, key);
	}
	
	@Override
	public void yesClassOpen(int classNo) throws Exception {
		repository.yesClassOpen(classNo);
	}
	@Override
	public void noClassOpen(int classNo) throws Exception {
		repository.noClassOpen(classNo);
	}
	
	@Override
	public void waitClassOpen(int classNo) throws Exception {
		repository.waitClassOpen(classNo);
	}

	@Override
	public List<AdminOffclassVO> getOpenClassList(Map<String, Object> map) throws Exception {
		return repository.getOpenClassList(map);
	}

	@Override
	public List<AdminOffclassVO> getSearchOpenClassList(Map<String, Object> map) throws Exception {
		return repository.getSearchOpenClassList(map);
	}

	@Override
	public Integer countOpenClassList() throws Exception {
		return repository.countOpenClassList();
	}

	@Override
	public Integer countSearchOpenClassList(String type, String key) throws Exception {
		return repository.countSearchOpenClassList(type, key);
	}
	
	@Override
	public List<AdminOffclassVO> getComingSoonClassList(Map<String, Object> map) throws Exception {
		return repository.getComingSoonClassList(map);
	}

	@Override
	public List<AdminOffclassVO> getSearchComingSoonClassList(Map<String, Object> map) throws Exception {
		return repository.getSearchComingSoonClassList(map);
	}

	@Override
	public Integer countComingSoonClassList() throws Exception {
		return repository.countComingSoonClassList();
	}

	@Override
	public Integer countSearchComingSoonClassList(String type, String key) throws Exception {
		return repository.countSearchComingSoonClassList(type, key);
	}

	@Override
	public List<AdminOffclassVO> getClosedClassList(Map<String, Object> map) throws Exception {
		return repository.getClosedClassList(map);
	}

	@Override
	public List<AdminOffclassVO> getSearchClosedClassList(Map<String, Object> map) throws Exception {
		return repository.getSearchClosedClassList(map);
	}

	@Override
	public Integer countClosedClassList() throws Exception {
		return repository.countClosedClassList();
	}

	@Override
	public Integer countSearchClosedClassList(String type, String key) throws Exception {
		return repository.countSearchClosedClassList(type, key);
	}

	@Override
	public List<AdminClassorderVO> getSalesList() throws Exception {
		return repository.getSalesList();
	}

	@Override
	public List<AdminClassorderVO> getSearchSalesList(String yearMonth) throws Exception {
		return repository.getSearchSalesList(yearMonth);
	}
	
	@Override
	public AdminClassorderVO getYearSales() throws Exception {
		return repository.getYearSales();
	}

	@Override
	public AdminClassorderVO getSearchYearSales(String yearMonth) throws Exception {
		return repository.getSearchYearSales(yearMonth);
	}
	
	@Override
	public AdminClassorderVO getThisMonthSales() throws Exception {
		return repository.getThisMonthSales2();
	}

	@Override
	public AdminClassorderVO getSearchMonthSales(String yearMonth) throws Exception {
		return repository.getSearchMonthSales(yearMonth);
	}
	
	@Override
	public List<AdminClassorderVO> getTotalSales() throws Exception {
		return repository.getTotalSales();
	}
	
	@Override
	public List<AdminClassorderVO> getTotalSales(String yearMonth) throws Exception {
		return repository.getSearchTotalSales(yearMonth);
	}
	
	@Override
	public List<Offclass> getOpenClassList() throws Exception {
		return repository.getOpenClass();
	}
	
	@Override
	public List<AdminClassorderVO> getParticularSales() throws Exception {
		return repository.getNoSearchParticularSales();
	}
	
	@Override
	public List<AdminClassorderVO> getParticularSales(Map<String, Object> map) throws Exception {
		return repository.getSearchParticularSales(map);
	}
	
	@Override
	public AdminClassorderVO getParticularYearSales(Map<String, Object> map) throws Exception {
		return repository.getSearchParticularYearSales(map);
	}

	@Override
	public AdminClassorderVO getParticularMonthSales(Map<String, Object> map) throws Exception {
		return repository.getSearchParticularMonthSales(map);
	}
	
	@Override
	public AdminClassorderVO getParticularYearSales() throws Exception {
		return repository.getParticularThisYearSales();
	}

	@Override
	public AdminClassorderVO getParticularMonthSales() throws Exception {
		return repository.getParticularThisMonthSales();
	}
	
	@Override
	public List<AdminClassorderVO> getParticularTotalSales() throws Exception {
		return repository.getParticularTotalSales();
	}
	
	@Override
	public List<AdminClassorderVO> getParticularTotalSales(Map<String, Object> map) throws Exception {
		return repository.getSearchParticularTotalSales(map);
	}
	

	@Override
	public void addCategory(String categoryBig, String categorySmall) throws Exception {
		repository.addCategory(categoryBig, categorySmall);
	}
	
	@Override
	public boolean checkCategory(String categoryBig, String categorySmall) throws Exception {
		
		ClassCategory classCategory = repository.checkCategory(categoryBig, categorySmall);
		if(classCategory == null) {
			return false;
		}
		else {
			return true;
		}
	}

	@Override
	public List<ClassCategory> getCategoryList(Map<String, Object> map) throws Exception {
		return repository.getCategoryList(map);
	}

	@Override
	public List<ClassCategory> getSearchCategoryList(Map<String, Object> map) throws Exception {
		return repository.getSearchCategoryList(map);
	}

	@Override
	public Integer countCategoryList() throws Exception {
		return repository.countCategoryList();
	}

	@Override
	public Integer countSearchCategoryList(String type, String key) throws Exception {
		return repository.countSearchCategoryList(type, key);
	}

	@Override
	public ClassCategory getCategoryDetail(int categoryNo) throws Exception {
		return repository.getCategoryDetail(categoryNo);
	}

	@Override
	public void editCategory(ClassCategory classCategory) throws Exception {
		repository.editCategory(classCategory);
	}

	@Override
	public void deleteCategory(int categoryNo) throws Exception {
		repository.deleteCategory(categoryNo);
	}

	@Override
	public List<String> getcategoryBigList() throws Exception {
		return repository.getcategoryBigList();
	}

	@Override
	public List<String> getcategorySmallList() throws Exception {
		return repository.getcategorySmallList();
	}

	@Override
	public List<Event> getEventList() throws Exception {
		return repository.getEventList();
	}

	
	@Override
	public List<Event> getIngEventList() throws Exception {
		return repository.getIngEventList();
	}

	@Override
	public List<Event> getComingSoonEventList() throws Exception {
		return repository.getComingSoonEventList();
	}

	@Override
	public List<Event> getEndEventList() throws Exception {
		return repository.getEndEventList();
	}
	
	@Override
	public List<Event> getSearchEventList(String key) throws Exception {
		return repository.getSearchEventList(key);
	}

	@Override
	public List<Event> getSearchIngEventList(String key) throws Exception {
		return repository.getSearchIngEventList(key);
	}

	@Override
	public List<Event> getSearchComingSoonEventList(String key) throws Exception {
		return repository.getSearchComingSoonEventList(key);
	}

	@Override
	public List<Event> getSearchEndEventList(String key) throws Exception {
		return repository.getSearchEndEventList(key);
	}
	
	
	
}
