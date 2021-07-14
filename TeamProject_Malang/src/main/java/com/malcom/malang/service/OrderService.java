package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.OrderVO;

public interface OrderService extends GenericService<OrderVO, Long>{

	public List<OrderVO> findByBuyerId(String cr_buyerid);
}
