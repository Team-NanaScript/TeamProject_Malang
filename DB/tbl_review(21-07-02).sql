use db_malang;

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
-- DROP TABLE tbl_review;
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


INSERT INTO tbl_review(r_writer, r_itcode, r_content, r_date, r_score, r_poto)
VALUES('seller','00000009','우연히 보고 하게됐는데 진짜 너무 귀여워요!! 생각보다 완성도 빨리되고 제가 수정사항도 뭔가 추상적으로 말했는데도 잘 반영해주셨어요 폰이나 패드 배경화면으로도 하기 좋고 진짜 너무 귀여워요 완전 추천합니다!!','2021-06-27', '3', '');

INSERT INTO tbl_review(r_writer, r_itcode, r_content, r_date, r_score, r_poto)
VALUES('noso42','00000009','저능 닥스훈트애오
예뿐 내얼굴 보고가세요
٩̋(ˊᵒ̴̶̷̤ ꇴ ᵒ̴̶̷̤ˋ)و
💛','2021-06-30', '4', '');


INSERT INTO tbl_review(r_writer, r_itcode, r_content, r_date, r_score, r_poto)
VALUES('nana','00000009',
'악 진짜 너무 귀엽게 잘 그러주셨어요😍 중간에 색채 전도 보내 주셔서 어떤지 확인하게 해주시고 수정할 부분 있으면 알려달라 피드백도 좋으시고 근데 전 다 넘 귀엽고 맘에 들어서 수정할데가 없어섴ㅋ 우리 강아지가 젤 좋아하는 장난감 두개 소품으로 넣어서 너무 귀엽고 그림도 따수워보이고 귀엽고 넘 맘에 들어요 받자마자 핸폰배경으로 바로 바꿨어요❤️',
'2021-07-01', '5', '');

INSERT INTO tbl_review(r_writer, r_itcode, r_content, r_date, r_score, r_poto)
VALUES('noso42','00000009',
'아이 사진과 함께 요청사항 간략히 전달드렸는데 제가 예상한 그림보다 훨씬! 몇 백 배는 더 이쁘게 그려주셔서 너무 놀랐고 감동이었습니다 😭❤ 작가님이 굉장히 친절하시고 전문적이신 것 같아요! 무엇보다 빠르게 작업해주신 것도 넘 만족스럽습니다!! 주변에 많이 추천할게요 💗 감사합니다!!',
'2021-07-04', '3', '');

INSERT INTO tbl_review(r_writer, r_itcode, r_content, r_date, r_score, r_poto)
VALUES('nana','00000009',
'너무너무 이쁘네요~~~~
작가님 제가 진상을 너무 부렸져..죄송하카레 치즈랑 올치즈테비랑 구분 안간다고 찡얼거렸더니 .. 찡얼거리고 반나절 사라지고.. 바쁜척 해서 죄송해여 ㅜㅜ 알람을 설정 안해서 확인이 매번 늦었다는 진상 오브 진상...
작가님은 천사인가 ?? 근데 다 받아주심 ㅜㅜㅜ
덕분에 우리 하디가 하디처럼 잘 보였어요 !!
너무 행복해요~!!!!
번창하세요!!!!',
'2021-07-10', '5', '');

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
