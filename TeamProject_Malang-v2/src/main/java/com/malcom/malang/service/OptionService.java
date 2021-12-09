package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.OptionVO;

public interface OptionService extends GenericService<OptionVO, Long>{
	public List<OptionVO> findByItem(String op_itcode);
}
