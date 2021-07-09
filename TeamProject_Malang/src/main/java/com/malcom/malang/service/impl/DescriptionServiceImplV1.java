package com.malcom.malang.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.malcom.malang.dao.DescriptionDao;
import com.malcom.malang.model.DescriptionVO;
import com.malcom.malang.service.DescriptionService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service("descriptionServiceV1")
public class DescriptionServiceImplV1 implements DescriptionService{

	protected final DescriptionDao dDao;
	
	@Override
	public List<DescriptionVO> select() {
		return null;
	}

	@Override
	public Integer insert(DescriptionVO vo) {
		return dDao.insert(vo);
	}

	@Override
	public Integer update(DescriptionVO vo) {
		return dDao.update(vo);
	}

	@Override
	public Integer delete(Long pk) {
		return dDao.delete(pk);
	}

	@Override
	public DescriptionVO findById(Long pk) {
		
		return dDao.findById(pk);
	}

	@Override
	public DescriptionVO findByItem(String itcode) {
		
		return dDao.findByItem(itcode);
	}

}
