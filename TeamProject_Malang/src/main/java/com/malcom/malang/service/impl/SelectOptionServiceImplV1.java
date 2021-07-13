package com.malcom.malang.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.malcom.malang.dao.SelectOptionDao;
import com.malcom.malang.model.SelectOptionVO;
import com.malcom.malang.service.SelectOptionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("SelectOptionServiceV1")
@RequiredArgsConstructor
public class SelectOptionServiceImplV1 implements SelectOptionService{

	protected final SelectOptionDao sDao;
	
	@Override
	public List<SelectOptionVO> select() {
		return sDao.select();
	}

	@Override
	public Integer insert(SelectOptionVO vo) {
		return sDao.insert(vo);
	}

	@Override
	public Integer update(SelectOptionVO vo) {
		return sDao.update(vo);
	}

	@Override
	public Integer delete(Long pk) {
		return sDao.delete(pk);
	}

	@Override
	public SelectOptionVO findById(Long pk) {
		return sDao.findById(pk);
	}

	@Override
	public List<SelectOptionVO> findByItem(String so_itcode) {
		return sDao.findByItem(so_itcode);
	}

	@Override
	public List<String> findByOptionName(String so_itcode) {
		return sDao.findByOptionName(so_itcode);
	}

	@Override
	public List<SelectOptionVO> findByOptionContent(String so_itcode, Model model) {
		// 사용 추가옵션... 옵션 이름 리스트 생성
		List<String> soList = sDao.findByOptionName(so_itcode);
		log.debug("옵션 이름 리스트 {}", soList.toString());
		
		// 옵션 이름에 해당하는 내용 리스트 생성
		// List<SelectOptionVO> opList = new ArrayList<SelectOptionVO>();
		
//		soList.size() 사용, 추가옵션 ....
//		soList.get(i) > Option content 상업용 비상업용
		Map<String,List<SelectOptionVO>> optMaps = new HashMap<>();
		
		for(int i = 0; i < soList.size(); i++) {
			log.debug("Name {} ",soList.get(i).toString());
			List<SelectOptionVO> opList = sDao.findByOptionContent(so_itcode, soList.get(i));
			// model.addAttribute("SOCONTENT", opList);
			optMaps.put(soList.get(i),opList);
		}
		log.debug("Map {} ",optMaps.toString());
		model.addAttribute("SOCONTENT", optMaps);
		
//		log.debug("옵션 내용 리스트 {}", opList.toString());
		return null; // opList;
	}
	
	@Override
	public String selectJson(String itcode){
		// 카테고리 옵션
		List<SelectOptionVO> soList = this.findByItem(itcode);
		String soJson = null;
		
		// ObjectMapper 클래스 생성
		ObjectMapper obMapper = new ObjectMapper();
		
		try {
			// ObjectMapper 클래스의 writeValueAsString() method 사용
			// 		=> Java 오브젝트로 부터 JSON을 만들고 이를 문자열 혹은 Byte 배열로 반환
			soJson = obMapper.writeValueAsString(soList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return soJson;
	}

}
