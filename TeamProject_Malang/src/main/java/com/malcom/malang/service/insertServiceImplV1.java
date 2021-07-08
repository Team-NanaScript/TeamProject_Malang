package com.malcom.malang.service;

import org.springframework.stereotype.Service;

import com.malcom.malang.dao.DescriptionDao;
import com.malcom.malang.dao.ItemDao;
import com.malcom.malang.dao.OptionDao;
import com.malcom.malang.model.ItemVO;
import com.malcom.malang.model.OptionVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class insertServiceImplV1 implements insertService{

	protected final ItemDao itDao;
	protected final OptionDao opDao;
	protected final DescriptionDao desDao;
	
	@Override
	public int insert(ItemVO itVO) {
		// TODO Auto-generated method stub
		
	int size = itVO.getOp_name().size();
	
		
		for(int i = 0; i < size ; i++) {
			
			OptionVO opVO = new OptionVO();
			opVO.setOp_name(itVO.getOp_name().get(i));
			opVO.setOp_content(itVO.getOp_content().get(i));
			
			
		}
		
		return 0;
	}

}
