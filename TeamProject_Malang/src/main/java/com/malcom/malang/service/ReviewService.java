package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.ReviewVO;

public interface ReviewService extends GenericService<ReviewVO, Long>{
	public List<ReviewVO> selectByWriter(Long r_writer);
}
