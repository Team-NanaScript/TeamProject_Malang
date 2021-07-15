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
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SelectOptionVO {

	private Long so_code;//	bigint
	private String so_itcode;//	char(8)
	private String so_name;//	varchar(30)
	private String so_content;//	varchar(50)
	private Integer so_price;//	int
}
