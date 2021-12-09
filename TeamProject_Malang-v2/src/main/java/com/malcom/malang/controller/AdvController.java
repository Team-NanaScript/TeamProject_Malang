package com.malcom.malang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/advice")
public class AdvController {

	@RequestMapping(value = {"/",""} , method = RequestMethod.GET)
	public String advice() {
		
		return "board/advice";
	}
	
}
