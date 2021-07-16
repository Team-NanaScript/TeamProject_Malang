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
		
		SelectOptionVO soVO = soService.findById(value);
		
		String so_name = soVO.getSo_name();
		String so_content = soVO.getSo_content();
		int so_price = soVO.getSo_price();

		List<SelectOptionVO> soList = new ArrayList<SelectOptionVO>();
		
		for(int i = 0; i < soList.size(); i++) {
			if(so_name == soList.get(i).getSo_name()) {
				SelectOptionVO vo = SelectOptionVO.builder()
						.so_name(so_name)
						.so_content(so_content)
						.so_price(so_price)
						.build();
				soList.add(i, vo);
			}
		}
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
	@ResponseBody
	@RequestMapping(value="/option", method=RequestMethod.POST)
	public String option(@RequestBody UserOptionDTO dto, Model model, HttpSession hSession) {
		
//		log.debug(dto.toString());
		
		int inputSize = dto.getOptions().size(); //  선택된 옵션의 
		int originSize = Integer.valueOf( dto.getSelectBoxSize()); // 선택옵션 
		
//		String options = dto.getOptions().toString(); // 확인코드
		
//		Map<Integer, List<CartVO>> cartMap = new HashMap<Integer, List<CartVO>>();
		
		if(cartList == null) {
//			List<CartVO> cartList = new ArrayList<CartVO>(); 
			cartList = new ArrayList<CartVO>();
		}
		

		
		
		// 선택한 옵션들 리스트
		List<String> optionList = dto.getOptions();
		
//		Integer num = 0;
		if(inputSize == originSize) {
//			log.debug("0.성공옵션확인 {}", options); // 확인코드
		
//			num += 1;
			// 선택한 옵션들을 cartVO에 담은 리스트( 구매자, 배송비, 수량 제외 )
//			cartMap.put(num, soService.settingCart(optionList));
			soService.settingCart(optionList, cartList);
			
			log.debug("1. CartVO Map 확인{}", cartList.toString());
			return "OK";
		} else {
//			log.debug("0.실패옵션확인 {}", options);
			return "NO";
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
