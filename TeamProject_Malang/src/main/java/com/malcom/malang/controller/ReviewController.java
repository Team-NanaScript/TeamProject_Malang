package com.malcom.malang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
@RequestMapping(value = "/review")
public class ReviewController {
	
	protected final ReviewService rService;
	
	@RequestMapping(value = {"/",""}, method=RequestMethod.GET)
	public String home(Model model) {
		
//		List<ReviewDTO> rList = rService.selectWithNickName();
//		for()
//		rList.get(i)
//		
//		List<ReviewDTO> rItemList = rService.findByItem(r_itcode);
//		model.addAttribute("REVIEWS", rList);
		
		return "item/review";
	}

}
