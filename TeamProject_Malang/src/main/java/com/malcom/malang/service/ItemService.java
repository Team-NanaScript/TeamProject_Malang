package com.malcom.malang.service;

import java.util.List;

import org.springframework.ui.Model;

import com.malcom.malang.model.ItemVO;

public interface ItemService extends GenericService<ItemVO, String> {
	
	public List<ItemVO> malangOfToday();
	
	public String categoryList(Model model);

	public void itemByCategory(String cate, Model model);
}
