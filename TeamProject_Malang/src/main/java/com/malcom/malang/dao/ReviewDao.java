package com.malcom.malang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.malcom.malang.model.ReviewDTO;
import com.malcom.malang.model.ReviewVO;

@Repository
public interface ReviewDao extends GenericDao<ReviewVO, Long>{
	public List<ReviewDTO> selectByWriter(@Param("r_writer") Long r_writer);
	public List<ReviewDTO> findByItem(@Param("r_itcode") String r_itcode);
}
