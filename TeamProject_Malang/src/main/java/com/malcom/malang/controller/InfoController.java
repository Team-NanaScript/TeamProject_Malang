package com.malcom.malang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.malcom.malang.model.CartVO;
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
import com.malcom.malang.model.UserOptionDTO;
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
	
	protected List<CartVO> cartList;
	
	
	@RequestMapping(value= {"/",""}, method=RequestMethod.GET)
	public String home(String itcode, Model model) {
		// cartList 초기화하기 (관련 method : settingCart)
		cartList = new ArrayList<CartVO>();
		
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
	public String option(@PathVariable("option") Long value, Model model) {
		
		return "오잉";
	}
	
	/*
	 * 
	 * @RequestBody
	 * Jackson-bind를 통해서
	 * JSONString(serialize)로 수신된 데이터를
	 * parsing해서 DTO 에 담아라
	 * 
	 */
//	@ResponseBody
	@RequestMapping(value="/option", method=RequestMethod.POST)
	public String option(@RequestBody UserOptionDTO dto, Model model, HttpSession hSession) {
		
//		log.debug(dto.toString());
		
		int inputSize = dto.getOptions().size(); //  선택된 옵션의 
		int originSize = Integer.valueOf( dto.getSelectBoxSize()); // 선택옵션 
		
//		String options = dto.getOptions().toString(); // 확인코드
		
		
		// 선택한 옵션들 리스트
		List<String> optionList = dto.getOptions();
		
		// 모든 옵션을 선택했을 경우
		if(inputSize == originSize) {
//			log.debug("0.성공옵션확인 {}", options); // 확인코드
		
			// 선택한 옵션들을 cartVO에 담은 리스트( 구매자, 배송비, 수량 제외 )
			soService.settingCart(optionList, cartList);
			log.debug("1. CartVO List 확인{}", cartList.toString());
			
		
			String jsonCartList = "";
			
			ObjectMapper obMapper = new ObjectMapper();
				try {
					// Java 오브젝트로 부터 JSON을 만들고 
					// 이를 문자열 혹은 Byte 배열로 반환한다.
					jsonCartList = obMapper.writeValueAsString(cartList);
				} catch (JsonProcessingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			model.addAttribute("CARTLIST", jsonCartList);
			
			return "OK";
		// 옵션중 일부만 선택했을 경우
		} else {
			return "NO";
//			return "NO";
		}
		
	}
	
//	MemberVO mVO = (MemberVO) hSession.getAttribute("MEMBER");
//	cartVO.setCr_buyerid(mVO.getMb_id());
	
	
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
		// 로그인확인 (만드는동안 일단 비활성화)
//		MemberVO mVO = (MemberVO) hSession.getAttribute("MEMBER"); 
//		if(mVO == null) {
//			return "redirect:/login";
//		}
		
		// 오더 code를 받아서 해당 주문을 VO로 가져옴
		OrderVO orVO = odService.findById(od_code);
		log.debug("orVO : {}", orVO);
		// orderVO 정보 중 itcode 뽑아냄
		String it_code = orVO.getOd_itcode();
		// it_code를 이용해 itemVO 정보 중 title 뽑아냄
		ItemVO itVO = iService.findById(it_code);
		
		

		model.addAttribute("ITEM", itVO);
		model.addAttribute("ORDER", orVO);
		
		
		return "item/review_insert";
	}
	
	@RequestMapping(value="/review/{od_code}", method=RequestMethod.POST)
	public String reviewInsert(@PathVariable("od_code") Long od_code, 
			ReviewVO reviewVO, 
			Model model) {
		
		rService.insert(reviewVO);
		
		return "/item/info";
	}
	
}
