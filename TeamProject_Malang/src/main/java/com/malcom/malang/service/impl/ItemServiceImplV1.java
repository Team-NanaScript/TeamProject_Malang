package com.malcom.malang.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;

import com.malcom.malang.dao.ItemDao;
import com.malcom.malang.model.ItemVO;
import com.malcom.malang.service.ItemService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("itemServiceV1")
public class ItemServiceImplV1 implements ItemService{

	protected final ItemDao itDao;
	
	@Override
	public List<ItemVO> select() {
		List<ItemVO> itemList = itDao.select();
		log.debug(itemList.get(0).toString());
		return itemList;
	}

	public ItemVO findById(String pk) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Integer insert(ItemVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer update(ItemVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer delete(String PK) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ItemVO> malangOfToday() {
		List<ItemVO> allList = this.select();
		
		Random rnd = new Random();
		
		List<ItemVO> todayList = new ArrayList<ItemVO>();
		for(int i = 0; i < 4 ; i++) {
			int tmp = rnd.nextInt(allList.size());
			todayList.add(allList.get(tmp));
			allList.remove(tmp);
		}
		log.debug(todayList.get(0).toString());
		return todayList;
	}

}
