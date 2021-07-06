package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.model.ReviewVO;

public interface ReviewService extends GenericService<ReviewVO, Long>{
	public List<ReviewDTO> selectByWriter(Long r_writer);
	public List<ReviewDTO> findByItem(String r_itcode);
}