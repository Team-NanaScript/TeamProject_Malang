package com.malcom.malang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.malcom.malang.model.MemberVO;
import com.malcom.malang.model.OrderVO;
import com.malcom.malang.service.CartService;
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
	protected final CartService cService;
	
	@RequestMapping(value={"/",""}, method=RequestMethod.GET)
	public String myPageMain(HttpSession session, Model model) {
		log.debug("마이페이지 메인");
		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null) {
			model.addAttribute("MSG","REJECT");
		} else {
			model.addAttribute("MSG","ADMIT");
			mService.mypage(membervo.getMb_id(), "myorder", model);
		}
		
		return "member/mypage";
	}
	
	@RequestMapping(value="/{nav_name}", method=RequestMethod.GET)
	public String myPage(@PathVariable("nav_name") String nav_name, String code, HttpSession session, Model model) {
		log.debug("내비 카테 {}", nav_name);
		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null) {
			model.addAttribute("MSG","REJECT");
		} else {
			model.addAttribute("MSG","ADMIT");
			if(code == null || code.equals("")) {
				mService.mypage(membervo.getMb_id(), nav_name, model);
			} else if(nav_name == null || nav_name.equals("") ) {
				mService.mypage(membervo.getMb_id(), "myorder", model);
			} else {
				Long r_code = Long.valueOf(code);
				mService.mypage(nav_name, model, r_code);
			}
		}
		
		return "member/mypage";
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String cart(HttpSession session, Model model) {
		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null) {
			model.addAttribute("MSG","REJECT");
		} else {
			model.addAttribute("MSG","ADMIT");
			cService.cartList(membervo.getMb_id(), model);
		}
		return "member/cart_renew";
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.POST)
	public String cartToOrder(OrderVO orderVO, HttpSession session) {
		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		log.debug("넘어온 orderVO {}",orderVO);
		cService.cartToOrder(membervo.getMb_id(), orderVO);
		
		return "redirect:/mypage";
	}
	
	@ResponseBody
	@RequestMapping(value="/cart/delete", method=RequestMethod.GET)
	public String cartDelete(String cr_code, Model model) {
		Long code = Long.valueOf(cr_code);
		
		if(cService.delete(code) < 0) {
			
			return "NO";
		}
		
		return "OK";
	}
	
}