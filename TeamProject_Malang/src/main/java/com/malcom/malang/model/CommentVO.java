package com.malcom.malang.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class CommentVO {

	private Long cm_seq;// BIGINT auto_increment PRIMARY KEY,
	private String cm_mbid;// VARCHAR(20) NOT NULL,
    private String cm_content;// VARCHAR(200) NOT NULL,
    private String cm_date;// VARCHAR(50) NOT NULL,
    private String cm_mbnick;// VARCHAR(50) NOT NULL,
    private Long cm_bdseq;// BIGINT NOT NULL
	
}
