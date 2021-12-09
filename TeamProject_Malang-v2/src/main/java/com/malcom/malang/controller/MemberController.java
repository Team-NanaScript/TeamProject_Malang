package com.malcom.malang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.malcom.malang.model.ItemVO;
import com.malcom.malang.model.MemberVO;
import com.malcom.malang.service.ItemService;
import com.malcom.malang.service.MemberService;
import com.malcom.malang.service.TempCartService;
import com.malcom.malang.service.insertService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class MemberController {
	
	protected final MemberService mService;
	protected final insertService iServce;
	protected final ItemService itService;
	protected final TempCartService tcService;
	

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession hSession) {
		
		// logout 하기전에 해당 아이디의 tempCart를 비워준다.
		MemberVO mVO = (MemberVO) hSession.getAttribute("MEMBER");
		tcService.deleteById(mVO.getMb_id());
		
		hSession.removeAttribute("MEMBER");
		hSession = null;
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String mb_id, String mb_pw, HttpSession httpSession, Model model) {
		
		log.debug(mb_id, mb_pw);
		MemberVO mVO = mService.findByUser(mb_id, mb_pw);
		if(mVO == null) {
			
			model.addAttribute("MSG","아이디/비밀번호를 확인해주세요");
			return "member/login";
		}
		
		
		httpSession.setAttribute("MEMBER", mVO);
		return "/member/mypage";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		
		return "member/join";
	}
	
	// String mb_id, String mb_pw, String mb_name
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(MemberVO vo) {
		
		
		mService.insert(vo);
		
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="/role_update", method=RequestMethod.GET)
	public String update(String id, String role) {
		
		
		
		int mb_role = Integer.valueOf(role);
		int res = mService.roleUpdate(id, mb_role);
		log.debug("RESULT 값 {} ",res);
		
		if(0 < res) {
			return "OK";
		}
		
		return "FAIL";
	}
	
//	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
//	public String mypage(HttpSession session, Model model) {
//		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
//		if(membervo == null) {
//			model.addAttribute("MSG","REJECT");
//		} else {
//			model.addAttribute("MSG", "ADMIT");
//		}
//		return "member/mypage";
//	}
	
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String myinfo(HttpSession session, Model model) {
		/*MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null) {
			model.addAttribute("MSG","REJECT");
		} else {
			model.addAttribute("MSG", "ADMIT");
		}*/
		return "member/myinfo";
	}
	
	@RequestMapping(value = "/cartlater", method = RequestMethod.GET)
	public String cart(HttpSession session, Model model) {
		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null) {
			model.addAttribute("MSG","REJECT");
		} else {
			model.addAttribute("MSG", "ADMIT");
		}
		return "member/cart";
	}
	
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String adminManage(HttpSession session, Model model) {
		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null || membervo.getMb_role() < 2) {
			model.addAttribute("MSG","REJECT");
		} else {
			model.addAttribute("MSG","ADMIT");
			mService.adminManage(model);
		}
		
		return "member/manage";
	}
	
	@RequestMapping(value = "/seller", method = RequestMethod.GET)
	public String seller(HttpSession session, Model model) {
		log.debug("판매자 main");
		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null || membervo.getMb_role() < 1) {
			model.addAttribute("MSG","REJECT");
		} else {
			model.addAttribute("MSG","ADMIT");
			mService.seller("itemList", membervo.getMb_id(), model);
		}
		
		return "member/seller";
	}
	
	@RequestMapping(value = "/seller/{nav_name}", method = RequestMethod.GET)
	public String seller(@PathVariable("nav_name") String nav_name, HttpSession session,
			Model model) {
		log.debug("여기가 아닌가 {}", nav_name);
		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null || membervo.getMb_role() < 1) {
			model.addAttribute("MSG","REJECT");
		} else {
			model.addAttribute("MSG","ADMIT");
			if(nav_name == null || nav_name.equals(""))
				nav_name = "itemList" ;
			mService.seller(nav_name, membervo.getMb_id(), model);
		}
		
		return "member/seller";
	}
	
	@ResponseBody
	@RequestMapping(value="/mypage/items/delete", method=RequestMethod.GET)
	public String itemList(String it_code) {
		
		log.debug("상품번호 {} ",it_code);
		int result = itService.delete(it_code);
		
		if(result < 0) {
			
			return "NO";
		}
		
		return "OK";
	}
	
}
