package com.malcom.malang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ItemController {

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info() {
		return "item/info";
	}
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review() {
		return "item/review";
	}
}
