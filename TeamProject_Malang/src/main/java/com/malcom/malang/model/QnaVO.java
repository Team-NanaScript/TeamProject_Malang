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
public class QnaVO {
	private Long q_code;//	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	private Long q_writer;//	BIGINT	NOT NULL,
	private String q_itcode;//	CHAR(8)	NOT NULL,
	private String q_title;//	VARCHAR(100)	NOT NULL,
	private String q_content;//	VARCHAR(2000)	NOT NULL,
	private String q_date;//	VARCHAR(30)
}
