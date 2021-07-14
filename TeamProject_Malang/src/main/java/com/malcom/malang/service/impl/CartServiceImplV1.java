package com.malcom.malang.service.impl;

import java.util.List;

import com.malcom.malang.dao.CartDao;
import com.malcom.malang.model.CartVO;
import com.malcom.malang.service.CartService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
public class CartServiceImplV1 implements CartService{

	protected final CartDao cDao;
	
	@Override
	public List<CartVO> select() {
		// TODO Auto-generated method stub
		return cDao.select();
	}

	@Override
	public Integer insert(CartVO vo) {
		// TODO Auto-generated method stub
		return cDao.insert(vo);
	}

	@Override
	public Integer update(CartVO vo) {
		// TODO Auto-generated method stub
		return cDao.update(vo);
	}

	@Override
	public Integer delete(Long pk) {
		// TODO Auto-generated method stub
		return cDao.delete(pk);
	}

	@Override
	public CartVO findById(Long pk) {
		// TODO Auto-generated method stub
		return cDao.findById(pk);
	}

	@Override
	public List<CartVO> findByBuyerId(String cr_buyerid) {
		// TODO Auto-generated method stub
		return cDao.findByBuyerId(cr_buyerid);
	}

}
