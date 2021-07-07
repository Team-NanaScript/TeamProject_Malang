package com.malcom.malang.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class OptionVO {

	private Long op_code;//	bigint
	private String op_itcode;//	char(8)
	private String op_name;//	varchar(30)
	private String op_content;//	varchar(50)
}
