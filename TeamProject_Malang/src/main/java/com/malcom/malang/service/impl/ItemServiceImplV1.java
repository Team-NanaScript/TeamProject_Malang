package com.malcom.malang.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.malcom.malang.dao.ItemDao;
import com.malcom.malang.model.CateVO;
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
//		log.debug(itemList.get(0).toString());
		return itemList;
	}

	public ItemVO findById(String pk) {
		ItemVO itemVO = itDao.findById(pk);
		itemVO.setIt_content(ReplaceBr.enterToBr(itemVO.getIt_content()));
			
		return itemVO;
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
		return todayList;
	}

	@Override
	public String categoryList(Model model) {
		List<String> ct_main = itDao.categoryMain();
		List<String> ct_sub = itDao.categorySub(ct_main.get(0));
		return null;
	}

	@Override
	public void itemByCategory(String cate, String sub, Model model) {
		// 대분류 세팅, 소분류 리스트 세팅, 아이템 리스트 세팅
		List<CateVO> category = itDao.categorySubWithCode(cate);
		model.addAttribute("CATE_MAIN",category.get(0).getCt_main());
		model.addAttribute("CATE_SUB", category);
		List<ItemVO> itemList = new ArrayList<ItemVO>();
		if(sub == null) {
			itemList = itDao.selectByCategory(category.get(0).getCt_code());
		} else {
			itemList = itDao.selectByCategory(sub);
		}
		model.addAttribute("ITEM_LIST", itemList);
	}

	@Override
	public List<ItemVO> findByTitle(String keyword) {
		// item list by search keyword
		return itDao.findByTitle(keyword);
	}

	@Override
	public List<CateVO> selectAllCate() {
		return itDao.selectCategory();
	}

}
