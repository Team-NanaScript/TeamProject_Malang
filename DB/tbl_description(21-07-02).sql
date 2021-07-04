CREATE TABLE `tbl_description` (
	`de_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`de_shippingfee`	VARCHAR(300)	NULL,
	`de_shipping`	VARCHAR(300)	NULL,
	`de_refund`	VARCHAR(300)	NULL
);

DROP TABLE tbl_description;

SELECT * FROM tbl_description;

INSERT INTO tbl_description(de_shippingfee, de_shipping, de_refund)
VALUES('기본료 : 3000원
제주 / 도서산간 추가비용 : 0원',
'3일 이내
주문 및 입금 확인 후 제작이 들어가는 주문 제작 상품입니다.',
'불가
1:1 주문 제작 상품의 특성상 작업이 시작되면 교환/환불이 불가합니다.');

-- 줄바꿈표시를 자바에서 \n replace </br> 