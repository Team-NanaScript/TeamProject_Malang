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

	@Override
	public Integer avgScore(String r_itcode) {
		Float avg = rDao.avgScore(r_itcode);
		int score = 0;
		if( avg >= 1 && avg < 2 ) {
			score = 1;
		} else if( avg >= 2 && avg < 3) {
			score = 2;
		} else if( avg >= 3 && avg < 4) {
			score = 3;
		} else if( avg >= 4 && avg < 5) {
			score = 4;
		} else {
			score = 5;
		}
			
		return score;
//		return rDao.avgScore(r_itcode); 
	}

	@Override
	public Integer countScore(String r_itcode) {
		
		return rDao.countScore(r_itcode);
	}
}
