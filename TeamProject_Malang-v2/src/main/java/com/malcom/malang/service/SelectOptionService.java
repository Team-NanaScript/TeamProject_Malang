package com.malcom.malang.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.malcom.malang.model.CartVO;
import com.malcom.malang.model.SelectOptionVO;
import com.malcom.malang.model.UserOptionDTO;

public interface SelectOptionService extends GenericService<SelectOptionVO, Long>{

	public List<SelectOptionVO> findByItem(String so_itcode);
	public List<String> findNameByItcode(String so_itcode);
	// public List<SelectOptionVO> findByOptionContent(String so_itcode);
	public List<SelectOptionVO> findByItcodeAndName(String so_itcode, Model model);
	public List<CartVO> settingCart(List<String> optionList,List<CartVO> cartList);
}
