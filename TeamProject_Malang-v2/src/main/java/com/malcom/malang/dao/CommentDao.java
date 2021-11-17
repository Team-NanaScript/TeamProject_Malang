package com.malcom.malang.dao;

import java.util.List;

import com.malcom.malang.model.CommentVO;

public interface CommentDao extends GenericDao<CommentVO, Long>{

	public List<CommentVO> findByList(Long cm_bdseq);
	public Integer findByCount(Long cm_bdseq);
}
