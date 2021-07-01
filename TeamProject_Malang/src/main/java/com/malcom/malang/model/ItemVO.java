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
public class ItemVO {
	// 임시 VO
	private String it_code;
	private String it_decode;
	private String it_seid;
	private String it_ctcode;
	private String it_title;
	private String it_price;
	private String it_shippingfee;
	private String it_content;
	private String it_poto;
}
