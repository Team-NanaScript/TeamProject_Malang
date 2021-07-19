package com.malcom.malang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.MemberVO;
import com.malcom.malang.model.OrderDTO;
import com.malcom.malang.model.QnaDTO;
import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.service.MemberService;
import com.malcom.malang.service.OrderService;
import com.malcom.malang.service.QnaService;
import com.malcom.malang.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

// 나중에 MemberController로 이동할 TestController

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/mypage")
public class MypageController {

	protected final QnaService qService;
	protected final ReviewService rService;
	protected final OrderService oService;
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
	
	@RequestMapping(value="/myordernono", method=RequestMethod.GET)
	public String myOrderList(HttpSession session, Model model) {
		MemberVO mVO = (MemberVO) session.getAttribute("MEMBER");
		List<OrderDTO> myorder = oService.findByBuyerId(mVO.getMb_id());
		log.debug("주문 목록 {}", myorder);
		model.addAttribute("BODY", "MY_ORDER");
		model.addAttribute("MYORDER", myorder);
		model.addAttribute("HEADER_NAME", "내 주문 목록");
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value="/myqnanono", method=RequestMethod.GET)
	public String myQnaList(HttpSession session, Model model) {
		MemberVO mVO = (MemberVO) session.getAttribute("MEMBER");
		List<QnaDTO> myQna = qService.selectByWriter(mVO.getMb_id());
		model.addAttribute("BODY", "MY_QNA");
		model.addAttribute("MYQNA", myQna);
		model.addAttribute("HEADER_NAME", "내 문의글 보기");
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value="/myreviewnono", method=RequestMethod.GET)
	public String myReviewList(HttpSession session, Model model) {
		MemberVO mVO = (MemberVO) session.getAttribute("MEMBER");
		List<ReviewDTO> myReview = rService.selectByWriter(mVO.getMb_id());
		model.addAttribute("BODY", "MY_REVIEW");
		model.addAttribute("MYREVIEW", myReview);
		model.addAttribute("HEADER_NAME", "내 후기글 보기");
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value="/view_ordernono", method=RequestMethod.GET)
	public String myOrderView(String code, Model model) {
		Long r_code = Long.valueOf(code);
		OrderDTO oDTO = oService.findBySeq(r_code);
		model.addAttribute("BODY", "ORDER_VIEW");
		model.addAttribute("ORDER", oDTO);
		model.addAttribute("HEADER_NAME", "내 주문 목록");
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value="/view_reviewnono", method=RequestMethod.GET)
	public String myReview(String code, Model model) {
		Long r_code = Long.valueOf(code);
		ReviewDTO rDTO = rService.findBySeq(r_code);
//		log.debug("reviewDTO {}", rDTO.toString());
		model.addAttribute("BODY", "REVIEW_VIEW");
		model.addAttribute("REVIEW", rDTO);
		model.addAttribute("HEADER_NAME", "내 후기글 보기");
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value="/view_qnanono", method=RequestMethod.GET)
	public String myQna(String code, Model model) {
		Long q_code = Long.valueOf(code);
		QnaDTO qDTO = qService.findBySeq(q_code);
		
//		log.debug("qnaDTO {}", qDTO.toString());
		
		model.addAttribute("BODY", "QNA_VIEW");
		model.addAttribute("QNA", qDTO);
		model.addAttribute("HEADER_NAME", "내 문의글 보기");
		
		return "redirect:/member/mypage";
	}
}