package com.malcom.malang.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.malcom.malang.model.MemberVO;
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
	
	@RequestMapping(value = {"/",""} , method = RequestMethod.GET)
	public String notice(Model model) {
		
		List<BoardVO> bdList = bService.select();
		model.addAttribute("BDLIST",bdList);

		return "board/notice";
	}
	
	// --------------------- 게시글 삭제/업데이트 ----------------------------------

	private boolean sessionCheck(Long bd_seq, HttpSession httpSession) {
		MemberVO mVO = (MemberVO) httpSession.getAttribute("MEMBER");
		BoardVO bVO = bService.findById(bd_seq);
		int mb_role = mVO.getMb_role();
		String mb_nickname = mVO.getMb_nickname();
		String board_nickname = bVO.getBd_author();
		if(mb_role == 2){
			return false;
		}
		if(httpSession == null || mb_nickname != board_nickname){
			return true;
		}
		return false;
	}
	
	@RequestMapping(value="/view/notice/delete", method=RequestMethod.GET)
	public String nDelete(Long bd_seq, HttpSession httpSession) {

		if (sessionCheck(bd_seq, httpSession)) return "redirect:/";

		bService.delete(bd_seq);
		
		return "redirect:/notice";
	}
	
	@RequestMapping(value="/view/notice/update", method=RequestMethod.GET)
	public String nUpdate(Long bd_seq, Model model, HttpSession httpSession) {

		if (sessionCheck(bd_seq, httpSession)) return "redirect:/";

		BoardVO vo = bService.findById(bd_seq);
		model.addAttribute("CTUP",vo);

		
		return "/board/write";
	}

	@RequestMapping(value="/view/notice/update", method=RequestMethod.POST)
	public String nUpdate(BoardVO vo, Model model, HttpSession httpSession) {

		Long bd_seq = vo.getBd_seq();
		if (sessionCheck(bd_seq, httpSession)) return "redirect:/";

		Integer result = bService.update(vo);
		model.addAttribute("bd_seq", vo.getBd_seq());
	
		
		return "redirect:/notice/view";
	}
	
	// --------------------- 댓글 삭제/업데이트 ----------------------------------
	
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
		model.addAttribute("UP",vo);
		model.addAttribute("bd_seq",vo.getCm_bdseq());
		
		return "redirect:/notice/view";
	}
	
	@RequestMapping(value="/view/comment/update", method=RequestMethod.POST)
	public String cUpdate(CommentVO vo) {
		
		Integer result = cService.update(vo);
		
		return "redirect:/notice";
	}
	
	
	// --------------------- 게시글 작성 ----------------------------------
	
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
	
	// --------------------- 게시글 view / 댓글 작성 method ----------------------------------
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public String view(Long bd_seq, Model model) {
	
		BoardVO vo = bService.findById(bd_seq);
		if(bd_seq != null) {
			
		
			bService.updateCount(bd_seq);
			model.addAttribute("VIEW",vo);
			
		}
		
		
		List<CommentVO> cList = cService.findByList(bd_seq);
		model.addAttribute("COMMENT", cList);
		
		return "/board/view";
	}
	
	@RequestMapping(value="/view", method=RequestMethod.POST)
	public String comment(CommentVO vo, Model model) {
		
		log.debug("댓글 VO {}", vo.toString());

		if(vo.getCm_seq() == null) {
			
			Integer result = cService.insert(vo);
			
			model.addAttribute("bd_seq" , vo.getCm_bdseq());

			return "redirect:/notice/view";
			
		} else {
			cService.update(vo);
			
			model.addAttribute("bd_seq" , vo.getCm_bdseq());
			
			return "redirect:/notice/view";	
		}
	}
	
	
	// --------------------- 검색 method ----------------------------------
	
	@RequestMapping(value="/search/title" , method=RequestMethod.GET)
	public String searchTitle(Model model, String keyword) {
		
		
		List<BoardVO> bdList = bService.findByTitle(keyword);
		model.addAttribute("RESULT", bdList);
		
		
		return "/board/notice";
	}
	
	@RequestMapping(value="/search/content" , method=RequestMethod.GET)
	public String searchContent(Model model, String keyword) {
		
		List<BoardVO> bdList = bService.findByContent(keyword);
		model.addAttribute("RESULT", bdList);
		
		return "/board/notice";
	}
	
	@RequestMapping(value="/search/writer" , method=RequestMethod.GET)
	public String searchWriter(Model model, String keyword) {
		
		List<BoardVO> bdList = bService.findByNick(keyword);
		model.addAttribute("RESULT", bdList);
		
		return "/board/notice";
	}

}
