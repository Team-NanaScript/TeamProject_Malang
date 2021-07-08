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
		
		String sDate = DateConfig.sDate("yyyy-mm-dd");
		
		vo.setBd_date(sDate);
		
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
	public Integer delete(Long bd_seq) {
		
		Integer result = bDao.delete(bd_seq);
		
		return result;
	}

	@Override
	public BoardVO findById(Long bd_seq) {
		// TODO Auto-generated method stub
		
		BoardVO vo = bDao.findBySeq(bd_seq);
		
		return vo;
	}

	@Override
	public List<BoardVO> findByTitle(String keyword) {
		// TODO Auto-generated method stub
		
		List<BoardVO> bList = bDao.findByTitle(keyword);
		
		return bList;
	}

	@Override
	public List<BoardVO> findByNick(String bd_author) {
		// TODO Auto-generated method stub
		
		List<BoardVO> bList = bDao.findByNick(bd_author);
		
		return bList;
	}

	@Override
	public List<BoardVO> findByContent(String keyword) {
		// TODO Auto-generated method stub
		
		List<BoardVO> bList = bDao.findByContent(keyword);
		
		
		return bList;
	}

	@Override
	public String findByMaxSeq() {
		// TODO Auto-generated method stub
		
		String bd_seq = bDao.findByMaxSeq();
		
		return bd_seq;
	}

	
	
}
