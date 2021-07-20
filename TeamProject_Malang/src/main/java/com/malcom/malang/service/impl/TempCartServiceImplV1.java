package com.malcom.malang.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.malcom.malang.dao.TempCartDao;
import com.malcom.malang.model.TempCartDTO;
import com.malcom.malang.model.TempCartVO;
import com.malcom.malang.service.TempCartService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class TempCartServiceImplV1 implements TempCartService{

	protected final TempCartDao tcDao;
	
	@Override
	public List<TempCartVO> select() {
		// TODO Auto-generated method stub
		return tcDao.select();
	}

	@Override
	public Integer insert(TempCartVO vo) {
		// TODO Auto-generated method stub
		return tcDao.insert(vo);
	}

	@Override
	public Integer update(TempCartVO vo) {
		// TODO Auto-generated method stub
		return tcDao.update(vo);
	}

	@Override
	public Integer delete(Long pk) {
		// TODO Auto-generated method stub
		return tcDao.delete(pk);
	}

	@Override
	public TempCartVO findById(Long pk) {
		// TODO Auto-generated method stub
		return tcDao.findById(pk);
	}

	@Override
	public List<TempCartVO> findByBuyerId(String cr_buyerid) {
		// TODO Auto-generated method stub
		return tcDao.findByBuyerId(cr_buyerid);
	}

	@Override
	public List<TempCartDTO> findViewByBuyer(String cr_buyerid) {
		// TODO Auto-generated method stub
		return tcDao.findViewByBuyer(cr_buyerid);
	}

}
