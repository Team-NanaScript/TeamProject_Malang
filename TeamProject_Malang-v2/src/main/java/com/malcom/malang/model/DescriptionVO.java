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
public class DescriptionVO {
	private	Long	de_code;//	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	private	String	de_shippingfee;//	VARCHAR(300),
	private	String	de_shipping;//	VARCHAR(300),
	private	String	de_refund;//	VARCHAR(300)
}
