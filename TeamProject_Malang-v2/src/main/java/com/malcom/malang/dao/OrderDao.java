package com.malcom.malang.dao;

import java.util.List;

import com.malcom.malang.model.OrderDTO;
import com.malcom.malang.model.OrderVO;

public interface OrderDao extends GenericDao<OrderVO, Long>{

	public List<OrderDTO> findByBuyerId(String buyerid);

	public OrderDTO findBySeq(Long code);

}
