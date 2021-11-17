package com.malcom.malang.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.malcom.malang.dao.OptionDao;
import com.malcom.malang.model.OptionVO;
import com.malcom.malang.service.OptionService;

import lombok.RequiredArgsConstructor;

@Service("OptionServiceV1")
@RequiredArgsConstructor
public class OptionServiceImplV1 implements OptionService{
	
	protected final OptionDao oDao;

	@Override
	public List<OptionVO> select() {
		return oDao.select();
	}

	@Override
	public Integer insert(OptionVO vo) {
		return oDao.insert(vo);
	}

	@Override
	public Integer update(OptionVO vo) {
		return oDao.update(vo);
	}

	@Override
	public Integer delete(Long pk) {
		return oDao.delete(pk);
	}

	@Override
	public OptionVO findById(Long pk) {
		return oDao.findById(pk);
	}

	@Override
	public List<OptionVO> findByItem(String op_itcode) {
		return oDao.findByItem(op_itcode);
	}

}
