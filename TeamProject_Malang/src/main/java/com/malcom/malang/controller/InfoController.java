package com.malcom.malang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.QnaVO;
import com.malcom.malang.model.ReviewVO;
import com.malcom.malang.service.QnaService;
import com.malcom.malang.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
@RequestMapping(value="/info")
public class InfoController {

	protected final QnaService qService;
	protected final ReviewService rService;
	
	@RequestMapping(value= {"/",""}, method=RequestMethod.GET)
	public String home(Model model) {
		
		List<QnaVO> qList = qService.select();
		List<ReviewVO> rList = rService.select();
		
		model.addAttribute("QNAS", qList);
		model.addAttribute("REVIEWS", rList);
		
		return "/item/info";
	}
}
