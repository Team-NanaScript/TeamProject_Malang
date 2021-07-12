use db_malang;

CREATE TABLE `tbl_item` (
	`it_code`	CHAR(8)	NOT NULL PRIMARY KEY,
	`it_seid`	VARCHAR(20)	NOT NULL,
	`it_ctcode`	CHAR(4)	NOT NULL,
	`it_title`	VARCHAR(125)	NOT NULL,
	`it_price`	INT	NOT NULL,
	`it_shippingfee`	INT	NOT NULL	DEFAULT 0,
	`it_content`	TEXT	NOT NULL,
	`it_photo`	VARCHAR(100)
);

CREATE TABLE `tbl_option` (
	`op_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`op_itcode`	BIGINT	NOT NULL,
	`op_name`	VARCHAR(30)	NOT NULL,
	`op_content`	VARCHAR(50)	NOT NULL
);

CREATE TABLE `tbl_select_option` (
	`so_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`so_itcode`	BIGINT	NOT NULL,
	`so_name`	VARCHAR(30)	NOT NULL,
	`so_content`	VARCHAR(50)	NOT NULL,
	`so_price` INT DEFAULT 0
);

CREATE TABLE `tbl_category` (
	`ct_code`	CHAR(4)	NOT NULL PRIMARY KEY,
	`ct_name`	VARCHAR(30)	NOT NULL,
	`ct_parentcode`	CHAR(4),
    `ct_tier` CHAR(1)
);

-- 영진
CREATE TABLE `tbl_member` (
	`mb_id`	VARCHAR(20)	PRIMARY KEY,
	`mb_pw`	VARCHAR(16)	NOT NULL,
	`mb_name`	VARCHAR(10) NOT NULL,
	`mb_anum`	VARCHAR(20) NOT NULL,
	`mb_role`	INT DEFAULT 0	NOT NULL,
	`mb_tel`	VARCHAR(20)	NOT NULL,
	`mb_birth`	CHAR(8),
	`mb_email`	VARCHAR(50),
	`mb_addr`	VARCHAR(200),
	`mb_nickname`	VARCHAR(15)
);

CREATE TABLE `tbl_qna` (
	`q_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`q_writer`	VARCHAR(20)	NOT NULL,
	`q_itcode`	CHAR(8)	NOT NULL,
	`q_title`	VARCHAR(100)	NOT NULL,
	`q_content`	VARCHAR(2000)	NOT NULL,
	`q_date`	VARCHAR(30)
);

CREATE TABLE `tbl_review` (
	`r_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`r_writer`	VARCHAR(20)	NOT NULL,
	`r_itcode`	CHAR(8)	NOT NULL,
	`r_content`	VARCHAR(2000) NOT NULL,
	`r_date`	VARCHAR(30),
	`r_score`	INT	NOT NULL,
    `r_poto`	VARCHAR(100)
);

CREATE TABLE `tbl_description` (
	`de_code`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`de_itcode`	CHAR(8)	NOT NULL,
	`de_shippingfee`	VARCHAR(300)	NULL,
	`de_shipping`	VARCHAR(300)	NULL,
	`de_refund`	VARCHAR(300)	NULL
);


CREATE TABLE `tbl_board` (
	`bd_seq`	BIGINT	NOT NULL PRIMARY KEY,
	`bd_author`	BIGINT	NOT NULL,
	`bd_title`	VARCHAR(125),
	`bd_content`	VARCHAR(2000),
	`bd_date`	VARCHAR(30)
);

CREATE TABLE `tbl_comment` (
	`cm_seq`	BIGINT	NOT NULL PRIMARY KEY,
	`cm_bdseq`	BIGINT	NOT NULL,
	`cm_mbid`	BIGINT	NOT NULL,
	`cm_content`	VARCHAR(500)
);

CREATE TABLE `tbl_files` (
  `file_seq` bigint PRIMARY KEY AUTO_INCREMENT,
  `file_itcode` char(8) NOT NULL,
  `file_origin` varchar(256) DEFAULT NULL,
  `file_upname` varchar(256) DEFAULT NULL
);


ALTER TABLE `tbl_description` 
ADD CONSTRAINT `fk_item_TO_description` 
FOREIGN KEY (`de_itcode`)
REFERENCES `tbl_item` (`it_code`)
ON DELETE CASCADE;

ALTER TABLE `tbl_item` 
ADD CONSTRAINT `fk_member_TO_item` 
FOREIGN KEY (`it_seid`)
REFERENCES `tbl_member` (`mb_id`);

ALTER TABLE `tbl_item` 
ADD CONSTRAINT `fk_category_TO_item` 
FOREIGN KEY (`it_ctcode`)
REFERENCES `tbl_category` (`ct_code`);

ALTER TABLE `tbl_option` 
ADD CONSTRAINT `fk_item_TO_option`
FOREIGN KEY (`op_itcode`)
REFERENCES `tbl_item` (`it_code`)
ON DELETE CASCADE;

ALTER TABLE `tbl_select_option` 
ADD CONSTRAINT `fk_item_TO_select_option`
FOREIGN KEY (`so_itcode`)
REFERENCES `tbl_item` (`it_code`)
ON DELETE CASCADE;

ALTER TABLE `tbl_qna` 
ADD CONSTRAINT `fk_member_TO_qna`
FOREIGN KEY (`q_writer`)
REFERENCES `tbl_member` (`mb_id`)
ON DELETE CASCADE;

ALTER TABLE `tbl_qna` 
ADD CONSTRAINT `fk_item_TO_qna` 
FOREIGN KEY (`q_itcode`)
REFERENCES `tbl_item` (`it_code`);

ALTER TABLE `tbl_review` 
ADD CONSTRAINT `fk_member_TO_review` 
FOREIGN KEY (`r_writer`)
REFERENCES `tbl_member` (`mb_id`)
ON DELETE CASCADE;

ALTER TABLE `tbl_review` 
ADD CONSTRAINT `fk_item_TO_review` 
FOREIGN KEY (`r_itcode`)
REFERENCES `tbl_item` (`it_code`);


-- 영진 (설정 불가 xxx)
ALTER TABLE `tbl_board` 
ADD CONSTRAINT `fk_member_TO_board` 
FOREIGN KEY (`bd_author`)
REFERENCES `tbl_member` (`mb_id`)
ON DELETE CASCADE;

-- 영진(설정되어있음 ooo)
ALTER TABLE `tbl_comment` 
ADD CONSTRAINT `fk_board` 
FOREIGN KEY (`cm_bdseq`)
REFERENCES `tbl_board` (`bd_seq`)
ON DELETE CASCADE;


ALTER TABLE `tbl_comment` 
ADD CONSTRAINT `fk_member_TO_comment` 
FOREIGN KEY (`cm_mbid`)
REFERENCES `tbl_member` (`mb_id`)
ON DELETE CASCADE;

ALTER TABLE `tbl_files` 
ADD CONSTRAINT `fk_item_TO_files` 
FOREIGN KEY (`file_itcode`)
REFERENCES `tbl_item` (`it_code`)
ON DELETE CASCADE;


-- 외래키 확인하기
select * from information_schema.table_constraints where constraint_schema = 'db_malang';
alter table tbl_item drop foreign key fk_category_TO_item;

-- tbl_item 의 칼럼명 변경 ( it_poto -> it_photo )
ALTER TABLE tbl_item CHANGE it_poto it_photo VARCHAR(100);
DESC tbl_item;

-- 
ALTER TABLE tbl_item CHANGE it_ctcode it_ctcode CHAR(4) NOT NULL;