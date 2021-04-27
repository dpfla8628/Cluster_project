package com.kh.cluster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cluster.entity.ClassCategory;
import com.kh.cluster.entity.ClassQuestion;
import com.kh.cluster.entity.Creator;
import com.kh.cluster.entity.Offclass;
import com.kh.cluster.entity.OffclassInfoVO;
import com.kh.cluster.entity.OffclassQnAVO;
import com.kh.cluster.repository.OffclassRepository;
import com.kh.cluster.util.PagingVO;

@Service
public class OffclassServiceImpl implements OffclassService{

	@Autowired
	private OffclassRepository repository;
	

	@Override
	public void join(Creator creator) throws Exception {
		repository.join(creator);
	}
	
	@Override
	public void authUpdate(Integer memberNo) throws Exception {
		repository.authUpdate(memberNo);
	}
	
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
	public Integer countClass(Integer creatorNo) throws Exception{
		return repository.countClass(creatorNo);
	}

	@Override
	public Integer countCheck(Integer creatorNo) throws Exception{
		return repository.countCheck(creatorNo);
	}

	@Override
	public List<OffclassInfoVO> selectClass(PagingVO vo) throws Exception{
		return repository.selectClass(vo);
	}


	@Override
	public List<Offclass> selectCheck(PagingVO vo) throws Exception{
		return repository.selectCheck(vo);
	}


	@Override
	public Offclass readDate(Integer classNo) throws Exception {
		return repository.readDate(classNo);
	}


	@Override
	public void startDateModify(Offclass offclass) throws Exception {
		repository.startDateUpdate(offclass);
	}


	@Override
	public void endDateModify(Offclass offclass) throws Exception {
		repository.endDateUpdate(offclass);
	}

	@Override
	public Creator setcreator(Integer memberNo) throws Exception{
		return repository.setCreator(memberNo);
	}

	@Override
	public void creatorEdit(Creator creator) throws Exception {
		repository.creatorEdit(creator);
	}

	@Override
	public Integer totalClass(Integer creatorNo) throws Exception {
		return repository.totalClass(creatorNo);
	}

	@Override
	public Integer openClass(Integer creatorNo) throws Exception{
		return repository.openClass(creatorNo);
	}
	
	@Override
	public Integer totalLike(Integer creatorNo) throws Exception {
		return repository.totalLike(creatorNo);
	}
	
	@Override
	public Integer totalEntrant(Integer creatorNo) throws Exception {
		return repository.totalEntrant(creatorNo);
	}
	
	@Override
	public List<OffclassQnAVO> selectClassQnA(PagingVO vo) throws Exception {
		return repository.selectClassQnA(vo);
	}
	
	@Override
	public ClassQuestion readQuestion(Integer classqNo) throws Exception {
		return repository.readQuestion(classqNo);
	}
	
	@Override
	public void classAnswer(ClassQuestion classQuestion) throws Exception {
		repository.classAnswer(classQuestion);
	}
	
	@Override
	public Integer countQuestion(Integer creatorNo) throws Exception{
		return repository.countQuestion(creatorNo);
	}
	
	@Override
	public Integer countAnswer(Integer creatorNo) throws Exception {
		return repository.countAnswer(creatorNo);
	}
	
}
