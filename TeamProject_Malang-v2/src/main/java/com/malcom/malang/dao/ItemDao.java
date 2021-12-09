package com.malcom.malang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.malcom.malang.model.CateVO;
import com.malcom.malang.model.ItemVO;

public interface ItemDao extends GenericDao<ItemVO, String> {
	
	public List<ItemVO> findByTitle(@Param("it_title") String it_title);
	public List<ItemVO> selectByCategory(@Param("it_ctcode") String it_ctcode);
	
	// category select
	public List<CateVO> selectCategory();
	public List<String> categoryMain();
	
	public List<CateVO> categorySub(@Param("ct_parentcode") String ct_parentcode);
	
	public List<CateVO> categorySubWithCode(@Param("ct_main") String ct_main);
	public CateVO findCateById(@Param("ct_code")String ct_code);	
	
	public List<ItemVO> findBySeller(String mb_id);
}
