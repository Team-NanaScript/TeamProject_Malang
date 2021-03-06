package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.QnaDTO;
import com.malcom.malang.model.QnaVO;

public interface QnaService extends GenericService<QnaVO, Long>{
	public List<QnaDTO> selectByWriter(String q_writer);
	public List<QnaDTO> selectByContent(String q_content);
	public List<QnaDTO> findByItem(String q_itcode);
	public QnaDTO findBySeq(Long q_code);
}
