package com.kh.cluster.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cluster.entity.OffclassQueryVO;
import com.kh.cluster.service.OffclassQueryService;

@Controller
public class MainController {

	private static final Logger log = LoggerFactory.getLogger(MainController.class);

	@Autowired
	OffclassQueryService service;

	@GetMapping("/")
	public String main(Model model) throws Exception {
		log.info("main()");

		return "/index";
	}

	@GetMapping("/crafts")
	public String craftsCate(Model model, @RequestParam(value = "subcategory", required = false) String subcategory,
			@RequestParam(value = "sort", required = false) String sort) throws Exception {
		log.info("craftCate()");
		log.info("subcategory::{}", subcategory);

		subcategory = parseSubcategory(subcategory);
		sort = parseSort(sort);

		List<OffclassQueryVO> list = service.searchByCategory("공예", subcategory, sort);
		for (OffclassQueryVO vo : list) {
			log.info("Thumbnail::{}", vo.getThumbnailImage());
		}
		model.addAttribute("offclasses", list);
		model.addAttribute("sort", sort);

		return "/maincate/crafts";
	}
	
	private String parseSubcategory(String subcategory) {
		if (subcategory == null) {
			return null;
		}

		switch (subcategory) {
		case "ceramic":
			subcategory = "도자기";
			break;
		case "leather":
			subcategory = "가죽";
			break;
		case "accessories":
			subcategory = "악세사리";
			break;
		}
		return subcategory;
	}
	
	private String parseSort(String sort) {
		if (sort == null) {
			return "new";
		}

		switch (sort) {
		case "hprice":
		case "rprice":
			return sort;
		default:
			return "new";
		}
	}

}
