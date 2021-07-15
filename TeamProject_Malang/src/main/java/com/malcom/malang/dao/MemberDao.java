package com.malcom.malang.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.malcom.malang.model.MemberVO;

@Repository
public interface MemberDao extends GenericDao<MemberVO, String>{

	public MemberVO findById(@Param("mb_id") String mb_id, @Param("mb_pw") String mb_pw);
	public int roleUpdate(@Param("mb_id") String mb_id , @Param("mb_role") int role);
	
}
