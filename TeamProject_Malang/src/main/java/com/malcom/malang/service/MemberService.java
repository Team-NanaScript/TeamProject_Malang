package com.malcom.malang.service;

import org.apache.ibatis.annotations.Param;

import com.malcom.malang.model.MemberVO;

public interface MemberService extends GenericService<MemberVO, String> {

	public MemberVO findById(String mb_id, String mb_pw);

}
