package com.malcom.malang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.malcom.malang.model.TempCartDTO;
import com.malcom.malang.model.TempCartVO;

public interface TempCartDao extends GenericDao<TempCartVO, Long>{
	
	public List<TempCartVO> findByBuyerId
	(@Param("cr_buyerid") String cr_buyerid);

	public List<TempCartDTO> findViewByBuyer(String cr_buyerid);

	public Integer deleteById(@Param("cr_buyerid") String cr_buyerid);
}
