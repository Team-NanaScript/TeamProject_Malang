package com.malcom.malang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		
		return "member/join";
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String mypage() {
		return "member/mypage";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String buy() {
		return "member/cart";
	}
}
