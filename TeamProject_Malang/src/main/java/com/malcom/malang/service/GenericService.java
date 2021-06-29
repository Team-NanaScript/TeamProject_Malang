package com.malcom.malang.service;

import java.util.List;

public interface GenericService<VO, PK> {

	public List<VO> select();
	public VO findById(String PK);
	public Integer insert(VO vo);
	public Integer update(VO vo);
	public Integer delete(String PK);
	
	
}
