package com.malcom.malang.model;

import java.util.List;

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
	private String it_code;//			CHAR(8)		PRIMARY KEY,
	private String it_seid;//			VARCHAR(20)	NOT NULL,
	private String it_ctcode;//			CHAR(4)		NOT NULL,
	private String it_title;//			VARCHAR(125)	NOT NULL,
	private int it_price;//			INT	NOT NULL,
	private int it_shippingfee;//	INT	NOT NULL	DEFAULT 0,
	private String it_content;//		VARCHAR(2000)	NOT NULL,

	private String it_photo = "/static/item/00000000.jpg";//			VARCHAR(100)
	// 사진 경로는 파일 저장 경로 정해지면 바꾸겠음
  
	private List<String> op_name ;
	private List<String> op_content;
}