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
	private String ct_code;//`	CHAR(4)	NOT NULL PRIMARY KEY,
	private String ct_main;//`	VARCHAR(30)	NOT NULL,
	private String ct_sub;//`	VARCHAR(30)	NOT NULL
}
