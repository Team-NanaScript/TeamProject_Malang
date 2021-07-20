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
public class TempCartDTO {
	
	private Long cr_code;//	BIGINT	PRIMARY KEY,
	private String cr_buyerid;//	VARCHAR(20)	NOT NULL,
	private String cr_itcode;//	CHAR(8)	NOT NULL,
	private String it_photo;
	private String it_title;
	private String cr_option;//	VARCHAR(256) NOT NULL,
	private String it_seid;
	private int cr_price ;//	INT NOT NULL,
	private int cr_amount ;//	INT DEFAULT 1,
	private int cr_shippingfee ;//	INT NOT NULL
	
	private int itemPrice;
	private int shippingfee;
	private int totalPrice;
}