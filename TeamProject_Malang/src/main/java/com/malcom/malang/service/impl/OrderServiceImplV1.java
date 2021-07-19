package com.malcom.malang.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.malcom.malang.dao.OrderDao;
import com.malcom.malang.model.OrderDTO;
import com.malcom.malang.model.OrderVO;
import com.malcom.malang.service.OrderService;

import lombok.RequiredArgsConstructor;

@Service("orderServiceV1")
@RequiredArgsConstructor
public class OrderServiceImplV1 implements OrderService{

	protected final OrderDao oDao;
	
	@Override
	public List<OrderVO> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer insert(OrderVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer update(OrderVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer delete(Long pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderVO findById(Long pk) {
		// TODO Auto-generated method stub
		return oDao.findById(pk);
	}

	@Override
	public List<OrderDTO> findByBuyerId(String buyerid) {
		// TODO Auto-generated method stub
		return oDao.findByBuyer(buyerid);
	}

}
