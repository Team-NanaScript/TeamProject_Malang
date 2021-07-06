package com.malcom.malang.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.malcom.malang.dao.ReviewDao;
import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.model.ReviewVO;
import com.malcom.malang.service.ReviewService;

import lombok.RequiredArgsConstructor;

@Service("ReviewServiceV1")
@RequiredArgsConstructor
public class ReviewServiceImplV1 implements ReviewService{
	
	protected final ReviewDao rDao;

	@Override
	public List<ReviewVO> select() {
		
		return rDao.select();
	}

	@Override
	public Integer insert(ReviewVO vo) {
		
		return rDao.insert(vo);
	}

	@Override
	public Integer update(ReviewVO vo) {

		return rDao.update(vo);
	}

	@Override
	public Integer delete(Long pk) {

		return rDao.delete(pk);
	}

	@Override
	public ReviewVO findById(Long pk) {
		
		return rDao.findById(pk);
	}

	@Override
	public List<ReviewDTO> selectByWriter(Long r_writer) {
		
		return rDao.selectByWriter(r_writer);
	}

	@Override
	public List<ReviewDTO> findByItem(String r_itcode) {
		
		return rDao.findByItem(r_itcode);
	}

}
