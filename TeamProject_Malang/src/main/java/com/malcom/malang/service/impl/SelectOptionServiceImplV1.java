package com.malcom.malang.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.malcom.malang.dao.SelectOptionDao;
import com.malcom.malang.model.CartVO;
import com.malcom.malang.model.SelectOptionVO;
import com.malcom.malang.service.SelectOptionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("SelectOptionServiceV1")
@RequiredArgsConstructor
public class SelectOptionServiceImplV1 implements SelectOptionService {

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
		Map<String, List<SelectOptionVO>> optMaps = new HashMap<>();

		for (int i = 0; i < soList.size(); i++) {
			log.debug("Name {} ", soList.get(i).toString());
			List<SelectOptionVO> opList = sDao.findByOptionContent(so_itcode, soList.get(i));
			// model.addAttribute("SOCONTENT", opList);
			optMaps.put(soList.get(i), opList);
		}
		log.debug("Map {} ", optMaps.toString());
		model.addAttribute("SOCONTENT", optMaps);

//		log.debug("옵션 내용 리스트 {}", opList.toString());
		return null; // opList;
	}



	@Override
	public List<CartVO> settingCart(List<String> optionList, List<CartVO> cartList) {


		// Cart 리스트 - 매개변수로 가져와서 지 
//		List<CartVO> cartList = new ArrayList<CartVO>();
		
		// 이거밖에 만들자..^^
		String strOptions = "선택옵션 - ";
		CartVO cartVO = new CartVO();
		
		int addPrice = 0;
		// Cart 리스트에 담을 옵션 String 을 만들자.
		for (int i = 0; i < optionList.size(); i++) {
			// 넘어온 op_code로 조회하기
			Long opcode = Long.valueOf(optionList.get(i));
			SelectOptionVO soVO = this.findById(opcode);
			
			// 조회한 option 정보로 이름과 내용, 가격을 가져오기
			String so_itcode = soVO.getSo_itcode(); //아이템코드
			String so_name = soVO.getSo_name(); // 옵션명
			String so_content = soVO.getSo_content(); // 옵션내용
			Integer so_price = soVO.getSo_price(); // 옵션가격


			// 가져온 정보들로 옵션 String 을 만든다.
			// ex) 선택옵션 - 사용:비상업용/추가옵션:배경추가/테스트:테스트2

			if (i == optionList.size() - 1) {
				strOptions += so_name + ":" + so_content;
			} else {
				strOptions += so_name + ":" + so_content + "/";
			}

			cartVO.setCr_itcode(so_itcode);
			

			// 선택한 각 옵션의 가격을 더하기
			addPrice += so_price;

			
		}
		
		// 선택한 모든 옵션의 이름과 내용을 String으로 변환한 것을 setting
		log.debug("옵션String {}", strOptions);
		cartVO.setCr_option(strOptions);
		// 선택한 모든 옵션의 가격을 더한 것을 setting
		cartVO.setCr_price(addPrice);
		//수량 1로기본설정
		cartVO.setCr_amount(1);

		
		// cartVO 에 담긴 정보를 List에 추가
		cartList.add(cartVO);
		
		// 아이디, 배송비빼고는 전부 셋팅완
		return cartList;
	}


}
