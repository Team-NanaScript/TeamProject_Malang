package com.malcom.malang.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.malcom.malang.config.DateConfig;
import com.malcom.malang.dao.BoardDao;
import com.malcom.malang.model.BoardVO;
import com.malcom.malang.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardServiceImplV1 implements BoardService{

	protected final BoardDao bDao;
	
	@Override
	public List<BoardVO> select() {
		// TODO Auto-generated method stub
		
		List<BoardVO> bdVO = bDao.select();
		
		return bdVO;
	}

	@Override
	public Integer insert(BoardVO vo) {
		// TODO Auto-generated method stub
		
		bDao.insert(vo);
		
		return null;
	}

	@Override
	public Integer update(BoardVO vo) {
		
		
		String sDate = DateConfig.sDate("yyyy-MM-dd");
		vo.setBd_date(sDate);
		
		Integer result = bDao.update(vo);
	
		
		return result;
	}

	@Override
	public Integer delete(String bd_seq) {
		
		Long seq = Long.valueOf(bd_seq);
		Integer result = bDao.delete(seq);
		
		return result;
	}

	@Override
	public BoardVO findById(String bd_seq) {
		// TODO Auto-generated method stub
		
		Long seq = Long.valueOf(bd_seq);
		BoardVO vo = bDao.findBySeq(seq);
		
		return vo;
	}

	
	
}
