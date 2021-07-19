package com.malcom.malang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.MemberVO;
import com.malcom.malang.model.OrderDTO;
import com.malcom.malang.model.QnaDTO;
import com.malcom.malang.model.ReviewDTO;
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
	
	@RequestMapping(value={"/",""}, method=RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {
		return "member/mypage";
	}
	
	@RequestMapping(value="/myorder", method=RequestMethod.GET)
	public String myOrderList(HttpSession session, Model model) {
		MemberVO mVO = (MemberVO) session.getAttribute("MEMBER");
		List<OrderDTO> myorder = oService.findByBuyerId(mVO.getMb_id());
		model.addAttribute("BODY", "MY_ORDER");
		model.addAttribute("MYORDER", myorder);
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value="/myqna", method=RequestMethod.GET)
	public String myQnaList(HttpSession session, Model model) {
		MemberVO mVO = (MemberVO) session.getAttribute("MEMBER");
		List<QnaDTO> myQna = qService.selectByWriter(mVO.getMb_id());
		model.addAttribute("BODY", "MY_QNA");
		model.addAttribute("MYQNA", myQna);
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value="/myreview", method=RequestMethod.GET)
	public String myReviewList(HttpSession session, Model model) {
		MemberVO mVO = (MemberVO) session.getAttribute("MEMBER");
		List<ReviewDTO> myReview = rService.selectByWriter(mVO.getMb_id());
		model.addAttribute("BODY", "MY_REVIEW");
		model.addAttribute("MYREVIEW", myReview);
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value="/view_review", method=RequestMethod.GET)
	public String myReview(String code, Model model) {
		Long r_code = Long.valueOf(code);
		ReviewDTO rDTO = rService.findBySeq(r_code);
//		log.debug("reviewDTO {}", rDTO.toString());
		model.addAttribute("BODY", "REVIEW_VIEW");
		model.addAttribute("REVIEW", rDTO);
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value="/view_qna", method=RequestMethod.GET)
	public String myQna(String code, Model model) {
		Long q_code = Long.valueOf(code);
		QnaDTO qDTO = qService.findBySeq(q_code);
		
//		log.debug("qnaDTO {}", qDTO.toString());
		
		model.addAttribute("BODY", "QNA_VIEW");
		model.addAttribute("QNA", qDTO);
		
		return "redirect:/member/mypage";
	}
}