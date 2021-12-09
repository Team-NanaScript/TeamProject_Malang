package com.malcom.malang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.malcom.malang.model.SelectOptionVO;

public interface SelectOptionDao extends GenericDao<SelectOptionVO, Long>{

	public List<SelectOptionVO> findByItem(@Param("so_itcode") String so_itcode);
	public List<String> findNameByItcode(@Param("so_itcode")String so_itcode);
	public List<SelectOptionVO> findByItcodeAndName
		(@Param("so_itcode") String so_itcode,
				@Param("so_name") String so_name);
}
