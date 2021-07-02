-- 테이블 작성. 외래키설정 안됨. insert 안됨.
use db_malang;

CREATE TABLE `tbl_option` (
	`op_code`	BIGINT	NOT NULL PRIMARY KEY,
	`op_itcode`	BIGINT	NOT NULL,
	`op_name`	VARCHAR(30)	NOT NULL,
	`op_content`	VARCHAR(50)	NOT NULL
);

CREATE TABLE `tbl_select_option` (
	`so_code`	BIGINT	NOT NULL PRIMARY KEY,
	`so_itcode`	BIGINT	NOT NULL,
	`so_name`	VARCHAR(30)	NOT NULL,
	`so_content`	VARCHAR(50)	NOT NULL
);

DROP TABLE tbl_option;
DROP TABLE tbl_select_option;


INSERT INTO tbl_option(op_code, op_itcode, op_name, op_content)
VALUES();


INSERT INTO tbl_selecte_option(op_code, op_itcode, op_name, op_content)
VALUES();