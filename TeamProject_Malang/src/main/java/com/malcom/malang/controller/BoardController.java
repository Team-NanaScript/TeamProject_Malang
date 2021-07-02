package com.malcom.malang.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.BoardVO;
import com.malcom.malang.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class BoardController {
	
	protected final BoardService bService;

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Model model) {
		
		List<BoardVO> bdVO = bService.select();
		model.addAttribute("BD",bdVO);

		return "board/notice";
	}
	
	@RequestMapping(value = "/advice", method = RequestMethod.GET)
	public String advice() {
		
		return "board/advice";
	}
	
	@RequestMapping(value = "/notice/write", method = RequestMethod.GET)
	public String write() {
		
		

		return "write";
	}
	
	@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
	public String write(BoardVO vo) {
		
		Date date = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String sDate = sd.format(date);
		log.debug("치키챠{}",sDate);
		
		vo.setBd_date(sDate);
		bService.insert(vo);

		return "redirect:/notice";
	}
}
