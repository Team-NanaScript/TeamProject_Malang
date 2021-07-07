package com.malcom.malang.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class categoryVO {

	private String ct_code;//	char(4)
	private String ct_main;//	varchar(30)
	private String ct_sub;//	varchar(30)
	
}
