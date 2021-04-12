package com.kh.cluster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.Offclass;
import com.kh.cluster.repository.OffclassRepository;
import com.kh.cluster.util.PagingVO;

@Service
public class OffclassServiceImpl implements OffclassService{

	@Autowired
	private OffclassRepository repository;
	
	@Override
	public List<Offclass> classList() throws Exception {
		return repository.classList();
	}

		
	@Override
	public List<Offclass> checkList() throws Exception {
		return repository.checkList();
	}

	@Override
	public void registClass(Offclass offclass) throws Exception {
		repository.create(offclass);
		
		String[] files = offclass.getFiles();
		Integer imageJoinNo = repository.getClassNo();
		
		if(files == null) {
			return;
		}
		for(String fileName : files) {
			repository.addImage(fileName, imageJoinNo);
		}
	}

	@Override
	public Offclass classDetail(Integer classNo) throws Exception {
		return repository.classInfo(classNo);
	}

	@Override
	public void classRemove(Integer classNo) throws Exception {
		repository.delete(classNo);
	}

	@Override
	public List<ClassCategory> categoryList() throws Exception {
		return repository.categoryList();
	}

	@Override
	public List<String> getImage(Integer classNo) throws Exception {
		return repository.getImage(classNo);
	}

	@Override
	public Integer getClassNo() throws Exception {
		return repository.getClassNo();
	}


	@Override
	public String getPicture(Integer classNo) throws Exception {
		return repository.getPicture(classNo);
	}


	@Override
	public int countClass() {
		return repository.countClass();
	}


	@Override
	public List<Offclass> selectClass(PagingVO vo) {
		return repository.selectClass(vo);
	}


	@Override
	public List<Offclass> selectCheck(PagingVO vo) {
		return repository.selectCheck(vo);
	}

}
