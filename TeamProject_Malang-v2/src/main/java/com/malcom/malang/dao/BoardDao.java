package com.malcom.malang.dao;

import java.util.List;

import com.malcom.malang.model.BoardVO;

public interface BoardDao extends GenericDao<BoardVO, Long>{
	
	public String findByMaxSeq();
	public BoardVO findBySeq(Long seq);
	public int updateCount(Long seq);
	
	public List<BoardVO> findByTitle(String keyword);
	public List<BoardVO> findByNick(String keyword);
	public List<BoardVO> findByContent(String keyword);
	
}
