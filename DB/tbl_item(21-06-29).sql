-- 테이블 작성. 외래키설정 1개. insert 안됨.
use db_malang;

CREATE TABLE `tbl_item` (
	`it_code`			CHAR(8)		PRIMARY KEY,
	`it_decode`			BIGINT		NOT NULL,
	`it_seid`			VARCHAR(20)	NOT NULL,
	`it_ctcode`			CHAR(4)		NOT NULL,
	`it_title`			VARCHAR(125)	NOT NULL,
	`it_price`			INT	NOT NULL,
	`it_shippingfee`	INT	NOT NULL	DEFAULT 0,
	`it_content`		VARCHAR(2000)	NOT NULL,
	`it_poto`			VARCHAR(100)
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

UPDATE tbl_member SET mb_role = 1 WHERE mb_id = 'seller';

select * from tbl_item;

INSERT INTO tbl_item VALUES('00000001', 1, 'seller', 'E001',
'말랑한 말랑말랑 몰랑간식', 3000, 0, '말랑한 간식 동물친구들과 집사들도 건강하게 먹을 수 있는 몰랑간식!',
NULL);

INSERT INTO tbl_item VALUES('00000002', 2, 'seller', 'I002',
'[갑분말] 갑자기 분위기 말랑말랑', 10000, 0,
'올 여름 멍냥이들에게 닥친 말랑분위기.. 몰랑에서 말랑한 그림을 받아보세요 :)', NULL);