package com.malcom.malang.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.malcom.malang.model.CartListVO;
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
	
//	protected List<CartVO> cartList;
	protected CartListVO cartList;
	
	
	@RequestMapping(value= {"/{itcode}"}, method=RequestMethod.GET)
	public String home(@PathVariable("itcode") String itcode, Model model) {
		// cartList 초기화하기 (관련 method : settingCart)
		cartList = new CartListVO();// new ArrayList<CartVO>();
		cartList.setCartList( new ArrayList<CartVO>());
		
//		itcode = "00000005"; // 수정필요
		
		
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
	
	
	@RequestMapping(value= "/{itcode}", method=RequestMethod.POST)
	public String homePost(@PathVariable("itcode") String itcode, Model model) {
		// log.debug("여기까지 List가 올 수 있을까 {}",cartList.getCartList().toString());// 확인코드
		List<CartVO> cList = cartList.getCartList();
		
		
		return "redirect:/cart";
	}
	

	// RequestBody List<String> index << js에서보낸 Json 객체의 Key값 이름 같아야한대 
	// 받으려는 것이 하나의 List일 경우엔 그냥 그 리스트롤 보내주면 된대...
	@ResponseBody
	@RequestMapping(value= "/cartInsert/{itcode}", method=RequestMethod.POST)
	public String cartInsert(@RequestBody List<String> indexListId,
			@PathVariable("itcode") String itcode,
			Model model, HttpSession hSession) {
		List<CartVO> cList = cartList.getCartList();
		
		log.debug("여기에 과연 index가 넘어올까 {}", indexListId);
		
		// 최종적으로 Cart table에 insert 하기 위한 준비
		List<CartVO> insertCartList = new ArrayList<CartVO>();
		for(int i = 0; i < indexListId.size(); i++) {
			// cartList에 담긴 것들중 
			//	마지막으로 소비자가 선택한 옵션의 index로
			//  정말 구매하고자 하는 옵션 세트들을 새로운 List에 옮겨담음
			Integer index = Integer.valueOf(indexListId.get(i));
			insertCartList.add(cList.get(index));
		}
		
		// 아이디를 위해 Session MEMBER 가져오기
		MemberVO mVO = (MemberVO) hSession.getAttribute("MEMBER");
		// 배송비 가져오기
		ItemVO iVO = iService.findById(itcode);
		for(int i = 0; i < insertCartList.size(); i++) {
			CartVO cartVO = insertCartList.get(i);
			
			// 아이디 셋팅
			cartVO.setCr_buyerid(mVO.getMb_id());
			// 배송비 셋팅
			cartVO.setCr_shippingfee(iVO.getIt_shippingfee());
			// 가격 추가하고 셋팅
			int price = cartVO.getCr_price();
			price += iVO.getIt_price();
			cartVO.setCr_price(price);
			
			cService.insert(cartVO);
		}
		return "OK";
	}
	
	
	@RequestMapping(value= "/cartInsert/{itcode}", method=RequestMethod.POST)
	public String cartSetting(@RequestBody List<String> indexListId,
			@PathVariable("itcode") String itcode,
			Model model, HttpSession hSession) {
		List<CartVO> cList = cartList.getCartList();
		
		// 최종적으로 Cart table에 insert 하기 위한 준비
		List<CartVO> insertCartList = new ArrayList<CartVO>();
		for(int i = 0; i < indexListId.size(); i++) {
			// cartList에 담긴 것들중 
			//	마지막으로 소비자가 선택한 옵션의 index로
			//  정말 구매하고자 하는 옵션 세트들을 새로운 List에 옮겨담음
			Integer index = Integer.valueOf(indexListId.get(i));
			insertCartList.add(cList.get(index));
		}
		
		// 아이디를 위해 Session MEMBER 가져오기
		MemberVO mVO = (MemberVO) hSession.getAttribute("MEMBER");
		// 배송비 가져오기
		ItemVO iVO = iService.findById(itcode);
		for(int i = 0; i < insertCartList.size(); i++) {
			CartVO cartVO = insertCartList.get(i);
			
			// 아이디 셋팅
			cartVO.setCr_buyerid(mVO.getMb_id());
			// 배송비 셋팅
			cartVO.setCr_shippingfee(iVO.getIt_shippingfee());
			// 가격 추가하고 셋팅
			int price = cartVO.getCr_price();
			price += iVO.getIt_price();
			cartVO.setCr_price(price);
			
		}
		
		model.addAttribute("CART_LIST", insertCartList);
		model.addAttribute("MEMBER", mVO);

		return "member/cart_renew";
	}
	
	/*
	 * 
	 * @RequestBody
	 * Jackson-bind를 통해서
	 * JSONString(serialize)로 수신된 데이터를
	 * parsing해서 DTO 에 담아라
	 * 
	 */
	// json 보낼때 encoding 하는 코드 (  produces = "application/json;char=UTF8" )
	// ResponseBody 는 return을 어떤형태로든 josn으로 보낼 수 있다.
	@ResponseBody
	@RequestMapping(value="/option", method=RequestMethod.POST, produces = "application/json;char=UTF8")
	public CartListVO option(@RequestBody UserOptionDTO dto, Model model, HttpSession hSession) {
		
//		log.debug(dto.toString());
		
		int inputSize = dto.getOptions().size(); //  선택된 옵션의 
		int originSize = Integer.valueOf( dto.getSelectBoxSize()); // 선택옵션 
		
		String options = dto.getOptions().toString(); // 확인코드
		
		
		// 선택한 옵션들 리스트
		List<String> optionList = dto.getOptions();
		
		// 모든 옵션을 선택했을 경우
		if(inputSize == originSize) {
			log.debug("0.성공옵션확인 {}", options); // 확인코드
		
			// 선택한 옵션들을 cartVO에 담은 리스트( 구매자, 배송비, 수량 제외 )
			soService.settingCart(optionList, cartList.getCartList());
			log.debug("1. CartVO List 확인{}", cartList.getCartList().toString());
			
			// 총가격 변경하려면 여기서 처리해야함!! 
			
			
			cartList.setFlag("OK");
			return cartList;

		// 옵션중 일부만 선택했을 경우
		} else {
			try {
//				log.debug("0.실패옵션확인 {}", options); // 확인코드
				cartList.setFlag("NO");
			} catch (Exception e) {
				// TODO: handle exception
				log.debug("ERROR");
			}
			return cartList;
		}
		
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
		return "redirect:/item/info/" + it_code;
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
