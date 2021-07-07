package com.malcom.malang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.malcom.malang.model.OptionVO;

public interface OptionDao extends GenericDao<OptionVO, Long>{
	public List<OptionVO> findByItem(@Param("op_itcode") String op_itcode);
}
