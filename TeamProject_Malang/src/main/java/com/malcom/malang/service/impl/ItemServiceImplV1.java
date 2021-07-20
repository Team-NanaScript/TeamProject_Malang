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
		return itDao.delete(PK);
	}

	@Override
	public List<ItemVO> malangOfToday() {
		List<ItemVO> allList = this.select();
		
		int iSize = allList.size();
		
		if(iSize < 4) {
			return null;
		}
		
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
	public List<ItemVO> findByTitle(String keyword) {
		// item list by search keyword
		return itDao.findByTitle(keyword);
	}

	@Override
	public void itemByCategory(String cate, Model model) {
		// 대분류는 tier 0, 소분류는 1
		CateVO vo = itDao.findCateById(cate);
		List<CateVO> subList = new ArrayList<CateVO>();
		if(vo.getCt_tier().equals("0")) {
			// 대분류 클릭
			subList = itDao.categorySub(cate);
			cate = subList.get(0).getCt_code();
			
		} else  if (vo.getCt_tier().equals("1")) {
			// 소분류 클릭
			vo = itDao.findCateById(vo.getCt_parentcode());
			
			subList = itDao.categorySub(vo.getCt_code());
		}
		
		model.addAttribute("CATE_MAIN",  vo.getCt_name());
		
		model.addAttribute("CATE_SUB", subList);
		List<ItemVO> itemList = itDao.selectByCategory(cate);
		model.addAttribute("ITEM_LIST", itemList);
	}

	@Override
	public List<CateVO> selectAllCate() {
		return itDao.selectCategory();
	}

	@Override
	public List<ItemVO> findBySeller(String mb_id) {
		// TODO Auto-generated method stub
		
		List<ItemVO> itList = itDao.findBySeller(mb_id);
		
		return itList;
	}

}
