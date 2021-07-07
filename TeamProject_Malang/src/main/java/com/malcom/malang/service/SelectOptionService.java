package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.SelectOptionVO;

public interface SelectOptionService extends GenericService<SelectOptionVO, Long>{

	public List<SelectOptionVO> findByItem(String so_itcode);
}
