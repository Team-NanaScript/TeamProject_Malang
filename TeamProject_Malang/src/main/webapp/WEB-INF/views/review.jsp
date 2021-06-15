<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Review</title>
    <link rel="stylesheet" type="text/css" href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
    <link rel="stylesheet" type="text/css" href="${rootPath}/static/css/info.css?ver=2021-06-14-001" />
    <link rel="stylesheet" type="text/css" href="${rootPath}/static/css/view.css?ver=2021-06-14-001" />
    <style>
		div.review-img {
	        width: 240px;
	        height: 240px;
	        background-repeat: no-repeat;
	
	        background-image: url("${rootPath}/static/images/ex2.png");
	        background-size: 100%;
	      }

	      div.review-img4 {
	        width: 240px;
	        height: 240px;
	        background-repeat: no-repeat;
	
	        background-image: url("${rootPath}/static/images/ex3.png");
	        background-size: 100%;
	      }
	
	      div.review-img5 {
	        width: 240px;
	        height: 240px;
	        background-repeat: no-repeat;
	
	        background-image: url("${rootPath}/static/images/ex4.png");
	        background-size: 100%;
	      }
    </style>
  </head>
  <body>
    <header>
      <h2>실시간 후기</h2>
    </header>
    <div id="container" class="container">

      <section>
        <article class="review-list">
          <ul class="review">
            <div class="review-img"></div>
            <li>
              <p>그린달</p>
              <h3>[몽글네컷] 몽글몽글하고 귀여운 4컷, 6컷 드로잉📸</h3>
            </li>
            <li>
              <div>감자칩(pot***) ★★★★★</div>
              <p>
                "그림 너무 잘받았습니다! 작가님 매우 친절하시고 답변도
                빠르세요☺️ 인생네컷을 찍었을때 마스크를 착용하고 있는것이 너무
                아쉬워서 제작을 맡겼는데 너무 만족스럽네요! 조만간 다시 찍"
              </p>
            </li>
            <li>
              <div>고구마칩(swe***) ★★★★★</div>
              <p>
                진짜 너무 마음에 들어요.. 돈쓴거 아깝지 않고 후회도 안되요☺️
                다들 어여 주문하세여!!!!😆😆
              </p>
            </li>
          </ul>

          <ul class="review">
            <div class="review-img"></div>
            <li>
              <p>너나들이✨폰케이스</p>
              <h3>[할인] 드로잉 폰케이스</h3>
            </li>
            <li>
              <div>감자칩(pot***) ★★★★★</div>
              <p>
                케이스 직접 받아보니 기대한대로 역시 너무 이뻐요~~!
                감사합니당🤩😍🤩😍
              </p>
            </li>
            <li>
              <div>고구마칩(swe***) ★★★★★</div>
              <p>
                백일기념으로 너나들이 통해서 이렇게 예쁜 커플 케이스 제작해서
                남친한테 선물해줬는데 너무 좋아했어요🥰 예쁘게 저희 커플
                그려주시고 감사해용 ㅎㅎ막상 실물로 받아서
              </p>
            </li>
          </ul>

          <ul class="review">
            <div class="review-img"></div>
            <li>
              <p>포토웁스</p>
              <h3>🌺차량용 포토방향제🌺그림/사진</h3>
            </li>
            <li>
              <div>감자칩(pot***) ★★★★★</div>
              <p>
                차 안에 디퓨저 덩그러니 있어 너무 썰렁하길래 방향제겸 포토액자
                찾고 있었는데 구매후기 많아서 구매해봤어요 !! 액상으로 오는 거라
                조금 번거러움은 있지만 두개 꽂아 놓
              </p>
            </li>
            <li>
              <div>고구마칩(swe***) ★★★★★</div>
              <p>
                완전 귀엽고 좋아요! 아직 선물전이라 향기는 못맡아봤지만
                좋겠둉ㅎㅎ
              </p>
            </li>
          </ul>

          <ul class="review">
            <div class="review-img4"></div>
            <li>
              <p>뽀기스튜디오</p>
              <h3>반려동물 가죽 인식표 목걸이💜간단한 하트 목걸이</h3>
            </li>
            <li>
              <div>감자칩(pot***) ★★★★★</div>
              <p>
                고양이 키우시는 분들은 절대 하지 마세요 가볍고 편하기도 하고
                판매자님도 착하시고 인식표가 심지어 예쁘기도 합니다 근데 손가락
                겨우 들어갈 정도로 꽉 조여줘도 구르밍
              </p>
            </li>
            <li>
              <div>고구마칩(swe***) ★★★★★</div>
              <p>
                일단 귀여워요 글씨도 잘 보이고ㅋㅋ 사이즈는 제가 제대로 안
                쟀나봐요 살짝 큰감이 있어요 털찌면 맞을 것 같기도 해요ㅋㅋ 아
                그리고 포장부터 정성이 들어가 있어서
              </p>
            </li>
          </ul>
        </article>
        <article class="review-list">
          <ul class="review">
            <div class="review-img5"></div>
            <li>
              <p>착한 수제간식 제리쿡</p>
              <h3>촉촉해🍽먹기좋은💡오리블루베리바</h3>
            </li>
            <li>
              <div>감자칩(pot***) ★★★★★</div>
              <p>
                항상너무 잘먹이고 있습니다 냄새부터 진짜 신선하고 깨끗하다는
                느낌이 들구요 피부가 굉장히 민감해서 음식.샴푸.옷 다
              </p>
            </li>
            <li>
              <div>고구마칩(swe***) ★★★★★</div>
              <p>울 강아지 넘 좋아해요 살찔까봐 많이는 못주는게 좀 아쉽네요</p>
            </li>
          </ul>

          <ul class="review">
            <div class="review-img"></div>
            <li>
              <p>그린달</p>
              <h3>[몽글네컷] 몽글몽글하고 귀여운 4컷, 6컷 드로잉📸</h3>
            </li>
            <li>
              <div>감자칩(pot***) ★★★★★</div>
              <p>
                "그림 너무 잘받았습니다! 작가님 매우 친절하시고 답변도
                빠르세요☺️ 인생네컷을 찍었을때 마스크를 착용하고 있는것이 너무
                아쉬워서 제작을 맡겼는데 너무 만족스럽네요! 조만간 다시 찍"
              </p>
            </li>
            <li>
              <div>양파칩(oni***) ★★★★★</div>
              <p>
                작가님이 너무나도 귀엽게 잘그려 주셔서 두번째 구매입니다
                친절하시고 섬세하게 신경많이써주셔서감사합니다
              </p>
            </li>
          </ul>

          <ul class="review">
            <div class="review-img"></div>
            <li>
              <p>그린달</p>
              <h3>[몽글네컷] 몽글몽글하고 귀여운 4컷, 6컷 드로잉📸</h3>
            </li>
            <li>
              <div>감자칩(pot***) ★★★★★</div>
              <p>
                가볍고 심플하면서 너무 귀여워요 ❣︎ 견주님들 줄 조절할 때 아기들
                털이나 살 찝히는거 없는지만 잘 확인해주세욤 ! !
              </p>
            </li>
            <li>
              <div>고구마칩(swe***) ★★★★★</div>
              <p>
                너무 이뻐요 ㅎㅎ 향도 좋구요 이쁘게 만들어주셔서
                감사합니다ㅎㅎ나중에 또 구매하러올게요 :) 남자친구 차에
                달아줬는데 남자친구도 너
              </p>
            </li>
          </ul>

          <ul class="review">
            <div class="review-img"></div>
            <li>
              <p>그린달</p>
              <h3>[몽글네컷] 몽글몽글하고 귀여운 4컷, 6컷 드로잉📸</h3>
            </li>
            <li>
              <div>감자칩(pot***) ★★★★★</div>
              <p>
                진짜 오자마자 너무 예뻐서 놀랬어요ㅠㅠ 작가님도 완전 친절하시고
                답변도 빠르고 택배도 빨리 왔어요ㅠㅠ❤️ 다음에 또 케이스 구매하게
                되면 꼭 여기서 시킬게요ㅠㅍㅍ
              </p>
            </li>
            <li>
              <div>양파칩(oni***) ★★★★★</div>
              <p>
                작가님이 너무나도 귀엽게 잘그려 주셔서 두번째 구매입니다
                친절하시고 섬세하게 신경많이써주셔서감사합니다
              </p>
            </li>
          </ul>
        </article>
      </section>
    </div>
  </body>
</html>
