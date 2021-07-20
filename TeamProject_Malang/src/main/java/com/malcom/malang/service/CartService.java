package com.malcom.malang.service;

import java.util.List;

import org.springframework.ui.Model;

import com.malcom.malang.model.CartDTO;
import com.malcom.malang.model.CartVO;

public interface CartService extends GenericService<CartVO, Long>{

	public List<CartVO> findByBuyerId(String cr_buyerid);
	public List<CartDTO> findViewByBuyer(String cr_buyerid);
	public void cartList(String mb_id, Model model);
	public void cartToOrder(String mb_id);
}
