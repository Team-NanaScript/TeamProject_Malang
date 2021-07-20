package com.malcom.malang.service;

import java.util.List;

import com.malcom.malang.model.TempCartDTO;
import com.malcom.malang.model.TempCartVO;

public interface TempCartService extends GenericService<TempCartVO, Long>{

	public List<TempCartVO> findByBuyerId(String cr_buyerid);
	public List<TempCartDTO> findViewByBuyer(String cr_buyerid);
}
