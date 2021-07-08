package com.malcom.malang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.service.ItemService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/item")
@RequiredArgsConstructor
public class ItemController {
	
	protected final ItemService itService;

//	@RequestMapping(value="/{cate}", method=RequestMethod.GET)
//	public String category(@PathVariable("cate") String cate, Model model) {
//		if(cate.isBlank() || cate.isEmpty()) {
//			return "redirect:/";
//		}
//		itService.categoryList(model);
//		return "item/category";
//	}
	
	@RequestMapping(value="/{cate}/{sub}", method=RequestMethod.GET)
	public String subCategory(@PathVariable("cate") String cate,
			@PathVariable("sub") String sub, Model model) {
		if(cate.isBlank() || cate.isEmpty()) {
			return "redirect:/";
		}
		if(sub.isBlank() || sub.isEmpty()) {
			// 처음 sub 보여주기
			// cate > sub list setting attribute
			// sub click > ( sub ) category code GET
			// ( sub ) category code request parameter > list setting attribute  
//			itService.itemByCategory(cate, sub, model);
		}
		itService.categoryList(model);
		return "item/category";
	}
	
	@RequestMapping(value = "/review", method=RequestMethod.GET)
	public String review() {
		return "item/review";
	}
}
