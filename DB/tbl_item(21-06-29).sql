-- 테이블 작성. 외래키설정 1개. insert 안됨.
use db_malang;

CREATE TABLE `tbl_item` (
	`it_code`			CHAR(8)		PRIMARY KEY,
	`it_seid`			VARCHAR(20)	NOT NULL,
	`it_ctcode`			CHAR(4)		NOT NULL,
	`it_title`			VARCHAR(125)	NOT NULL,
	`it_price`			INT	NOT NULL,
	`it_shippingfee`	INT	NOT NULL	DEFAULT 0,
	`it_content`		TEXT	NOT NULL,
	`it_photo`			VARCHAR(512)
);

-- 칼럼 삭제
-- ALTER TABLE tbl_item DROP COLUMN it_decode;
-- 칼럼 타입변경
ALTER TABLE tbl_item MODIFY it_photo VARCHAR(512);

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

SELECT * FROM tbl_item;

INSERT INTO tbl_item VALUES('00000001', 'seller', 'E001',
'말랑한 말랑말랑 몰랑간식', 3000, 0, '말랑한 간식 동물친구들과 집사들도 건강하게 먹을 수 있는 몰랑간식!',
NULL);

INSERT INTO tbl_item VALUES('00000002', 'seller', 'I002',
'[갑분말] 갑자기 분위기 말랑말랑', 10000, 0,
'올 여름 멍냥이들에게 닥친 말랑분위기.. 몰랑에서 말랑한 그림을 받아보세요 :)', NULL);

INSERT INTO tbl_item VALUES('00000003', 'seller', 'P010',
'몰랑은 역시 최고야', 3000, 0,
'끝나지 않는 장난감 무한굴레에서 벗어나기 좋은 몰랑말랑장난감~ 특히 소형견에게 추천드려요^^', NULL);

INSERT INTO tbl_item VALUES('00000004', 'seller', 'H005',
'반려동물 패션 끝판왕', 3000, 0,
'어떤 옷이든 주문제작 가능한 몰랑에서 나온 신제품! 넉넉한 사이즈에 귀여움을 돋보이게하는 센스까지~',
'/static/item/00000004.jpg');

