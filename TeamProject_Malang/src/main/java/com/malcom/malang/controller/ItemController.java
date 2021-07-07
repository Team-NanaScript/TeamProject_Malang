package com.malcom.malang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/item")
public class ItemController {

	@RequestMapping(value="/{cate}", method=RequestMethod.GET)
	public String category(@PathVariable("cate") String cate, Model model) {
		
		return "item/category";
	}
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review() {
		return "item/review";
	}
}
