package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.BoardVO;

public interface BoardService extends GenericService<BoardVO, Long>{

	public List<BoardVO> findByTitle(String keyword);
	public List<BoardVO> findByNick(String bd_author);
	public List<BoardVO> findByContent(String keyword);
	
}
