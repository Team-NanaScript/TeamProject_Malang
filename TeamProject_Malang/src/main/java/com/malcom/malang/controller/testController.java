package com.malcom.malang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class testController {

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
}
