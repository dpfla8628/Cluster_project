package com.kh.cluster.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.kh.cluster.entity.OffclassImageVO;
import com.kh.cluster.entity.OffclassQueryVO;
import com.kh.cluster.repository.OffclassQueryRepository;

@Service
public class OffclassQueryServiceImpl implements OffclassQueryService {

	@Autowired
	private OffclassQueryRepository repository;

	@Override
	public List<OffclassQueryVO> searchByCategory(Integer memberNo, String categoryBig, String categorySmall, String sort) throws Exception {
		List<OffclassQueryVO> offClasses = repository.searchByCategory(categoryBig, categorySmall, sort);
		
		//클래스 번호를 모은다. 이유 : 강의찜을 체크 하기 위해
		List<Integer> classNumbers = new ArrayList<>();
		
		// 오프라인 강의와 썸네일을 조인했을 시 순서가 보장되지 않아 n+1 쿼리를 수행
		// 오프라인 강의별로 썸네일을 조회한다. 
		for (OffclassQueryVO vo : offClasses) {
			
			classNumbers.add(vo.getClassNo());
			
			List<OffclassImageVO> tumbnails = repository.searchTumbnail(vo.getClassNo());

			if (!CollectionUtils.isEmpty(tumbnails)) {
				vo.setThumbnailImage(tumbnails.get(0).getFullName().substring(3));
			}
		}
		// 해당 멤버가 강의를 찜한 클래스번호를 조회한다.
		if(!CollectionUtils.isEmpty(classNumbers) && memberNo != null) {
			Set<Integer> likeClasses = repository.likeForMembers(1, classNumbers);
			
			for (OffclassQueryVO vo : offClasses) {
				if (likeClasses.contains(vo.getClassNo())) {
					vo.setLiked(true);
				}
			}
		}
		
		return offClasses;
	}

	@Override
	public void updateOffclassLike(int memberNo, int classNo, boolean isLike) throws Exception {
		if(isLike) {
			repository.likeOffclass(memberNo, classNo);
			return;
		}
		repository.unLikeOffclass(memberNo, classNo);
	}
}