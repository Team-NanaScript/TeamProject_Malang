package com.malcom.malang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.malcom.malang.model.MemberVO;
import com.malcom.malang.model.QnaDTO;
import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.service.QnaService;
import com.malcom.malang.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

// 나중에 MemberController로 이동할 TestController
@Slf4j
@Controller
@RequiredArgsConstructor
public class MypageController {

	protected final QnaService qService;
	protected final ReviewService rService;
	
	@RequestMapping(value="/myqna")
	public String myQnaList(HttpSession session, Model model) {
		MemberVO mVO = (MemberVO) session.getAttribute("MEMBER");
		List<QnaDTO> myQna = qService.selectByWriter(mVO.getMb_id());
		model.addAttribute("MYQNA", myQna);
		
		return "member/myqna";
	}
	
	@RequestMapping(value="/myreview")
	public String myReviewList(HttpSession session, Model model) {
		MemberVO mVO = (MemberVO) session.getAttribute("MEMBER");
		List<ReviewDTO> myReview = rService.selectByWriter(mVO.getMb_id());
		model.addAttribute("MYREVIEW", myReview);
		
		return "member/myreview";
	}
	
	@RequestMapping(value="/view_review")
	public String myReview(String code, Model model) {
		Long r_code = Long.valueOf(code);
		ReviewDTO rDTO = rService.findBySeq(r_code);
		
		model.addAttribute("REVIEW", rDTO);
		
		return "member/myreview_view";
	}
	
	@RequestMapping(value="/view_qna")
	public String myQna(String code, Model model) {
		Long q_code = Long.valueOf(code);
		QnaDTO qDTO = qService.findBySeq(q_code);
		
		model.addAttribute("QNA", qDTO);
		
		return "member/myqna_view";
	}
}
