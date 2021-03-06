package com.malcom.malang.service.impl;

import java.io.IOException;
import java.util.Random;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.malcom.malang.dao.DescriptionDao;
import com.malcom.malang.dao.ItemDao;
import com.malcom.malang.dao.OptionDao;
import com.malcom.malang.model.ItemVO;
import com.malcom.malang.model.OptionVO;
import com.malcom.malang.model.SelectOptionVO;
import com.malcom.malang.service.FileService;
import com.malcom.malang.service.SelectOptionService;
import com.malcom.malang.service.insertService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
@Slf4j
public class insertServiceImplV1 implements insertService {

	protected final ItemDao itDao;
	protected final OptionDao opDao;
	protected final FileService fService;
	protected final SelectOptionService soService;

	@Override
	public int insert(ItemVO itVO, MultipartFile file, MultipartHttpServletRequest files) throws IOException {
		
		String fileName = fService.fileUp(file);
		
		ItemVO vo = null;
		
		while (true) {
			Random rnd = new Random();
			int rnd_code = rnd.nextInt(99999998)+1;
			String it_code = String.format("%08d", rnd_code);

			vo = itDao.findById(it_code);
			log.debug("생성된 코드 {}",it_code);
			

			if(vo == null) {
				
				itVO.setIt_code(it_code);
				itVO.setIt_photo(fileName);
				
				itDao.insert(itVO);
				break;
			}
			
		}
		

		int op_name_size = itVO.getOp_name().size();

		for (int i = 0; i < op_name_size; i++) {

			OptionVO opVO = new OptionVO();
			if(itVO.getOp_name().get(i) == null || itVO.getOp_name().get(i).equals("")) {
				continue;
			}
			opVO.setOp_name(itVO.getOp_name().get(i));
			opVO.setOp_content(itVO.getOp_content().get(i));
			opVO.setOp_itcode(itVO.getIt_code());
			
			opDao.insert(opVO);
			

		}
		
		int so_name_size = itVO.getSo_name().size();
		for(int j = 0 ; j < so_name_size ; j++) {
			
			SelectOptionVO soVO = new SelectOptionVO();
			if(itVO.getSo_name().get(j) == null || itVO.getSo_name().get(j).equals("")) {
				continue;
			}
			soVO.setSo_price(itVO.getSo_price().get(j));
			soVO.setSo_content(itVO.getSo_content().get(j));
			soVO.setSo_name(itVO.getSo_name().get(j).trim());
			soVO.setSo_itcode(itVO.getIt_code());
			
			soService.insert(soVO);
			
		}

		return 0;
	}
	
	
	

}
