-- 테이블 작성. 외래키설정 안됨. insert 안됨.
use db_malang;

CREATE TABLE tbl_option (
	op_code	BIGINT	PRIMARY KEY,	-- 옵션코드
	op_itcode	CHAR(6)	NOT NULL,	-- 상품코드
	op_1	VARCHAR(20),	-- 옵션 1
	op_2	VARCHAR(20),	-- 옵션 2
	op_3	VARCHAR(20),	-- 옵션 3
	op_4	VARCHAR(20),	-- 옵션 4
	op_5	VARCHAR(20)	-- 옵션 5
);

CREATE TABLE tbl_price_option (
	po_code	BIGINT	PRIMARY KEY,		-- 가격옵션코드
	po_itcode	CHAR(6)	NOT NULL,	-- 상품코드
	po_1	VARCHAR(30),			-- 상위옵션
	po_2	VARCHAR(30)				-- 하위옵션
);

DROP TABLE tbl_option;
DROP TABLE tbl_price_option;


insert into tbl_option(op_code, op_itcode, op_1, op_2, op_3, op_4, op_5)
values('1');