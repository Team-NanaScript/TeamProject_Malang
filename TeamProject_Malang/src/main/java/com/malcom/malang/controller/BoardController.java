package com.malcom.malang.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.BoardVO;
import com.malcom.malang.model.CommentVO;
import com.malcom.malang.service.BoardService;
import com.malcom.malang.service.CommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class BoardController {
	
	protected final BoardService bService;
	
	protected final CommentService cService;
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Model model) {
		
		List<BoardVO> bdVO = bService.select();
		model.addAttribute("BDLIST",bdVO);

		return "board/notice";
	}
	
	@RequestMapping(value="/notice/view/notice/delete", method=RequestMethod.GET)
	public String nDelete(Long bd_seq) {
		
		bService.delete(bd_seq);
		
		return "redirect:/notice";
	}
	
	@RequestMapping(value="/notice/view/notice/update", method=RequestMethod.GET)
	public String nUpdate(Long bd_seq, Model model) {
		
		BoardVO vo = bService.findById(bd_seq);
		model.addAttribute("CTUP",vo);

		
		return "/board/write";
	}
	
	@RequestMapping(value="/notice/view/notice/update", method=RequestMethod.POST)
	public String nUpdate(BoardVO vo, Model model) {
	
		log.debug("업데이트 {} ", vo);
		
		Integer result = bService.update(vo);
		model.addAttribute("bd_seq", vo.getBd_seq());
	
		
		return "redirect:/notice/view";
	}
	
	@RequestMapping(value="/notice/view/comment/delete", method=RequestMethod.GET)
	public String cDelete(Long cm_seq, Model model) {
		
		CommentVO vo = cService.findById(cm_seq);
		model.addAttribute("bd_seq", vo.getCm_bdseq());
		cService.delete(cm_seq);
		
		
		return "redirect:/notice/view";
	}
	
	@RequestMapping(value="/notice/view/comment/update", method=RequestMethod.GET)
	public String cUpdate(Long cm_seq, Model model) {
		
		CommentVO vo = cService.findById(cm_seq);
		log.debug("ㅇㅇ {}", vo.toString());
		model.addAttribute("UP",vo);
		model.addAttribute("bd_seq",vo.getCm_bdseq());
		
		return "redirect:/notice/view";
	}
	
	@RequestMapping(value="/notice/view/comment/update", method=RequestMethod.POST)
	public String cUpdate(CommentVO vo) {
		
		Integer result = cService.update(vo);
		
		return "redirect:/notice";
	}
	
	
	@RequestMapping(value = "/advice", method = RequestMethod.GET)
	public String advice() {
		
		return "board/advice";
	}
	
	@RequestMapping(value = "/notice/write", method = RequestMethod.GET)
	public String write() {
		
		

		return "board/write";
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
	
	@RequestMapping(value="/notice/view", method = RequestMethod.GET)
	public String view(Long bd_seq, Model model) {
	
		BoardVO vo = bService.findById(bd_seq);
		model.addAttribute("VIEW",vo);
		
		List<CommentVO> cList = cService.findByList(bd_seq);
		model.addAttribute("COMMENT", cList);
		
		return "/board/view";
	}
	
	@RequestMapping(value="/notice/view", method=RequestMethod.POST)
	public String comment(CommentVO vo, Model model) {
		
		Integer result = cService.insert(vo);
		
		model.addAttribute("bd_seq" , vo.getCm_bdseq());
		
//		return "redirect:/notice/view?bd_seq=" + vo.getCm_bdseq();
		return "redirect:/notice/view";
	}
}
