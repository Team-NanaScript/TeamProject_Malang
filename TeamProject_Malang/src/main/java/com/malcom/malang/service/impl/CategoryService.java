package com.malcom.malang.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.malcom.malang.service.ItemService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("categoryService")
public class CategoryService {
	
//	Qualifier해서 아이템관련 서비스 불러오기
	protected final ItemService itService;
	
	public void listByMain(String cate_main, String sub_main,  Model model) {
		if( cate_main.equalsIgnoreCase("I")) {
			// 일러스트
		} else if( cate_main.equalsIgnoreCase("E")) {
			// 수제간식
		} else if( cate_main.equalsIgnoreCase("H")) {
			// 수공예
		} else if( cate_main.equalsIgnoreCase("P")) {
			// 반려동물용품
		}
	}
	
	public void listBySub(String sub_main, Model model) {
//		List<String> sub_cate = 
		if(sub_main.equals("") || sub_main == null) {
//			
		}
	}
}
