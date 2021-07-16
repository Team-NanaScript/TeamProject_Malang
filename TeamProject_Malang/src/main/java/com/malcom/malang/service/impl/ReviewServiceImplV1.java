package com.malcom.malang.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.malcom.malang.config.DateConfig;
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
		
		String sDate = DateConfig.sDate("yyyy-MM-dd");
		String sTime = DateConfig.sTime("hh:mm:ss");
		
		vo.setR_date(sDate);
		vo.setR_time(sTime);
		
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
		ReviewVO vo = rDao.findById(pk);
		
		vo.setR_content(ReplaceBr.enterToBr(vo.getR_content()));
		
		return vo;
	}

	@Override
	public List<ReviewDTO> selectByWriter(String r_writer) {
		
		return rDao.selectByWriter(r_writer);
	}

	@Override
	public List<ReviewDTO> findByItem(String r_itcode) {
		
		return rDao.findByItem(r_itcode);
	}

	public String avgScore(String r_itcode) {
		Float avg = rDao.avgScore(r_itcode);
		String score = "☆☆☆☆☆";
		
		if (avg == null) {
			return score;
		} else if( avg >= 1 && avg < 2 ) {
			score = "★☆☆☆☆";
		} else if( avg >= 2 && avg < 3) {
			score = "★★☆☆☆";
		} else if( avg >= 3 && avg < 4) {
			score = "★★★☆☆";
		} else if( avg >= 4 && avg < 5) {
			score = "★★★★☆";
		} else {
			score = "★★★★★";
		}
			
		return score;
//		return rDao.avgScore(r_itcode); 
	}

	@Override
	public Integer countScore(String r_itcode) {
		
		return rDao.countScore(r_itcode);
	} 

	@Override
	public ReviewDTO findBySeq(Long r_code) { 
		ReviewDTO rDTO = rDao.findBySeq(r_code);
		
		rDTO.setR_content(ReplaceBr.enterToBr(rDTO.getR_content()));
		
		return rDTO;
	}

	@Override
	public List<ReviewDTO> selectWithNickName() {
		return rDao.selectWithNickName();
	}

}
