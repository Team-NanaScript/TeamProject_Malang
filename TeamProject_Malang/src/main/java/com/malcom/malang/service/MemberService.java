package com.malcom.malang.service;

import com.malcom.malang.model.MemberVO;

public interface MemberService extends GenericService<MemberVO, String> {

	public MemberVO findByUser(String mb_id, String mb_pw);

}
