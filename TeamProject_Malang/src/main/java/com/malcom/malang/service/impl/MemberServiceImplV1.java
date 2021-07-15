package com.malcom.malang.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.malcom.malang.dao.MemberDao;
import com.malcom.malang.model.MemberVO;
import com.malcom.malang.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("memberServiceV1")
@RequiredArgsConstructor
public class MemberServiceImplV1 implements MemberService{
	
	protected final MemberDao mDao;

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
		
		mDao.roleUpdate(mb_id, mb_role);
		
		return 0;
	}




	
	
	

	
	
}
