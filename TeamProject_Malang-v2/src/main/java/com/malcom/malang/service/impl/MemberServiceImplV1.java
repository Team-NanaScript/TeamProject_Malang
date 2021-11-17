package com.malcom.malang.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.malcom.malang.dao.ItemDao;
import com.malcom.malang.dao.MemberDao;
import com.malcom.malang.model.ItemVO;
import com.malcom.malang.model.MemberVO;
import com.malcom.malang.model.OrderDTO;
import com.malcom.malang.model.QnaDTO;
import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.service.MemberService;
import com.malcom.malang.service.OrderService;
import com.malcom.malang.service.QnaService;
import com.malcom.malang.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("memberServiceV1")
@RequiredArgsConstructor
public class MemberServiceImplV1 implements MemberService{
	
	protected final OrderService oService;
	protected final QnaService qService;
	protected final ReviewService rService;
	protected final MemberDao mDao;
	protected final ItemDao iDao;

	@Override
	public List<MemberVO> select() {
		// TODO Auto-generated method stub
		
		List<MemberVO> mList = mDao.select();
		
		return mList;
	}

	@Override
	public MemberVO findByUser(String mb_id, String mb_pw) {
		// TODO Auto-generated method stub
		
		MemberVO mVO = mDao.findById(mb_id, mb_pw);
		
		if(mVO == null) {
			
			return null;
		} 
		
		return mVO;
	}



	@Override
	public Integer insert(MemberVO vo) {
		// TODO Auto-generated method stub
		
		mDao.insert(vo);
		
		return null;
	}

	@Override
	public Integer update(MemberVO vo) {
		// TODO Auto-generated method stub
		
		
		return mDao.update(vo);
	}

	@Override
	public Integer delete(String PK) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO findById(String PK) {
		// TODO Auto-generated method stub
		
		MemberVO mVO = mDao.findById(PK); 
		
		return mVO;
	}

	@Override
	public void adminManage(Model model) {
		// TODO Auto-generated method stub
		List<MemberVO> mListAll = mDao.select();
		List<MemberVO> mList = new ArrayList<MemberVO>();
		for(MemberVO mVO : mListAll) {
			if(mVO.getMb_role() == 2 ) {
				continue;
			}
			mList.add(mVO);
		}
		log.debug("회원 리스트 {}", mList.toString());
		model.addAttribute("MLIST",mList);
	}

	@Override
	public int roleUpdate(String mb_id, int mb_role) {
		// TODO Auto-generated method stub
		
		
		
		return mDao.roleUpdate(mb_id, mb_role);
	}

	@Override
	public void mypage(String memberId, String nav_name, Model model) {
		if(nav_name.equals("myorder")) {
			List<OrderDTO> myorder = oService.findByBuyerId(memberId);
//			log.debug("주문 목록 {}", myorder);
			model.addAttribute("BODY", "MY_ORDER");
			model.addAttribute("MYORDER", myorder);
			model.addAttribute("HEADER_NAME", "내 주문 목록");
		} else if(nav_name.equals("myqna")) {
			List<QnaDTO> myQna = qService.selectByWriter(memberId);
			model.addAttribute("BODY", "MY_QNA");
			model.addAttribute("MYQNA", myQna);
			model.addAttribute("HEADER_NAME", "내 문의글 보기");
		} else if(nav_name.equals("myreview")) {
			List<ReviewDTO> myReview = rService.selectByWriter(memberId);
			model.addAttribute("BODY", "MY_REVIEW");
			model.addAttribute("MYREVIEW", myReview);
			model.addAttribute("HEADER_NAME", "내 후기글 보기");
		}
	}

	@Override
	public void mypage(String nav_name, Model model, Long r_code) {
		if(nav_name.equals("view_order")) {
			OrderDTO oDTO = oService.findBySeq(r_code);
			model.addAttribute("BODY", "ORDER_VIEW");
			model.addAttribute("ORDER", oDTO);
			model.addAttribute("HEADER_NAME", "내 주문 목록");
		} else if(nav_name.equals("view_review")) {
			ReviewDTO rDTO = rService.findBySeq(r_code);
			model.addAttribute("BODY", "REVIEW_VIEW");
			model.addAttribute("REVIEW", rDTO);
			model.addAttribute("HEADER_NAME", "내 후기글 보기");
		} else if(nav_name.equals("view_qna")) {
			QnaDTO qDTO = qService.findBySeq(r_code);
			model.addAttribute("BODY", "QNA_VIEW");
			model.addAttribute("QNA", qDTO);
			model.addAttribute("HEADER_NAME", "내 문의글 보기");
		}
		
	}

	@Override
	public void seller(String nav_name, String mb_id, Model model) {
		if(nav_name.equals("itemList")) {
			List<ItemVO> itList = iDao.findBySeller(mb_id);
			model.addAttribute("BODY", "ITEM_LIST");
			model.addAttribute("ITLIST",itList);
		} else if(nav_name.equals("itemInsert")) {
			model.addAttribute("BODY", "ITEM_INSERT");
		}
	}
	
}
