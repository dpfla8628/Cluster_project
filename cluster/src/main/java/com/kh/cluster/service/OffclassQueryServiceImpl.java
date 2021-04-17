package com.kh.cluster.service;

import java.util.Collections;
import java.util.List;

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
	public List<OffclassQueryVO> searchByCategory(String categoryBig, String categorySmall, String sort) throws Exception {
		List<OffclassQueryVO> list = repository.searchByCategory(categoryBig, categorySmall, sort);
		for (OffclassQueryVO vo : list) {

			List<OffclassImageVO> tumbnails = repository.searchTumbnail(vo.getClassNo());

			if (!CollectionUtils.isEmpty(tumbnails)) {
				vo.setThumbnailImage(tumbnails.get(0).getFullName().substring(3));
			}

		}
		return list;
	}
}
