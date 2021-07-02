-- 테이블 작성. 외래키설정 1개. insert 안됨.
use db_malang;

CREATE TABLE `tbl_item` (
	`it_code`			CHAR(8)		PRIMARY KEY,
	`it_decode`			BIGINT		NOT NULL,
	`it_seid`			VARCHAR(20)	NOT NULL,
	`it_ctcode`			CHAR(4)		NOT NULL,
	`it_title`			VARCHAR(125)	NOT NULL,
	`it_price`			INT	NOT NULL,
	`it_shippingfee`	INT	NOT NULL	DEFAULT 0,
	`it_content`		VARCHAR(2000)	NOT NULL,
	`it_poto`			VARCHAR(100)
);

drop table tbl_item;

DESC tbl_item;

ALTER TABLE tbl_item
ADD CONSTRAINT fk_ctcode
FOREIGN KEY(it_ctcode)
REFERENCES tbl_category(ct_code);

insert into tbl_item(it_code, it_seid, it_stcode, it_opcode, it_pocode, it_title, 
					it_price, it_pee, it_content, it_refund, it_ship, it_poto)
values('gyu250','1234', '김' , '010-1111-1111');

UPDATE tbl_member SET mb_role = 1 WHERE mb_id = 'seller';

select * from tbl_item;

INSERT INTO tbl_item VALUES('00000001', 1, 'seller', 'E001',
'말랑한 말랑말랑 몰랑간식', 3000, 0, '말랑한 간식 동물친구들과 집사들도 건강하게 먹을 수 있는 몰랑간식!',
NULL);

INSERT INTO tbl_item VALUES('00000002', 2, 'seller', 'I002',
'[갑분말] 갑자기 분위기 말랑말랑', 10000, 0,
'올 여름 멍냥이들에게 닥친 말랑분위기.. 몰랑에서 말랑한 그림을 받아보세요 :)', NULL);

INSERT INTO tbl_item VALUES('00000003', 3, 'seller', 'P010',
'몰랑은 역시 최고야', 3000, 0,
'끝나지 않는 장난감 무한굴레에서 벗어나기 좋은 몰랑말랑장난감~ 특히 소형견에게 추천드려요^^', NULL);

INSERT INTO tbl_item VALUES('00000004', 4, 'seller', 'H005',
'반려동물 패션 끝판왕', 3000, 0,
'어떤 옷이든 주문제작 가능한 몰랑에서 나온 신제품! 넉넉한 사이즈에 귀여움을 돋보이게하는 센스까지~',
'/static/item/00000004.jpg');

INSERT INTO tbl_item VALUES('00000006', 6, 'seller', 'H002',
'나만의 냥냥한 포토앨범', 5000, 3000,
'멍냥이 사진은 몰랑에서 제작하세요!', '/static/item/00000006.jpg');

INSERT INTO tbl_item VALUES('00000007', 7, 'seller', 'I001',
'[일러스트]분위기 있는 일러스트 작업', 5000, 0,
'집사만큼 인생샷이 잘나왔다면 소장하는게 당연하죠! 그런데 분위기를 곁들인..',
'/static/item/00000007.jpg');

INSERT INTO tbl_item VALUES('00000008', 8, 'seller', 'I002',
'[캐리커쳐] 고퀄 멍냥이 초상화', 7000, 0,
'멍냥이의 멍냥에 의한 멍냥이를 위한 초상화!(다른 반려동물도 가능합니다^^)',
'/static/item/00000008.jpg');