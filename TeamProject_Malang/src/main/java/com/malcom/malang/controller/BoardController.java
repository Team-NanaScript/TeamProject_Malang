package com.malcom.malang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice() {

		return "board/notice";
	}
	
	@RequestMapping(value = "/advice", method = RequestMethod.GET)
	public String advice() {
		
		return "board/advice";
	}
}
