-- 테이블 작성. 외래키설정 안됨. insert 안됨.
use db_malang;

CREATE TABLE `tbl_option` (
	`op_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`op_itcode`	CHAR(8)	NOT NULL,
	`op_name`	VARCHAR(30)	NOT NULL,
	`op_content`	VARCHAR(50)	NOT NULL
);

CREATE TABLE `tbl_select_option` (
	`so_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`so_itcode`	CHAR(8)	NOT NULL,
	`so_name`	VARCHAR(30)	NOT NULL,
	`so_content`	VARCHAR(50)	NOT NULL,
    `so_price` INT DEFAULT 0
);

DROP TABLE tbl_option;
DROP TABLE tbl_select_option;

desc tbl_option;
desc tbl_select_option;

select * from tbl_option;

select * from tbl_select_option;

INSERT INTO tbl_option(op_itcode, op_name, op_content)
VALUES('00000005','제출 유형','Png'),
('00000005','해상도','300dpi'),
('00000005','기본 사이즈','1080px'),
('00000005','수정 가능 횟수','1회'),
('00000005','작업 기간','시작일로부터 15일');

INSERT INTO tbl_select_option(so_itcode, so_name, so_content, so_price)
VALUES('00000005','사용','상업용',0),
('00000005','사용','비상업용',0),
('00000005','추가옵션','없음',0),
('00000005','추가옵션','기타',1000);