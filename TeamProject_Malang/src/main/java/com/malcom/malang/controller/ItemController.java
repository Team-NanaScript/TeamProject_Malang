package com.malcom.malang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.ItemVO;
import com.malcom.malang.service.ItemService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/item")
@RequiredArgsConstructor
public class ItemController {
	
	protected final ItemService itService;

	@RequestMapping(value="/{cate}", method=RequestMethod.GET)
	public String category(@PathVariable("cate") String cate, Model model) {
		if(cate.isBlank() || cate.isEmpty()) {
			return "redirect:/";
		}	
		// 처음 sub 보여주기
		// cate > sub list setting attribute
		// sub click > ( sub ) category code GET
		// ( sub ) category code request parameter > list setting attribute
		if(cate.length() < 2 ) {
			itService.itemByCategory(cate, null, model);
		} else {
			itService.itemByCategory(cate.substring(0,1), cate, model);
		}
		return "item/category";
	}
	
	@RequestMapping(value = "/review", method=RequestMethod.GET)
	public String review() {
		return "item/review";
	}
	
	@RequestMapping(value = "/search/{keyword}", method=RequestMethod.GET)
	public String review(@PathVariable("keyword") String keyword, Model model) {
		log.debug("keyword {}", keyword );
		List<ItemVO> itemList = itService.findByTitle(keyword);
		
		model.addAttribute("ITEM_LIST", itemList);
		return "item/search";
	}
}
