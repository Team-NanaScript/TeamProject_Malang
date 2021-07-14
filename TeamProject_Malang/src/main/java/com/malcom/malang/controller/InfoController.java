package com.malcom.malang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.malcom.malang.model.DescriptionVO;
import com.malcom.malang.model.ItemVO;
import com.malcom.malang.model.MemberVO;
import com.malcom.malang.model.OptionVO;
import com.malcom.malang.model.OrderVO;
import com.malcom.malang.model.QnaDTO;
import com.malcom.malang.model.QnaVO;
import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.model.ReviewVO;
import com.malcom.malang.model.SelectOptionVO;
import com.malcom.malang.service.CartService;
import com.malcom.malang.service.DescriptionService;
import com.malcom.malang.service.ItemService;
import com.malcom.malang.service.OptionService;
import com.malcom.malang.service.OrderService;
import com.malcom.malang.service.QnaService;
import com.malcom.malang.service.ReviewService;
import com.malcom.malang.service.SelectOptionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
@RequestMapping(value="/info")
public class InfoController {

	protected final ItemService iService;
	protected final DescriptionService dService;
	protected final QnaService qService;
	protected final ReviewService rService;
	protected final OptionService oService;
	protected final SelectOptionService soService; 
	protected final CartService cService;
	protected final OrderService odService;
	
	
	@RequestMapping(value= {"/",""}, method=RequestMethod.GET)
	public String home(String itcode, Model model) {
		
		itcode = "00000005"; // 수정필요
		
		ItemVO iVO = iService.findById(itcode);
//		Long decode = iVO.getIt_decode();
		
		
		List<OptionVO> oVO = oService.findByItem(itcode);
		String avgScore = rService.avgScore(itcode);
		Integer countScore = rService.countScore(itcode);
		
		List<String> sOptionName = soService.findByOptionName(itcode);
		//List<SelectOptionVO> sOptionContent = soService.findByOptionContent(itcode);
		soService.findByOptionContent(itcode, model);
		
		DescriptionVO dVO = dService.findByItem(itcode);
		List<QnaDTO> qList = qService.findByItem(itcode);
		List<ReviewDTO> rList = rService.findByItem(itcode);
		
		
		model.addAttribute("OPTION", oVO);
		model.addAttribute("AVG", avgScore);
		model.addAttribute("COUNT", countScore);
		
		model.addAttribute("SONAME", sOptionName);
		//model.addAttribute("SOCONTENT", sOptionContent); service에 넘김
		model.addAttribute("ITEM", iVO);
		model.addAttribute("DESC", dVO);
		model.addAttribute("QNAS", qList);
		model.addAttribute("REVIEWS", rList);
		
		return "/item/info";
	}
	
	@ResponseBody
	@RequestMapping(value="/option", method=RequestMethod.GET)
	public String option(Long value, Model model) {
		
		SelectOptionVO soVO = soService.findById(value);
		
		/*
		soVO.
		soService.
		
		soVO
		*/
		return "오잉";
	}
	
	@RequestMapping(value="/qna/{it_code}", method=RequestMethod.GET)
	public String qnaWrite(@PathVariable("it_code") String it_code, Model model, HttpSession hSession) {
		
		// 로그인확인
		MemberVO mVO = (MemberVO) hSession.getAttribute("MEMBER"); 
		if(mVO == null) {
			return "redirect:/login";
		}
		
		ItemVO itVO = iService.findById(it_code);
		model.addAttribute("ITEM", itVO);
		
		
		return "/item/qna_insert";
	}
	
	@RequestMapping(value="/qna/{it_code}", method=RequestMethod.POST)
	public String qnaInsert(@PathVariable("it_code") String it_code, 
			QnaVO qnaVO,
			Model model) {
		
		// it_code 넣어주기
		qnaVO.setQ_itcode(it_code);
		// 작성 날짜, 시간 넣어주고나서  insert 하기 
		qService.insert(qnaVO);
		
		
		// 여기 은빈언니가 item 합치면 바꿔야할 부분입니다.
		return "redirect:/item/infos/" + it_code;
	}
	
	
	// 일단 화면확인을 위한 임시주소.
	@RequestMapping(value="/review/{od_code}", method=RequestMethod.GET)
	public String reviewWrite(@PathVariable("od_code") Long od_code,
			Model model, HttpSession hSession) {
		// 로그인확인
		MemberVO mVO = (MemberVO) hSession.getAttribute("MEMBER"); 
		if(mVO == null) {
			return "redirect:/login";
		}
		
		// 오더 code를 받아서 해당 주문을 VO로 가져옴
		OrderVO orVO = odService.findById(od_code);
//		// orderVO 정보 중 option 뽑아냄
//		String od_option = orVO.getOd_option();
		// orderVO 정보 중 itcode 뽑아냄
		String it_code = orVO.getOd_itcode();
		// it_code를 이용해 itemVO 정보 중 title 뽑아냄
		ItemVO itVO = iService.findById(it_code);
		
		
		

		model.addAttribute("ITEM", itVO);
		model.addAttribute("ORDER", orVO);
		
		
		return "item/review_insert";
	}
	
	@RequestMapping(value="/review/{it_code}", method=RequestMethod.POST)
	public String reviewInsert(@PathVariable("it_code") String it_code, 
			ReviewVO reviewVO, 
			Model model) {
		
		
		return "redirect:/user";
	}
	
	
	// 사용안함 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	public String backup_home(String itcode, Model model) {
		
		itcode = "00000005"; // 수정필요
		
		ItemVO iVO = iService.findById(itcode);
//		Long decode = iVO.getIt_decode();
		
		
		List<OptionVO> oVO = oService.findByItem(itcode);
		String avgScore = rService.avgScore(itcode);
		Integer countScore = rService.countScore(itcode);

		DescriptionVO dVO = dService.findByItem(itcode);
		List<QnaDTO> qList = qService.findByItem(itcode);
		List<ReviewDTO> rList = rService.findByItem(itcode);
		
		
		model.addAttribute("OPTION", oVO);
		model.addAttribute("AVG", avgScore);
		model.addAttribute("COUNT", countScore);
		
		model.addAttribute("ITEM", iVO);
		model.addAttribute("DESC", dVO);
		model.addAttribute("QNAS", qList);
		model.addAttribute("REVIEWS", rList);
		
		// 카테고리 옵션
			// 이름만
		List<String> soName = soService.findByOptionName(itcode);
		model.addAttribute("SONAME", soName);
		
			// Json 으로 전부
		String soJson = soService.selectJson(itcode);
		model.addAttribute("SOJSON", soJson);
		
		
		return "/item/info";
	}
}
