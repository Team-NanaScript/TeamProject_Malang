package com.malcom.malang.dao;

import com.malcom.malang.model.BoardVO;

public interface BoardDao extends GenericDao<BoardVO, String>{

	public BoardVO findBySeq(Long seq);
	
}
