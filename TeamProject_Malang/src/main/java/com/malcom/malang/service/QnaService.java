package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.QnaVO;

public interface QnaService extends GenericService<QnaVO, Long>{
	public List<QnaVO> selectByWriter(Long q_writer);
	public List<QnaVO> selectByContent(String q_content);
}
