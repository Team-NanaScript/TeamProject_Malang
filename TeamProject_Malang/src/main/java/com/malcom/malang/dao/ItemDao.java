package com.malcom.malang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.malcom.malang.model.ItemVO;

public interface ItemDao extends GenericDao<ItemVO, String> {

	public List<String> categoryMain();
	public List<String> categorySub(@Param("ct_main") String ct_main);
}
