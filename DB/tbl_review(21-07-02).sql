CREATE TABLE `tbl_review` (
	`r_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`r_writer`	VARCHAR(20)	NOT NULL,
	`r_itcode`	CHAR(8)	NOT NULL,
	`r_content`	VARCHAR(2000) NOT NULL,
	`r_date`	VARCHAR(30),
	`r_score`	INT	NOT NULL,
    `r_poto`	VARCHAR(100)
);

SELECT * FROM tbl_review;
DROP TABLE tbl_review;
DELETE FROM tbl_review;

-- insert
INSERT INTO tbl_review(r_writer, r_itcode, r_content, r_date, r_score, r_poto)
VALUES('noso42','00000005','작가님 우리 아이들 예쁘게 그려주셔서 감사드려요^^ 상담도 친절하게 잘해주셨고 작업도 빠르게 해주셨답니다. 작가님 우리 또 만나요^^','2021-07-05', '5', '');

INSERT INTO tbl_review(r_writer, r_itcode, r_content, r_date, r_score, r_poto)
VALUES('noso42','00000005','사진 한 장으로 느낌이나 모습이나 똑닮게 그려주셨어요! 만족해요❤️💞🧡 친절하시고 그림실력도 매우 좋으세요 번창하시길 바랄게요☺️','2021-06-08', '5', '');


INSERT INTO tbl_review(r_writer, r_itcode, r_content, r_date, r_score, r_poto)
VALUES('nana','00000005',
'그림체가 너무 귀여워요 완전 황금손 ㅠㅠㅠ 다른 작가님들보다 가격은 좀 더 있는 것 같아도 디테일이랑 세심한 부분까지 강아지 특징을 너무 잘 잡아주셔서 진짜 만족도 너무너무너무너무 높은 후회 없는 그림이에요 😭❤️‍🔥❤️‍🔥❤️‍🔥❤️‍🔥❤️‍🔥',
'2021-06-29', '5', '');

INSERT INTO tbl_review(r_writer, r_itcode, r_content, r_date, r_score, r_poto)
VALUES('nana','00000005',
'너무 이뻐요! 사진이랑은 다른 포근한 느낌도 있어서 정말 마음에 들어요 :) 감사합니다!',
'2021-07-02', '4', '');

INSERT INTO tbl_review(r_writer, r_itcode, r_content, r_date, r_score, r_poto)
VALUES('nana','00000005',
'주말에 결제했는데 작가님이 주말빼고 며칠 더 걸린다고 메세지를 주셔서 큰 기대 안하고있었는데 오늘 눈뜨자말자 넘 예쁜 그림을 보내주셨어요!<br>
                제가 원하는 느낌을 말씀해드렸는데 빠른 수정해주셔서 더 만족하구요!!<br>
                만원도 안되는 금액으로 이정도 퀄리티라니... 진짜 돈이 하나도 안아까워요 ㅠㅠ<br>
                저희 고양이 순간 보면 귀여운데 자세히보면 멍충해보이는 부분이랑 입 살짝 벌리고 있는데 그런 디테일도 다 살려주셨어요 ㅠㅠ<br>
                다음에 또 다른 사진으로 작업 맡길께용♥️',
'2021-07-05', '5', '');

-- 닉네임 넣은 VIEW만들기
CREATE VIEW view_review AS
SELECT R.r_code, R.r_writer, R.r_itcode, 
	R.r_content, R.r_date, R.r_score, 
    R.r_poto, MB.mb_nickname
FROM tbl_review R
	LEFT JOIN tbl_member MB
		ON R.r_writer = MB.mb_id;
        
SELECT * FROM view_review;

SELECT ROUND(sum(r_score)/COUNT(r_score),1), COUNT(r_score) FROM tbl_review
WHERE r_itcode = '00000005';

select ROUND(sum(r_score)/COUNT(r_score),1) from tbl_review
where r_itcode = '00000005';

SELECT COUNT(r_score) FROM tbl_review
WHERE r_itcode = '00000005';