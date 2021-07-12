package com.malcom.malang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.dao.ReviewDao;
import com.malcom.malang.model.ItemVO;
import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.service.ItemService;
import com.malcom.malang.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
@RequestMapping(value = "/review")
public class ReviewController {
	
	protected final ReviewService rService;
	protected final ReviewDao rDao;
	protected final ItemService iService;
	
	@RequestMapping(value = {"/",""}, method=RequestMethod.GET)
	public String home(Model model) {
		
		
		List<ReviewDTO> rList = rService.selectWithNickName();
		
<<<<<<< HEAD
		log.debug("r리스트임 {}",rList);
		
		List<ItemVO> iList = null;
=======
		List<ItemVO> iList =  new ArrayList<ItemVO>();
>>>>>>> 078cd4fde0f96edab547e4def4c4ce2d7eb11d4e
		Map<String, List<ReviewDTO>> rMaps = new HashMap<>();
		
		for(int i = 0; i < rList.size(); i++) {
			log.debug("ItemName {} ", rList.get(i).toString());
			String itcode = rList.get(i).getR_itcode();
			ItemVO iVO = iService.findById(itcode);
			
			
			iList.add(iVO);
			
			List<ReviewDTO> reviewList = rDao.findByItem(itcode);
			rMaps.put(itcode, reviewList);
		}
		
		model.addAttribute("ITEMS", iList);
		model.addAttribute("REVIEWS", rMaps);
		log.debug("REVIEWS {}", rMaps.toString());
		
		return "item/review";
	}

}
