package com.malcom.malang.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class CartListVO {
	
	private String flag;
	private List<CartVO> cartList;
	

}
