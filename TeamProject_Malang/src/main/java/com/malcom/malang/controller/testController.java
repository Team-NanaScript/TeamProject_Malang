package com.malcom.malang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.ItemVO;
import com.malcom.malang.service.ItemService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class testController {
	
	protected final ItemService itService;

	@RequestMapping(value = "/banner", method = RequestMethod.GET)
	public String banner() {
		return "include/banner";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "include/home_list";
	}
	
	@RequestMapping(value = "/cate1", method = RequestMethod.GET)
	public String category() {
		return "item/cate";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {
		return "item/search";
	}
	
	@RequestMapping(value = "/today", method = RequestMethod.GET)
	public String today(Model model) {
		List<ItemVO> items = itService.malangOfToday();
		model.addAttribute("ITEM_LIST", items);
		return "home";
	}
}
