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
public class ReviewVO {
	private Long r_code;//	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	private Long r_writer;//	BIGINT	NOT NULL,
	private String r_itcode;//	CHAR(8)	NOT NULL,
	private String r_content;//	VARCHAR(2000),
	private String r_date;//	VARCHAR(30),
	private Integer r_score;//	INT
}
