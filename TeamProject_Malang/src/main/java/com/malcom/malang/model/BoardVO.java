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
public class BoardVO {

	private Long bd_seq;// BIGINT auto_increment PRIMARY KEY,
    private String bd_title;// VARCHAR(125) NOT NULL,
    private String bd_content;// VARCHAR(2000) NOT NULL,
    private String bd_author;// VARCHAR(15) NOT NULL,
    private String bd_date;// VARCHAR(30) NOT NULL
	private int bd_count;
	private int count;
}
