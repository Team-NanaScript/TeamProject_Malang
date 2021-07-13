package com.malcom.malang.service.impl;

import java.io.IOException;
import java.util.Random;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.malcom.malang.dao.DescriptionDao;
import com.malcom.malang.dao.ItemDao;
import com.malcom.malang.dao.OptionDao;
import com.malcom.malang.model.ItemVO;
import com.malcom.malang.model.OptionVO;
import com.malcom.malang.service.FileService;
import com.malcom.malang.service.insertService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
@Slf4j
public class insertServiceImplV1 implements insertService {

	protected final ItemDao itDao;
	protected final OptionDao opDao;
	protected final DescriptionDao desDao;
	protected final FileService fService;

	@Override
	public int insert(ItemVO itVO, MultipartFile file, MultipartHttpServletRequest files) throws IOException {
		// TODO Auto-generated method stub

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
		

		int size = itVO.getOp_name().size();

		for (int i = 0; i < size; i++) {

			OptionVO opVO = new OptionVO();
			opVO.setOp_name(itVO.getOp_name().get(i));
			opVO.setOp_content(itVO.getOp_content().get(i));
			opVO.setOp_itcode(itVO.getIt_code());
			
			opDao.insert(opVO);

		}
		
		

		return 0;
	}
	
	
	

}
