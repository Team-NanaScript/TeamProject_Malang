package com.malcom.malang.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
@RequestMapping(value="/notice")
public class NoticeController {
	
	protected final BoardService bService;
	protected final CommentService cService;
	
	
	private List<BoardVO> subDate(List<BoardVO> bList) {
	
		for(int i = 0 ; i < bList.size() ; i++) {
			String date = bList.get(i).getBd_date().substring(0, 10);
			bList.get(i).setBd_date(date);
		}
		
		return bList;
	}
	
	@RequestMapping(value = {"/",""} , method = RequestMethod.GET)
	public String notice(Model model) {
		
		List<BoardVO> bdVO = bService.select();
		List<BoardVO> bdList = this.subDate(bdVO);
		model.addAttribute("BDLIST",bdList);

		return "board/notice";
	}
	
	@RequestMapping(value="/view/notice/delete", method=RequestMethod.GET)
	public String nDelete(Long bd_seq) {
		
		bService.delete(bd_seq);
		
		return "redirect:/notice";
	}
	
	@RequestMapping(value="/view/notice/update", method=RequestMethod.GET)
	public String nUpdate(Long bd_seq, Model model) {
		
		BoardVO vo = bService.findById(bd_seq);
		model.addAttribute("CTUP",vo);

		
		return "/board/write";
	}
	
	@RequestMapping(value="/view/notice/update", method=RequestMethod.POST)
	public String nUpdate(BoardVO vo, Model model) {
	
		log.debug("업데이트 {} ", vo);
		
		Integer result = bService.update(vo);
		model.addAttribute("bd_seq", vo.getBd_seq());
	
		
		return "redirect:/notice/view";
	}
	
	@RequestMapping(value="/view/comment/delete", method=RequestMethod.GET)
	public String cDelete(Long cm_seq, Model model) {
		
		CommentVO vo = cService.findById(cm_seq);
		model.addAttribute("bd_seq", vo.getCm_bdseq());
		cService.delete(cm_seq);
		
		
		return "redirect:/notice/view";
	}
	
	@RequestMapping(value="/view/comment/update", method=RequestMethod.GET)
	public String cUpdate(Long cm_seq, Model model) {
		
		CommentVO vo = cService.findById(cm_seq);
		log.debug("ㅇㅇ {}", vo.toString());
		model.addAttribute("UP",vo);
		model.addAttribute("bd_seq",vo.getCm_bdseq());
		
		return "redirect:/notice/view";
	}
	
	@RequestMapping(value="/view/comment/update", method=RequestMethod.POST)
	public String cUpdate(CommentVO vo) {
		
		Integer result = cService.update(vo);
		
		return "redirect:/notice";
	}
	
	
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		
		

		return "board/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO vo, Model model) {
		
		bService.insert(vo);
		String bd_seq = bService.findByMaxSeq();
		
		
		model.addAttribute("bd_seq" , bd_seq);
		

		return "redirect:/notice/view";
	}
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public String view(Long bd_seq, Model model) {
	
		BoardVO vo = bService.findById(bd_seq);
		if(bd_seq != null) {
		
			int count = vo.getBd_count() + 1;
			vo.setBd_count(count);
			log.debug("조회수{}",count);
			bService.update(vo);
			model.addAttribute("VIEW",vo);
			
		}
		
		
		List<CommentVO> cList = cService.findByList(bd_seq);
		model.addAttribute("COMMENT", cList);
		
		return "/board/view";
	}
	
	@RequestMapping(value="/view", method=RequestMethod.POST)
	public String comment(CommentVO vo, Model model) {

		
		Integer result = cService.insert(vo);
		
		model.addAttribute("bd_seq" , vo.getCm_bdseq());
		
//		return "redirect:/notice/view?bd_seq=" + vo.getCm_bdseq();
		return "redirect:/notice/view";
	}
	
	
	@RequestMapping(value="/search/title" , method=RequestMethod.GET)
	public String searchTitle(Model model, String keyword) {
		
		
		List<BoardVO> bList = bService.findByTitle(keyword);
		List<BoardVO> bdList = this.subDate(bList);
		model.addAttribute("RESULT", bdList);
		
		
		return "/board/notice";
	}
	
	@RequestMapping(value="/search/content" , method=RequestMethod.GET)
	public String searchContent(Model model, String keyword) {
		
		log.debug("키워드 {}",keyword);
		
		List<BoardVO> bList = bService.findByContent(keyword);
		List<BoardVO> bdList = this.subDate(bList);
		model.addAttribute("RESULT", bdList);
		
		return "/board/notice";
	}

}
