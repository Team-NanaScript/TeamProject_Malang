package com.malcom.malang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.malcom.malang.model.QnaDTO;
import com.malcom.malang.model.QnaVO;

@Repository
public interface QnaDao extends GenericDao<QnaVO, Long>{

	public List<QnaDTO> selectByWriter(@Param("q_writer") String q_writer);
	public List<QnaDTO> selectByContent(@Param("q_content") String q_content);
	public List<QnaDTO> findByItem(@Param("q_itcode") String q_itcode);
	public QnaDTO findBySeq(Long q_code);
}
