USE db_malang;

CREATE TABLE `tbl_item` (
	`it_code`			CHAR(8)		NOT NULL,
	`it_decode`			BIGINT		NOT NULL,
	`it_seid`			VARCHAR(20)	NOT NULL,
	`it_ctcode`			CHAR(4)		NOT NULL,
	`it_title`			VARCHAR(125)	NOT NULL,
	`it_price`			INT	NOT NULL,
	`it_shippingfee`	INT	NOT NULL	DEFAULT 0,
	`it_content`		VARCHAR(2000)	NOT NULL,
	`it_poto`			VARCHAR(100)
);

CREATE TABLE `tbl_option` (
	`op_code`		BIGINT		NOT NULL,
	`op_itcode`		BIGINT		NOT NULL,
	`op_name`		VARCHAR(30),
	`op_content`	VARCHAR(50)
);

CREATE TABLE `tbl_selete_option` (
	`so_code`		BIGINT	NOT NULL,
	`so_itcode`		BIGINT	NOT NULL,
	`so_name`		VARCHAR(30),
	`so_content`	VARCHAR(50)
);

CREATE TABLE `tbl_category` (
	`ct_code`	CHAR(4)	NOT NULL,
	`ct_main`	VARCHAR(30),
	`ct_sub`	VARCHAR(30)
);

CREATE TABLE `tbl_member` (
	`mb_id`	VARCHAR(20)	NOT NULL,
	`mb_role`	INT DEFAULT 0	NULL,
	`mb_pw`	VARCHAR(16)	NULL,
	`mb_addr`	VARCHAR(200)	NULL,
	`mb_anum`	VARCHAR(20)	NULL,
	`mb_tel`	VARCHAR(20)	NULL,
	`mb_birth`	CHAR(8)	NULL,
	`mb_email`	VARCHAR(50)	NULL,
	`mb_name`	VARCHAR(10)	NULL,
	`mb_nickname`	VARCHAR(15)	NULL
);

CREATE TABLE `tbl_qna` (
	`q_code`	BIGINT	NOT NULL,
	`q_writer`	BIGINT	NOT NULL,
	`q_itcode`	CHAR(8)	NOT NULL,
	`q_title`	VARCHAR(100)	NULL,
	`q_content`	VARCHAR(2000)	NULL,
	`q_date`	date	NULL
);

CREATE TABLE `tbl_review` (
	`r_code`	BIGINT	NOT NULL,
	`r_writer`	BIGINT	NOT NULL,
	`r_itcode`	CHAR(8)	NOT NULL,
	`r_content`	VARCHAR(2000)	NULL,
	`r_date`	date	NULL,
	`r_score`	INT	NULL
);

CREATE TABLE `tbl_description` (
	`de_code`	BIGINT	NOT NULL,
	`de_shippingfee`	VARCHAR(300)	NULL,
	`de_shipping`	VARCHAR(300)	NULL,
	`de_ refund`	VARCHAR(300)	NULL
);

CREATE TABLE `tbl_board` (
	`bd_seq`	BIGINT	NOT NULL,
	`bd_author`	BIGINT	NOT NULL,
	`bd_title`	VARCHAR(125)	NULL,
	`bd_content`	VARCHAR(2000)	NULL,
	`bd_date`	VARCHAR(30)	NULL
);

CREATE TABLE `tbl_comment` (
	`cm_seq`	BIGINT	NOT NULL,
	`cm_bdseq`	BIGINT	NOT NULL,
	`cm_mbid`	BIGINT	NOT NULL,
	`cm_content`	VARCHAR(500)	NULL
);

ALTER TABLE `tbl_item` ADD CONSTRAINT `PK_TBL_ITEM` PRIMARY KEY (
	`it_code`
);

ALTER TABLE `tbl_option` ADD CONSTRAINT `PK_TBL_OPTION` PRIMARY KEY (
	`op_code`
);

ALTER TABLE `tbl_selete_option` ADD CONSTRAINT `PK_TBL_SELETE_OPTION` PRIMARY KEY (
	`so_code`
);

ALTER TABLE `tbl_category` ADD CONSTRAINT `PK_TBL_CATEGORY` PRIMARY KEY (
	`ct_code`
);

ALTER TABLE `tbl_member` ADD CONSTRAINT `PK_TBL_MEMBER` PRIMARY KEY (
	`mb_id`
);

ALTER TABLE `tbl_qna` ADD CONSTRAINT `PK_TBL_QNA` PRIMARY KEY (
	`q_code`
);

ALTER TABLE `tbl_review` ADD CONSTRAINT `PK_TBL_REVIEW` PRIMARY KEY (
	`r_code`
);

ALTER TABLE `tbl_files` ADD CONSTRAINT `PK_TBL_FILES` PRIMARY KEY (
	`f_code`
);

ALTER TABLE `Untitled` ADD CONSTRAINT `PK_UNTITLED` PRIMARY KEY (
	`Key`
);

ALTER TABLE `tbl_description` ADD CONSTRAINT `PK_TBL_DESCRIPTION` PRIMARY KEY (
	`de_code`
);

ALTER TABLE `tbl_board` ADD CONSTRAINT `PK_TBL_BOARD` PRIMARY KEY (
	`bd_seq`
);

ALTER TABLE `tbl_comment` ADD CONSTRAINT `PK_TBL_COMMENT` PRIMARY KEY (
	`cm_seq`
);

