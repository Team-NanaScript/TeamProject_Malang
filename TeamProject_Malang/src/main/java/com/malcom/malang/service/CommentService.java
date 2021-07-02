package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.CommentVO;

public interface CommentService extends GenericService<CommentVO, String>{

	public List<CommentVO> findByList(String bd_Seq);

}
