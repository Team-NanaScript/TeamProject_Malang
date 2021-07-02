package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.ItemVO;

public interface ItemService extends GenericService<ItemVO, String> {
	
	public List<ItemVO> malangOfToday();
	
}
