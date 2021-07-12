-- 테이블 작성. 외래키설정 완료. insert 완료.
use db_malang;

CREATE TABLE `tbl_category` (
	`ct_code`	CHAR(4)	NOT NULL PRIMARY KEY,
	`ct_main`	VARCHAR(30)	NOT NULL,
	`ct_sub`	VARCHAR(30)	NOT NULL
);

SELECT * FROM tbl_category;
DESC tbl_category;

-- DROP TABLE tbl_category;

INSERT INTO tbl_category VALUES('0001', '수제간식', '', '0');
INSERT INTO tbl_category VALUES('0002', '수공예', '', '0');
INSERT INTO tbl_category VALUES('0003', '일러스트', '', '0');
INSERT INTO tbl_category VALUES('0004', '반려동물용품', '', '0');

INSERT INTO tbl_category VALUES('0005', '기타', '0001', '1');
INSERT INTO tbl_category VALUES('0006', '기타', '0002', '1');
INSERT INTO tbl_category VALUES('0007', '기타', '0003', '1');
INSERT INTO tbl_category VALUES('0008', '기타', '0004', '1');

INSERT INTO tbl_category VALUES('0009', '껌', '0001', '1');
INSERT INTO tbl_category VALUES('0010', '쿠키', '0001', '1');
INSERT INTO tbl_category VALUES('0011', '육포/어포', '0001', '1');
INSERT INTO tbl_category VALUES('0012', '스틱', '0001', '1');
INSERT INTO tbl_category VALUES('0013', '케이크', '0001', '1');

INSERT INTO tbl_category VALUES('0014', '무선이어폰케이스', '0002', '1');
INSERT INTO tbl_category VALUES('0015', '증명사진', '0002', '1');
INSERT INTO tbl_category VALUES('0016', '그립톡', '0002', '1');
INSERT INTO tbl_category VALUES('0017', '악세사리', '0002', '1');
INSERT INTO tbl_category VALUES('0018', '스티커', '0002', '1');

INSERT INTO tbl_category VALUES('0019', '캐릭터', '0003', '1');
INSERT INTO tbl_category VALUES('0020', '실사', '0003', '1');
INSERT INTO tbl_category VALUES('0021', '도트', '0003', '1');
INSERT INTO tbl_category VALUES('0022', '손그림', '0003', '1');

INSERT INTO tbl_category VALUES('0023', '옷/넥카라', '0004', '1');
INSERT INTO tbl_category VALUES('0024', '그릇', '0004', '1');
INSERT INTO tbl_category VALUES('0025', '침구', '0004', '1');
INSERT INTO tbl_category VALUES('0026', '악세사리', '0004', '1');
INSERT INTO tbl_category VALUES('0027', '산책용품', '0004', '1');
INSERT INTO tbl_category VALUES('0028', '장난감', '0004', '1');



SELECT ct_sub FROM tbl_category
WHERE ct_main = '일러스트';

SELECT ct_main FROM tbl_category
GROUP BY ct_main ORDER BY ct_code;

-- P 라인 한번다 삭제하고 다시 넣음. (화면에 보이는 카테고리 칼럼 수 문제)
DELETE FROm tbl_category
WHERE ct_code = 'P010';

SELECT ct_main FROM tbl_category
group by ct_main
order by ct_main desc;


-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('I000', '일러스트', '기타');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('I001', '일러스트', '캐릭터');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('I002', '일러스트', '실사');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('I003', '일러스트', '도트');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('I004', '일러스트', '손그림');

-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('H000', '수공예', '기타');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('H001', '수공예', '무선이어폰케이스');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('H002', '수공예', '증명사진');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('H003', '수공예', '그립톡');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('H004', '수공예', '악세사리');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('H005', '수공예', '스티커');

-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('E000', '수제간식', '기타');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('E001', '수제간식', '껌');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('E002', '수제간식', '쿠키');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('E003', '수제간식', '육포/어포');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('E004', '수제간식', '스틱');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('E005', '수제간식', '케이크');

-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('P000', '반려동물용품', '기타');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('P001', '반려동물용품', '옷');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('P002', '반려동물용품', '넥카라');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('P003', '반려동물용품', '침구');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('P004', '반려동물용품', '악세사리');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('P005', '반려동물용품', '산책용품');
-- insert into tbl_category(ct_code, ct_main, ct_sub)
-- values('P010', '반려동물용품', '장난감');