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
	
		String sd = "yy/MM/dd";
		String st = "HH:mm";
		
		String time = DateConfig.sDate(sd) + " " + DateConfig.stime(st);
		
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
		return null;
	}

	@Override
	public Integer delete(String PK) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommentVO findById(String PK) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CommentVO> findByList(Long bd_seq) {
		
		List<CommentVO> cList = cDao.findByList(bd_seq);
		
		return cList;
	}


}
