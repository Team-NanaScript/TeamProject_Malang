package com.malcom.malang.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.malcom.malang.dao.QnaDao;
import com.malcom.malang.model.QnaDTO;
import com.malcom.malang.model.QnaVO;
import com.malcom.malang.service.QnaService;

import lombok.RequiredArgsConstructor;


@Service("QnaServiceV1")
@RequiredArgsConstructor
public class QnaServiceImplV1 implements QnaService{

	protected final QnaDao qDao;
	
	@Override
	public List<QnaVO> select() {
		
		return qDao.select();
	}

	@Override
	public Integer insert(QnaVO vo) {
		
		return qDao.insert(vo);
	}

	@Override
	public Integer update(QnaVO vo) {
		
		return qDao.update(vo);
	}

	@Override
	public Integer delete(Long pk) {
		
		return qDao.delete(pk);
	}

	@Override
	public QnaVO findById(Long pk) {
		
		return qDao.findById(pk);
	}

	@Override
	public List<QnaDTO> selectByWriter(Long q_writer) {

		return qDao.selectByWriter(q_writer);
	}

	@Override
	public List<QnaDTO> selectByContent(String q_content) {
		
		return qDao.selectByContent(q_content);
	}

	@Override
	public List<QnaDTO> findByItem(String q_itcode) {
		
		return qDao.findByItem(q_itcode);
	}

}
