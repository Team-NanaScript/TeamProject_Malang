package com.malcom.malang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.malcom.malang.model.DescriptionVO;
import com.malcom.malang.model.ItemVO;
import com.malcom.malang.model.OptionVO;
import com.malcom.malang.model.QnaDTO;
import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.model.SelectOptionVO;
import com.malcom.malang.service.DescriptionService;
import com.malcom.malang.service.ItemService;
import com.malcom.malang.service.OptionService;
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
