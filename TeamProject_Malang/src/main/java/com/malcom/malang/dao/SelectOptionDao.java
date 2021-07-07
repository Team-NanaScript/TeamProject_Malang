package com.malcom.malang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.malcom.malang.model.SelectOptionVO;

public interface SelectOptionDao extends GenericDao<SelectOptionVO, Long>{

	public List<SelectOptionVO> findByItem(@Param("so_itcode") String so_itcode);
}
