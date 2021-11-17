package com.malcom.malang.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.malcom.malang.config.DateConfig;
import com.malcom.malang.dao.CartDao;
import com.malcom.malang.dao.OrderDao;
import com.malcom.malang.model.CartDTO;
import com.malcom.malang.model.CartVO;
import com.malcom.malang.model.OrderVO;
import com.malcom.malang.service.CartService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class CartServiceImplV1 implements CartService{

	protected final CartDao cDao;
	protected final OrderDao oDao;
	
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

	@Override
	public List<CartDTO> findViewByBuyer(String cr_buyerid) {
		// TODO Auto-generated method stub
		return cDao.findViewByBuyer(cr_buyerid);
	}

	@Override
	public void cartList(String mb_id, Model model) {
		List<CartDTO> cList = cDao.findViewByBuyer(mb_id);
		int itemPrice = 0;
		int shippingPrice = 0;
		int totalPrice = 0;
		if(cList.size() > 0) {
			itemPrice = cDao.sumItemPrice(mb_id);
			shippingPrice = cDao.sumShippingfee(mb_id);
			totalPrice = itemPrice + shippingPrice;
		}
		model.addAttribute("itemPrice", itemPrice);
		model.addAttribute("shippingPrice", shippingPrice);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("CART_LIST",cList);
	}

	@Override
	public void cartToOrder(String mb_id, OrderVO orderVO) {
		List<CartDTO> cList = cDao.findViewByBuyer(mb_id);
		String anum = orderVO.getOd_anum();
		String addr = orderVO.getOd_addr();
		
		String sDate = DateConfig.sDate("yyyy-MM-dd");
		for(CartDTO cart : cList ) {
			OrderVO insertVO = new OrderVO().builder().od_buyerid(mb_id)
					.od_itcode(cart.getCr_itcode()).od_option(cart.getCr_option())
					.od_price(cart.getCr_price()).od_anum(anum).od_addr(addr)
					.od_paydate(sDate).od_orderdate(sDate).build();
			oDao.insert(insertVO);
		}
		
		cDao.deleteAll(mb_id);
	}

}
