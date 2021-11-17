package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.CommentVO;

public interface CommentService extends GenericService<CommentVO, Long>{

	public List<CommentVO> findByList(Long bd_Seq);

}
