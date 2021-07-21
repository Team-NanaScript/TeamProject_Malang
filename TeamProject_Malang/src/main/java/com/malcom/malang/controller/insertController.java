package com.malcom.malang.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.malcom.malang.model.CateVO;
import com.malcom.malang.model.ItemVO;
import com.malcom.malang.model.SelectOptionVO;
import com.malcom.malang.service.ItemService;
import com.malcom.malang.service.insertService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class insertController {
	
	protected final insertService iService;
	protected final ItemService itService;
	
	@RequestMapping(value="/insert", method = RequestMethod.GET)
	public String insert(Model model) {
		
		List<CateVO> cList = itService.selectAllCate();
		String cateList = "";
		
		ObjectMapper obMapper = new ObjectMapper();
		try {
			cateList = obMapper.writeValueAsString(cList);
		} catch (JsonProcessingException e) {
			
		} 
		
		model.addAttribute("cateList", cateList);
		
		return "/item/insert";
	}
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insert(ItemVO itVO, MultipartFile one_file,
			@RequestParam(name="multi_file", required = false) MultipartHttpServletRequest multi_file) throws IOException { // , @RequestBody Map<String, String> maps) {
		
		
		iService.insert(itVO, one_file, multi_file);
		
		// 나중에 바꿔야함@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@은빈@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		return "redirect:/item/infos/" + itVO.getIt_code();
	}

}
