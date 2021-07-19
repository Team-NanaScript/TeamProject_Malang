package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.OrderDTO;
import com.malcom.malang.model.OrderVO;

public interface OrderService extends GenericService<OrderVO, Long>{

	public List<OrderDTO> findByBuyerId(String cr_buyerid);
}
