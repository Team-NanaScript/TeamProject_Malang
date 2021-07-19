package com.malcom.malang.model;

import lombok.Builder;

import lombok.AllArgsConstructor;

import lombok.NoArgsConstructor;

import lombok.ToString;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderDTO {
	private Long od_code;//	BIGINT	PRIMARY KEY,
	private String od_buyerid;//	VARCHAR(20)	NOT NULL,
	private String od_itcode;//	CHAR(8)	NOT NULL,
	private String od_option;//	VARCHAR(256)	NOT NULL,
	private int od_price = 0;//	INT	NOT NULL,
	private String od_anum;//	VARCHAR(20)	NOT NULL,
	private String od_addr;//	VARCHAR(200)	NOT NULL,
	private String od_paydate;//	VARCHAR(60)	NOT NULL,
	private String od_orderdate;//	VARCHAR(60)	NOT NULL
	private Long od_rcode;//	VARCHAR(60)	NOT NULL
}
