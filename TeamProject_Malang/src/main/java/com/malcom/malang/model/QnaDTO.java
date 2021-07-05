package com.malcom.malang.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaDTO {
	private Long q_code;//	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	private String q_writer;//	VARCHAR(20)	NOT NULL,
	private String q_itcode;//	CHAR(8)	NOT NULL,
	private String q_title;//	VARCHAR(100)	NOT NULL,
	private String q_content;//	VARCHAR(2000)	NOT NULL,
	private String q_date;//	VARCHAR(30)
	private String mb_nickname;
}
