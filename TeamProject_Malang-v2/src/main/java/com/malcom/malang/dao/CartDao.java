package com.malcom.malang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.malcom.malang.model.CartDTO;
import com.malcom.malang.model.CartVO;

public interface CartDao extends GenericDao<CartVO, Long>{

	public List<CartVO> findByBuyerId
			(@Param("cr_buyerid") String cr_buyerid);

	public List<CartDTO> findViewByBuyer(String cr_buyerid);
	
	public Integer sumItemPrice(String cr_buyerid);
	public Integer sumShippingfee(String cr_buyerid);
	
	public int deleteAll(String cr_buyerid);
}
