package com.malcom.malang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.model.ReviewVO;

public interface ReviewDao extends GenericDao<ReviewVO, Long>{
	public List<ReviewDTO> selectByWriter(@Param("r_writer") String r_writer);
	public List<ReviewDTO> findByItem(@Param("r_itcode") String r_itcode);
	public ReviewDTO findBySeq(Long r_code);
	
	public Float avgScore(@Param("r_itcode") String r_itcode);
	public Integer countScore(@Param("r_itcode") String r_itcode);
	public List<ReviewDTO> selectWithNickName();

}
