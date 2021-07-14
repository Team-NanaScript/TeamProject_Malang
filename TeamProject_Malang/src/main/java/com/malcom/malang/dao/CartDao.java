package com.malcom.malang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.malcom.malang.model.CartVO;

public interface CartDao extends GenericDao<CartVO, Long>{

	public List<CartVO> findByBuyerId
			(@Param("cr_buyerid") String cr_buyerid);
	
}
