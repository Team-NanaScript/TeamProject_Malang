package com.malcom.malang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.ItemVO;
import com.malcom.malang.service.ItemService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {
	
	protected final ItemService itService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<ItemVO> todayMalang = itService.malangOfToday();
		
		model.addAttribute("ITEM_LIST",todayMalang);
		return "home";
	}		
	
	
}
