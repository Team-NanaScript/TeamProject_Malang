package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.model.ReviewVO;

public interface ReviewService extends GenericService<ReviewVO, Long>{
	public List<ReviewDTO> selectByWriter(String r_writer);
	public List<ReviewDTO> findByItem(String r_itcode);
	public String avgScore(String r_itcode);
	public Integer countScore(String r_itcode);
	public List<ReviewDTO> selectWithNickName();
}
