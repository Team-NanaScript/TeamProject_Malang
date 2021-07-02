CREATE TABLE `tbl_qna` (
	`q_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`q_writer`	BIGINT	NOT NULL,
	`q_itcode`	CHAR(8)	NOT NULL,
	`q_title`	VARCHAR(100)	NOT NULL,
	`q_content`	VARCHAR(2000)	NOT NULL,
	`q_date`	VARCHAR(30)
);

DROP TABLE tbl_qna;

ALTER TABLE tbl_books
ADD CONSTRAINT fk_author
FOREIGN KEY(bk_acode)
REFERENCES tbl_author(au_code);