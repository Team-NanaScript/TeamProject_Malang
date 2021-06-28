package com.malcom.malang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.MemberVO;
import com.malcom.malang.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class MemberController {
	
	protected final MemberService mService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		
		return "member/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(String mb_id, String mb_pw, String mb_name) {
		
		MemberVO vo = new MemberVO();
		vo.setMb_id(mb_id);
		vo.setMb_name(mb_name);
		vo.setMb_pw(mb_pw);
		vo.setMb_tel("010-1111-1111");
		
		log.debug(vo.toString());
		mService.insert(vo);
		
		
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
