package com.malcom.malang.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.malcom.malang.config.DateConfig;
import com.malcom.malang.dao.CommentDao;
import com.malcom.malang.model.CommentVO;
import com.malcom.malang.service.CommentService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CommentServiceImplV1 implements CommentService{

	protected final CommentDao cDao;
	
	@Override
	public List<CommentVO> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer insert(CommentVO vo) {

		String time = DateConfig.sDate("yy/MM/dd") + " " + DateConfig.sTime("HH:mm");
		
		vo.setCm_date(time);
		
		Integer result = cDao.insert(vo);
		if(result != null || result > 0) {
			return result;
		}
		
		return null;
	}

	@Override
	public Integer update(CommentVO vo) {
		// TODO Auto-generated method stub
		

		String time = DateConfig.sDate("yy/MM/dd") + " " + DateConfig.sTime("HH:mm");
		
		vo.setCm_date(time);
		
		return cDao.update(vo);
	}

	@Override
	public Integer delete(Long cm_seq) {
		
		int result = cDao.delete(cm_seq);
		
		return result;
	}

	@Override
	public CommentVO findById(Long cm_seq) {
		// TODO Auto-generated method stub
		
		CommentVO vo = cDao.findById(cm_seq);
		
		return vo;
	}

	@Override
	public List<CommentVO> findByList(Long bd_seq) {
		
		List<CommentVO> cList = cDao.findByList(bd_seq);
		
		return cList;
	}


}
