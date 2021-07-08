package com.malcom.malang.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.malcom.malang.model.SelectOptionVO;

public interface SelectOptionService extends GenericService<SelectOptionVO, Long>{

	public List<SelectOptionVO> findByItem(String so_itcode);
	public List<SelectOptionVO> findByOptionName(String so_itcode);
	public List<SelectOptionVO> findByOptionContent(String so_itcode, String so_name);
}
