package com.malcom.malang.service;

import java.util.List;

import org.springframework.ui.Model;

import com.malcom.malang.model.CateVO;
import com.malcom.malang.model.ItemVO;

public interface ItemService extends GenericService<ItemVO, String> {
	
	public List<ItemVO> malangOfToday();

	public List<ItemVO> findByTitle(String keyword);
	
	public List<CateVO> selectAllCate();

	public void itemByCategory(String cate, Model model);

	public List<ItemVO> findBySeller(String mb_id);

	
}
