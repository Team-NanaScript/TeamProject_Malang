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
public class CateVO {
	private String ct_code;//	char(4)
	private String ct_name;//	varchar(30)
	private String ct_parentcode;//	char(4)
	private String ct_tier;//	char(1)
}
