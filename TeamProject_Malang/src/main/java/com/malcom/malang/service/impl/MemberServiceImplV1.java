package com.malcom.malang.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.malcom.malang.dao.MemberDao;
import com.malcom.malang.model.MemberVO;
import com.malcom.malang.service.MemberService;

import lombok.RequiredArgsConstructor;

@Service("memberServiceV1")
@RequiredArgsConstructor
public class MemberServiceImplV1 implements MemberService{
	
	protected final MemberDao mDao;

	@Override
	public List<MemberVO> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO findById(String PK) {
		// TODO Auto-generated method stub
		return null;
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
		return null;
	}

	@Override
	public Integer delete(String PK) {
		// TODO Auto-generated method stub
		return null;
	}

	

	
	
}
