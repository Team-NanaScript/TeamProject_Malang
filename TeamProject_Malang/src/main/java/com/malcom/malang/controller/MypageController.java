package com.malcom.malang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.MemberVO;
import com.malcom.malang.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

// 나중에 MemberController로 이동할 TestController

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/mypage")
public class MypageController {

	protected final MemberService mService;
	
	@RequestMapping(value="/{nav_name}", method=RequestMethod.GET)
	public String myPage(@PathVariable("nav_name") String nav_name, String code, HttpSession session, Model model) {
		log.debug("내비 카테 {}", nav_name);
		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null) {
			model.addAttribute("MSG","REJECT");
		} else {
			if(code == null || code.equals("")) {
				mService.mypage(membervo.getMb_id(), nav_name, model);
			} else {
				Long r_code = Long.valueOf(code);
				mService.mypage(nav_name, model, r_code);
			}
		}
		
		return "member/mypage";
	}
	
}