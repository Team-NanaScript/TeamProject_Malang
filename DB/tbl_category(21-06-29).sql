-- 테이블 작성. 외래키설정 완료. insert 완료.
use db_malang;

CREATE TABLE `tbl_category` (
	`ct_code`	CHAR(4)	NOT NULL PRIMARY KEY,
	`ct_main`	VARCHAR(30)	NOT NULL,
	`ct_sub`	VARCHAR(30)	NOT NULL
);

SELECT * FROM tbl_category;
DESC tbl_category;

DROP TABLE tbl_category;

insert into tbl_category(ct_code, ct_main, ct_sub)
values('I000', '일러스트', '기타');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('I001', '일러스트', '캐릭터');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('I002', '일러스트', '실사');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('I003', '일러스트', '도트');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('I004', '일러스트', '손그림');

insert into tbl_category(ct_code, ct_main, ct_sub)
values('H000', '수공예', '기타');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('H001', '수공예', '무선이어폰케이스');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('H002', '수공예', '증명사진');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('H003', '수공예', '그립톡');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('H004', '수공예', '악세사리');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('H005', '수공예', '스티커');

insert into tbl_category(ct_code, ct_main, ct_sub)
values('E000', '수제간식', '기타');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('E001', '수제간식', '껌');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('E002', '수제간식', '쿠키');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('E003', '수제간식', '육포/어포');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('E004', '수제간식', '스틱');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('E005', '수제간식', '케이크');

insert into tbl_category(ct_code, ct_main, ct_sub)
values('P000', '반려동물용품', '기타');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('P001', '반려동물용품', '리드줄');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('P002', '반려동물용품', '인식표');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('P003', '반려동물용품', '옷');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('P004', '반려동물용품', '하네스');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('P005', '반려동물용품', '넥카라');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('P006', '반려동물용품', '침구');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('P007', '반려동물용품', '악세사리');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('P008', '반려동물용품', '쿠션');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('P009', '반려동물용품', '그릇');
insert into tbl_category(ct_code, ct_main, ct_sub)
values('P010', '반려동물용품', '장난감');




DELETE FROm tbl_category
WHERE ct_code = 'P000';