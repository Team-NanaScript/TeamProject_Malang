package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.CartVO;

public interface CartService extends GenericService<CartVO, Long>{

	public List<CartVO> findByBuyerId(String cr_buyerid);
}
