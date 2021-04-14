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
	public Integer countMemberList() throws Exception {
		return repository.countMemberList();
	}
	
	@Override
	public Integer countSearchMemberList(String type, String key) throws Exception {
		return repository.countSearchMemberList(type, key);
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
	public List<AdminCreatorVO> getCreatorList() throws Exception {
		return repository.getCreatorList();
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
	public List<AdminClassorderVO> getTotalSales() throws Exception {
		return repository.getTotalSales();
	}

	@Override
	public List<AdminClassorderVO> getSearchTotalSales(Map<String, Object> map) throws Exception {
		return repository.getSearchTotalSales(map);
	}

	@Override
	public void addCategory(ClassCategory classCategory) throws Exception {
		repository.addCategory(classCategory);
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
