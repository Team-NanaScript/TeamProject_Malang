CREATE TABLE `tbl_qna` (
	`q_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`q_writer`	VARCHAR(20)	NOT NULL,
	`q_itcode`	CHAR(8)	NOT NULL,
	`q_title`	VARCHAR(100)	NOT NULL,
	`q_content`	VARCHAR(2000)	NOT NULL,
	`q_date`	VARCHAR(30),
    `q_time`	VARCHAR(30)
);

SELECT * FROM tbl_member;


INSERT INTO tbl_qna(q_writer, q_itcode, q_title, q_content, q_date)
VALUES('noso42','00000005','안녕하세요, 작가님 액자에 넣을 그림을 구매하고싶은데요', 
'출력해도 색이나 화질이 깨지지않도록 작업 가능할까요? 또 개인소장용으로 상품을 제작해도 될까요?','2021-07-05');

INSERT INTO tbl_qna(q_writer, q_itcode, q_title, q_content, q_date)
VALUES('noso42','00000005','언제쯤 완성되는지 궁금합니다.', 
'일주일전에 주문드렸는데 언제쯤 완성될까요? 생일선물로 보내야해서 빠른 답변 부탁드립니다.','2021-07-01');

INSERT INTO tbl_qna(q_writer, q_itcode, q_title, q_content, q_date)
VALUES('noso42','00000005','대량주문 문의입니다.', 
'100개정도 단체주문 가능한가요? ','2021-07-02');

INSERT INTO tbl_qna(q_writer, q_itcode, q_title, q_content, q_date)
VALUES('nana','00000005','상품 문의입니다.', 
'냠냠쩝쩝쩝 배고프다','2021-06-29');

INSERT INTO tbl_qna(q_writer, q_itcode, q_title, q_content, q_date)
VALUES('nana','00000005','나나언니의 후기', 
'특별출현 : 나나언니','2021-06-25');

DROP TABLE tbl_qna;


-- 닉네임 넣은 VIEW만들기
CREATE VIEW view_qna AS
SELECT Q.q_code, Q.q_writer, Q.q_itcode, IT.it_title, 
	Q.q_title, Q.q_content, Q.q_date, Q.q_time,
    MB.mb_nickname
FROM tbl_qna Q
	LEFT JOIN tbl_member MB
		ON Q.q_writer = MB.mb_id
	LEFT JOIN tbl_item IT
		ON Q.q_itcode = IT.it_code;
        
DROP VIEW view_qna;

DELETE FROM tbl_qna
WHERE q_code = 10;
-- 시범
SELECT * FROM view_qna;
SELECT * FROM tbl_qna;

	SELECT * FROM view_qna
	WHERE q_itcode = '00000005';
    
