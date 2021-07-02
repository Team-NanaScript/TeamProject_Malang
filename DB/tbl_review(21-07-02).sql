CREATE TABLE `tbl_review` (
	`r_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`r_writer`	BIGINT	NOT NULL,
	`r_itcode`	CHAR(8)	NOT NULL,
	`r_content`	VARCHAR(2000) NOT NULL,
	`r_date`	VARCHAR(30),
	`r_score`	INT	NOT NULL,
    `r_poto`	VARCHAR(100)
);

SELECT * FROM tbl_review;
DROP TABLE tbl_review;