INSERT INTO tbl_item VALUES('00000005', 'seller', '0019',
'🥐🍩와플 속에 쏙! 귀여운 일러스트🥐🍩', 9900, 0,
'크레파스로 그린 듯한 따뜻한 느낌의 반려동물 그림이에요 (어류와 파충류는 제작하지 않습니다.)
 🔺설명 끝까지 읽어주세요! 읽지 않아생기는 일은 책임 못 드립니다.
 문구는 이름만 써드려요 그 외 문구 추가는 추가 비용이 발생할 수 있습니다. 몸이 잘려서 나온 사진은 잘린 그대로 제작이 들어가게 됩니다(유의해주세요!)
 *옷/악세사리는 창작으로 그려드리지는 않아요*
 *사진 그대로 그리는 제작 상품이에요. 자세 합성 안됩니다.*
 ❗️상업용(로고/간판) 사전 문의해주세요 ❗️
 *상업용 제작시 재판매(굿즈) 불가함*
 **원하시는 패턴 말씀해주세요**
 #1꽃🌸 #2하트❤ #3동그링⚪ #4우주별⭐ #5크레용짱🟢 이 외에 패턴은 말씀해주세용
 🤍주문방법🤍
 제작을 희망하는 사진을 고른 후 옵션 선택+주문-> 메시지로 제작 희망 사진과 이름을 보내주세요!
 그림은 기본 정사각형(2000*2000px 해상도300 고화질 jpeg)로 제공됩니다.
 *주말에는 메시지 확인이 늦습니다*
 🌟사진 고르는 팁🌟
 ✔ 반려동물의 몸 전체가나온 사진
 ✔ 고화질일수록 그림에 특징이 잘 들어 납니다
 ✔귀여운 표정을 짓고 있는 전신 사진
 🔥필독🔥
 1. 1:1 주문제작 특성상 제작 후 환불이 어렵습니다.
 2. 화려한 패턴의 옷/소품(반려동물이 착용)일 경우 단순화되어서 표현될 수동 있습니다.
 3. 상업적으로 이용/2차 가공은 협의없이 불가합니다. 이를 어길 시 법적인 책임을 물을 수 있습니다.
 4. 수정은 반려동물당 2회씩입니다. (2회 초과시 추가요금이 발생할 수 있습니다.)
 . 토요일/공휴일/수요일은 휴무입니다.
 6. 시안 확인이 느려지면 순서가 먼저 확인하신 분 뒤로 밀려납니다!
 7. 12개월 달력은 패턴이 들어간 효과 배경색만 바꿔 제작됩니다.
 💛완성된 그림은 작가의 포트폴리오로 개인 SNS에 업로드 됩니다.
 💛 원치 않으시는 분은 미리 말씀해주세요','/static/item/00000005.jpg');

INSERT INTO tbl_item VALUES('00000006', 'seller', 'H002',
'나만의 냥냥한 포토앨범', 5000, 3000,
'멍냥이 사진은 몰랑에서 제작하세요!', '/static/item/00000006.jpg');

INSERT INTO tbl_item VALUES('00000007', 'seller', 'I001',
'[일러스트]분위기 있는 일러스트 작업', 5000, 0,
'집사만큼 인생샷이 잘나왔다면 소장하는게 당연하죠! 그런데 분위기를 곁들인..',
'/static/item/00000007.jpg');

INSERT INTO tbl_item VALUES('00000008', 'seller', 'I002',
'[캐리커쳐] 고퀄 멍냥이 초상화', 7000, 0,
'멍냥이의 멍냥에 의한 멍냥이를 위한 초상화!(다른 반려동물도 가능합니다^^)',
'/static/item/00000008.jpg');

INSERT INTO tbl_item VALUES('00000009', 'seller', 'I001',
'🔥주문폭주_🐱캐릭터 되고 싶은 반려동물 모여라🐶', 2500, 0,
'ಇ( ˵ᐛ ˵)ಇ

캐릭터 되고 싶은 반려동물 모여라 란?

소중한 반려동물이나 좋아하는 동물들을 캐릭터로 그려
핸드폰 배경/잠금 화면으로 설정하는 작품입니다


■ 연락 가능 시간 = 9:00~12:00■
메세지 남겨놓으시면 다음날 연락 드립니다



● 옵션 선택 하시고 주문 완료 후 <작가문의>로 사진을 전송 해주세요


● 사진 전송 Tip

• 최대한 반려동물의 색상과 비슷한 사진을 보내주세요

• 여러사진을 보내주시면 생김새나 색감을 표현하기 쉬워요

•꼬리나 배 부분 나온 사진도 보내주세요

* 색상이 잘 나타나지않은 사진으로 1~2장 보내주시면 작업이 어려워져요 *
그에 따른 수정은 불가능하니 양해 부탁드립니다

■ 작품 크기는 1000x1500 px 입니다 ■




● 자세 /소품 Tip

• 자세를 어떻게 해야할지 모르겠어요 !
= 후기에 올라온 사진이나 작가의 메인사진을 보시고 결정하셔도 됩니다


• 소품은 어떤걸 하는게 좋을까요 ?
= 반려동물이 좋아하는 물건이나 반려동물 성격에 어울리는 소품을 하시면 됩니다




■■■중 요 사 항■■■

저는 보내주신 반려동물의 사진만 가지고 저의 느낌대로
작업에 들어가기 때문에 간혹 마음에 안드실 수 있어요
그러니 중간 작업 전에 대충이라도 성격/좋아하는 물건 등을 말씀 해주세요

* 중간작업에서 소품의 크기가 변동 될 경우 추가금액이 발생 할 수 있습니다 *

* 2마리 이상 선택 - 작은 소품 하실 경우 1마리에게만 적용됩니다 *
( 소품문의가 있으신 분들은 작가문의로 연락 주세요 )



🧸후기 작성 이벤트🧸

후기 작성 이벤트에 참여 해주시는 분들께
기본(흰색배경)+색상배경 총 2개를 드립니다

* 이벤트 배경 색상은 작품 메인 사진 맨 마지막에 있습니다 *


■ 상업적 이용은 먼저 메세지 문의 부탁드립니다
■ 공휴일 / 주말에는 작업을 하지않습니다
■ 주문 / 제작 특성상 제작이 진행 됐을 경우 환불이 불가능합니다
■ 작품은 작가의 포트폴리오에 사용 될 수 있습니다',
'/static/item/00000009.jpg');
