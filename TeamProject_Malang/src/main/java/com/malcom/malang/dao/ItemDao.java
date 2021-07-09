package com.malcom.malang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.malcom.malang.model.CateVO;
import com.malcom.malang.model.ItemVO;

public interface ItemDao extends GenericDao<ItemVO, String> {

	// category select
	public List<CateVO> selectCategory();
	public List<String> categoryMain();
	public List<String> categorySub(@Param("ct_main") String ct_main);
	
	public List<CateVO> categorySubWithCode(@Param("ct_main") String ct_main);
	public List<ItemVO> selectByCategory(@Param("it_ctcode") String it_ctcode);
}
