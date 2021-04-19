package com.kh.cluster.repository;

import java.util.List;

import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.Creator;
import com.kh.cluster.entity.Offclass;
import com.kh.cluster.util.PagingVO;

public interface OffclassRepository {

	public void join(Creator creator) throws Exception;
	
	public void authUpdate(Integer memberNo) throws Exception;
		
	public List<Offclass> classList() throws Exception;
	
	public List<Offclass> checkList() throws Exception;

	public void create(Offclass offclass)throws Exception;

	public Offclass classInfo(Integer classNo)throws Exception;

	public void delete(Integer classNo)throws Exception;

	public List<ClassCategory> categoryList() throws Exception;

	public void addImage(String fullName, Integer imageJoinNo) throws Exception;
	
	public List<String> getImage(Integer classNo) throws Exception;

	public Integer getClassNo() throws Exception;

	public String getPicture(Integer classNo) throws Exception;

	public int countClass(Integer creatorNo) throws Exception;

	public int countCheck(Integer creatorNo) throws Exception;

	public List<Offclass> selectClass(PagingVO vo) throws Exception;

	public List<Offclass> selectCheck(PagingVO vo) throws Exception;

	public Offclass readDate(Integer classNo) throws Exception;

	public void startDateUpdate(Offclass offclass) throws Exception;

	public void endDateUpdate(Offclass offclass) throws Exception;

	public Creator setCreator(int memberNo) throws Exception;

	public void creatorEdit(Creator creator) throws Exception;

}
