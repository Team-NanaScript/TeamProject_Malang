package com.malcom.malang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.DescriptionVO;
import com.malcom.malang.model.ItemVO;
import com.malcom.malang.model.OptionVO;
import com.malcom.malang.model.QnaDTO;
import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.service.DescriptionService;
import com.malcom.malang.service.ItemService;
import com.malcom.malang.service.OptionService;
import com.malcom.malang.service.QnaService;
import com.malcom.malang.service.ReviewService;
import com.malcom.malang.service.SelectOptionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/item")
@RequiredArgsConstructor
public class ItemController {
	
	protected final ItemService itService;
	protected final DescriptionService dService;
	protected final QnaService qService;
	protected final ReviewService rService;
	protected final OptionService oService;
	protected final SelectOptionService soService; 

	@RequestMapping(value="/{cate}", method=RequestMethod.GET)
	public String category(@PathVariable("cate") String cate, Model model) {
		if(cate.isBlank() || cate.isEmpty()) {
			return "redirect:/";
		}	
		// cate > sub list setting attribute
		// sub click > ( sub ) category code GET
		// ( sub ) category code request parameter > list setting attribute
		
		itService.itemByCategory(cate, model);
		return "item/category";
	}
	
	@RequestMapping(value = "/review", method=RequestMethod.GET)
	public String review() {
		return "item/review";
	}
	
	@RequestMapping(value = "/search/{keyword}", method=RequestMethod.GET)
	public String review(@PathVariable("keyword") String keyword, Model model) {
//		log.debug("keyword {}", keyword );
		List<ItemVO> itemList = itService.findByTitle(keyword);
		
		model.addAttribute("ITEM_LIST", itemList);
		return "item/search";
	}
	
	@RequestMapping(value = "/infos/{itcode}", method=RequestMethod.GET)
	public String info(@PathVariable("itcode") String itcode, Model model) {
		ItemVO iVO = itService.findById(itcode);
//		log.debug("상품 {}", iVO.toString());
		
		List<OptionVO> oVO = oService.findByItem(itcode);
//		log.debug("상품 옵션 {}", oVO.toString());
		String avgScore = rService.avgScore(itcode);
//		log.debug("평점 : {}",avgScore);
		Integer countScore = rService.countScore(itcode);
//		log.debug("후기 리뷰수 : {}", countScore);
		
		List<String> sOptionName = soService.findByOptionName(itcode);
		soService.findByOptionContent(itcode, model);
		
		DescriptionVO dVO = dService.findByItem(itcode);
		List<QnaDTO> qList = qService.findByItem(itcode);
		List<ReviewDTO> rList = rService.findByItem(itcode);
		
		model.addAttribute("OPTION", oVO);
		model.addAttribute("AVG", avgScore);
		model.addAttribute("COUNT", countScore);
		
		model.addAttribute("SONAME", sOptionName);
		model.addAttribute("ITEM", iVO);
		model.addAttribute("DESC", dVO);
		model.addAttribute("QNAS", qList);
		model.addAttribute("REVIEWS", rList);
		
		return "/item/info";
	}
}
