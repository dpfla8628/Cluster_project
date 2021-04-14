package com.kh.cluster.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.cluster.entity.AdminMemberVO;
import com.kh.cluster.entity.AdminOffclassVO;
import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.service.AdminService;

@Component
public class PagingUtil {
	
	private static AdminService service;
	
	@Autowired
	private void setService(AdminService service) {
		this.service = service;
	}
	
	/*
	 먼저 스프링에 의해 관리될 수 있도록 @Component 어노테이션을 작성해준다.
	 위에처럼 setter메서드나 아래와 같이 생성자를 이용해서 주입받을 객체를 가져
	 와서 할당해야한다.
	 
	private PagingUtil(AdminService service) {
		this.service = service;
	}
	*/
	
	//검색 + 페이징 기능을 만들어주는 메서드
	public static Map<String, Object> getPaging(Integer p, String type, String key, int listSize, int pageNavSize, String jspName) throws Exception {
		
		try {
			if(p <= 0 || p == null) throw new Exception();
		}
		catch(Exception e) {
			p = 1;
		}
		
								
		int endRow = p * listSize;
		int startRow = endRow - listSize + 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		//검색인지 판정할 기준
		boolean isSearch = type != null && key != null;
		
		
		//목록의 개수
		int count = 0;
		
		
		List<AdminOffclassVO> adminOffclassVOList = new ArrayList<>();
		List<AdminMemberVO> adminMemberVOList = new ArrayList<>();
		List<ClassCategory> classCategoryList = new ArrayList<>();
		
		//검색일 경우
		if(isSearch) {
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("type", type);
			map.put("key", key);
			
			if(jspName.equals("checkClassOpen")) {
				//검색조건에 맞는 클래스 검수 목록이 몇개인지	
				count = service.countSearchClassList(type, key);
				//검색조건에 맞는 클래스 검수 목록
				adminOffclassVOList = service.getSearchClassList(map);
			}
			else if(jspName.equals("openClass")) {
				//검색조건에 맞는 진행중인 클래스 목록이 몇개인지	
				count = service.countSearchOpenClassList(type, key);
				//검색조건에 맞는 진행중인 클래스 목록		
				adminOffclassVOList = service.getSearchOpenClassList(map);
			}
			else if(jspName.equals("comingSoonClass")) {
				//검색조건에 맞는 오픈 예정 클래스 목록이 몇개인지	
				count = service.countSearchComingSoonClassList(type, key);
				//검색조건에 맞는 오픈 예정 클래스 목록				
				adminOffclassVOList = service.getSearchComingSoonClassList(map);
			}
			else if(jspName.equals("closedClass")) {
				//검색 조건에 맞는 종료된 클래스 리스트가 몇개인지	
				count = service.countSearchClosedClassList(type, key);
				//검색 조건에 맞는 종료된 클래스 목록						
				adminOffclassVOList = service.getSearchClosedClassList(map);
			}
			
			else if(jspName.equals("memberList")) {
				//검색조건에 맞는 회원이 몇명인지	
				count = service.countSearchMemberList(type, key);
				//검색조건에 맞는 회원 리스트
				adminMemberVOList = service.searchMemberList(map);
			}
			
			else if(jspName.equals("categoryList")) {
				//검색조건에 맞는 카테고리가 몇개인지	
				count = service.countSearchCategoryList(type, key);
				//검색조건에 맞는 카테고리 리스트
				classCategoryList = service.getSearchCategoryList(map);
			}
			
					
		}
		//검색이 아닐 경우
		else {
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			if(jspName.equals("checkClassOpen")) {
				//검색이 아닐때 클래스 검수 목록이 몇개인지
				count = service.countClassList();
				//검색이 아닐때 클래스 검수목록
				adminOffclassVOList = service.getClassList(map);
			}
			else if(jspName.equals("openClass")) {
				//검색이 아닐때 진행중인 클래스 목록이 몇개인지
				count = service.countOpenClassList();
				//검색이 아닐때 진행중인 클래스 목록		
				adminOffclassVOList = service.getOpenClassList(map);
			}
			else if(jspName.equals("comingSoonClass")) {
				//검색이 아닐때 오픈 예정 클래스 목록이 몇개인지
				count = service.countComingSoonClassList();
				//검색이 아닐때 오픈 예정 클래스 목록				
				adminOffclassVOList = service.getComingSoonClassList(map);
			}
			else if(jspName.equals("closedClass")) {
				//검색이 아닐때 종료된 클래스 목록이 몇개인지
				count = service.countClosedClassList();
				//검색이 아닐때 종료된 클래스 목록					
				adminOffclassVOList = service.getClosedClassList(map);
			}
			
			else if(jspName.equals("memberList")) {
				//검색이 아닐때 회원이 몇명인지
				count = service.countMemberList();
				
				adminMemberVOList = service.memberList(map);
			}
			
			else if(jspName.equals("categoryList")) {
				//검색이 아닐때 카테고리가 몇개인지
				count = service.countCategoryList();
				//검색이 아닐때 카테고리 목록
				classCategoryList = service.getCategoryList(map);
			}
			
					
		}
		
		
		//페이지 네비게이션 
						
		int startNum = (p-1) / pageNavSize * pageNavSize + 1;
		int endNum = startNum + pageNavSize - 1;
		
		
		//필요한 페이지 개수
		int pageSize = (count + listSize - 1) / listSize;
		
						
		if(endNum > pageSize) endNum = pageSize;
		
		
		map.put("p", p);
		map.put("isSearch", isSearch);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("pageSize", pageSize);
		
		//페이지에 따라 필요한 목록
		map.put("adminOffclassVOList", adminOffclassVOList);
		map.put("adminMemberVOList", adminMemberVOList);
		map.put("classCategoryList", classCategoryList);
		
		
		
		return map;
				
	}
}
