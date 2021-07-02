package com.malcom.malang.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {

	private String mb_id; //VARCHAR(20) PRIMARY KEY,
	private String mb_pw ;//VARCHAR(16) NOT NULL,
	private String mb_name; //VARCHAR(10) NOT NULL,
	private String mb_tel ;//VARCHAR(20) NOT NULL,
	private String mb_birth; //CHAR(8),
	private String mb_anum; //VARCHAR(20),
	private String mb_addr ;//VARCHAR(200),
	private String mb_email ;//VARCHAR(50),
	private String mb_nickname;
	private int mb_role ;//INT default 0
	
}
