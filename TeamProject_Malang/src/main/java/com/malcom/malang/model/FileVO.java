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
public class FileVO {

	private Long file_seq;// BIGINT auto_increment primary key,
    private String file_itcode;// char(8) not null,
    private String file_origin;// varchar(256),
    private String file_upname;// varchar(256)
	
}
