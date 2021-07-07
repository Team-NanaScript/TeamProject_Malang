package com.malcom.malang.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.malcom.malang.dao.SelectOptionDao;
import com.malcom.malang.model.SelectOptionVO;
import com.malcom.malang.service.SelectOptionService;

import lombok.RequiredArgsConstructor;

@Service("SelectOptionServiceV1")
@RequiredArgsConstructor
public class SelectOptionServiceImplV1 implements SelectOptionService{

	protected final SelectOptionDao sDao;
	
	@Override
	public List<SelectOptionVO> select() {
		return sDao.select();
	}

	@Override
	public Integer insert(SelectOptionVO vo) {
		return sDao.insert(vo);
	}

	@Override
	public Integer update(SelectOptionVO vo) {
		return sDao.update(vo);
	}

	@Override
	public Integer delete(Long pk) {
		return sDao.delete(pk);
	}

	@Override
	public SelectOptionVO findById(Long pk) {
		return sDao.findById(pk);
	}

	@Override
	public List<SelectOptionVO> findByItem(String so_itcode) {
		return sDao.findByItem(so_itcode);
	}

}
