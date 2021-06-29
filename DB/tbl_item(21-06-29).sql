-- 테이블 작성. 외래키설정 1개. insert 안됨.
use db_malang;

CREATE TABLE tbl_item (
	it_code		CHAR(8)		PRIMARY KEY,
	it_seid		VARCHAR(20)	NOT NULL,
	it_ctcode	CHAR(4)		NOT NULL,
	it_opcode	CHAR(4)		NOT NULL,
    it_pocode	CHAR(4)		NOT NULL,
	it_title	VARCHAR(125) NOT NULL,
	it_price	INT	NULL 	NOT NULL,
	it_fee		INT			default 0,
	it_content	VARCHAR(2000),
	it_refund	VARCHAR(200),
	it_ship		VARCHAR(200) default 0,
	it_poto		VARCHAR(100)
);

drop table tbl_item;

DESC tbl_item;

ALTER TABLE tbl_item
ADD CONSTRAINT fk_ctcode
FOREIGN KEY(it_ctcode)
REFERENCES tbl_category(ct_code);

insert into tbl_item(it_code, it_seid, it_stcode, it_opcode, it_pocode, it_title, 
					it_price, it_pee, it_content, it_refund, it_ship, it_poto)
values('gyu250','1234', '김' , '010-1111-1111');

insert into tbl_item
values('1', 'sk', 'I001', );



select * from tbl_item;