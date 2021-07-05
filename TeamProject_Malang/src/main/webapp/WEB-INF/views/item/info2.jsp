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
    <title>Info</title>
    <link rel="stylesheet" type="text/css" href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
    <link rel="stylesheet" type="text/css" href="${rootPath}/static/css/info.css?ver=2021-06-14-001" />
    <script> var rootPath = "${rootPath}" </script>
    <script src="${rootPath}/static/js/info.js?ver=2021-06-14-001"></script>
    <style>

      table.review td:hover, table.question td:hover{
        cursor: pointer;
      }
      
      section.img_section div.image_preview {
	  	background: url("${rootPath}/static/images/ex2.png") no-repeat;
		}
    </style>
  </head>

  <body>
  <%@ include file="/WEB-INF/views/include/nav.jsp" %>
    <div id="container" class="container">
      <div class="inner_top">
        <section id="img_section" class="img_section">
          <div class="image_preview"></div>
        </section>
        <aside id="product_aside" class="product_aside">
          <div id="header" class="header">
            <p>맴맴 작가</p>
            <h2>🥐🍩와플 속에 쏙! 귀여운 일러스트🥐🍩</h2>
            <h3>9,900원</h3>
          </div>
  
 
            <ol>
              <li>후기</li>
              <li>★★★★☆ (240)</li>
            </ol>
            <ol>
              <li>배송비</li>
              <li>무료배송</li>
            </ol>


          <div>
            <ul id="title" class="title">작품 옵션</ul>
            <ul>
              <ol>
                <li>제출 파일 유형</li>
                <li>Png</li>
              </ol>
              <ol>
                <li>해상도</li>
                <li>300dpi</li>
              </ol>
              <ol>
                <li>기본 사이즈</li>
                <li>1080px</li>
              </ol>
              <ol>
                <li>수정 횟수</li>
                <li>1회</li>
              </ol>
              <ol>
                <li>작업 기간</li>
                <li>시작일로부터 15일</li>
              </ol>
            </ul>

          </div>
          <form id="option" class="option">
            <ul id="title" class="title">가격 옵션</ul>
            <ul>
              <ol>
                <li>사용</li>
                <li>
                  <select name="" id="">
                    <option value="">비상업용</option>
                    <option value="">상업용</option>
                  </select>
                </li>
              </ol>
              <ol>
                <li>추가옵션</li>
                <li>
                  <select name="" id="">
                    <option value="">없음</option>
                    <option value="">배경추가(+2000원)</option>
                  </select>
                </li>
              </ol>
            </ul>
            <ul id="btn_box" class="btn_box">
              <button id="btn_pack" class="btn_pack" type="button">장바구니</button>
              <button id="btn_question" class="btn_question" type="button">문의하기</button>
              <button id="btn_buy" class="btn_buy" type="button">구매하기</button>
            </ul>
          </form>

        </aside>
      </div>
      <nav id="product_nav" class="product_nav">
        <ul id="product_nav_ul" class="product_nav_ul">
          <li class="art_1">상세설명</li>
          <li class="art_2">배송/교환/환불</li>
          <li class="art_3">구매후기</li>
          <li class="art_4">문의/답변</li>
        </ul>
      </nav>
      <article id="discription" class="discription">
        <article id="art_1">
          <div>
            크레파스로 그린 듯한 따뜻한 느낌의 반려동물 그림이에요 (어류와
            파충류는 제작하지 않습니다.) <br>
            🔺설명 끝까지 읽어주세요! 읽지 않아생기는 일은 책임 못 드립니다. <br>
            문구는 이름만 써드려요 그 외 문구 추가는 추가 비용이 발생할 수 있습니다. 몸이 잘려서 나온 사진은 잘린
            그대로 제작이 들어가게 됩니다(유의해주세요!) <br>
            *옷/악세사리는 창작으로 그려드리지는 않아요* <br>
            *사진 그대로 그리는 제작 상품이에요. 자세 합성 안됩니다.* <br>
            ❗️상업용(로고/간판) 사전 문의해주세요 ❗️ <br>
            *상업용 제작시 재판매(굿즈) 불가함* <br>
            **원하시는 패턴 말씀해주세요**<br>
            #1꽃🌸 #2하트❤ #3동그링⚪ #4우주별⭐ #5크레용짱🟢 이 외에 패턴은 말씀해주세용<br>
            🤍주문방법🤍<br>
            제작을 희망하는 사진을 고른 후 옵션 선택+주문-> 메시지로 제작 희망 사진과 이름을 보내주세요! <br>
            그림은 기본 정사각형(2000*2000px 해상도300 고화질 jpeg)로 제공됩니다. <br>
            *주말에는 메시지 확인이 늦습니다*<br>
            🌟사진 고르는 팁🌟<br>
            ✔ 반려동물의 몸 전체가나온 사진<br>
            ✔ 고화질일수록 그림에 특징이 잘 들어 납니다<br>
            ✔귀여운 표정을 짓고 있는 전신 사진<br>
            🔥필독🔥<br>
            1. 1:1 주문제작 특성상 제작 후 환불이 어렵습니다. <br>
            2. 화려한 패턴의 옷/소품(반려동물이 착용)일 경우 단순화되어서 표현될 수동 있습니다. <br>
            3. 상업적으로 이용/2차 가공은 협의없이 불가합니다. 이를 어길 시 법적인 책임을 물을 수 있습니다. <br>
            4. 수정은 반려동물당 2회씩입니다. (2회 초과시 추가요금이 발생할 수 있습니다.) <br>
            . 토요일/공휴일/수요일은 휴무입니다. <br>
            6. 시안 확인이 느려지면 순서가 먼저 확인하신 분 뒤로 밀려납니다! <br>
            7. 12개월 달력은 패턴이 들어간 효과 배경색만 바꿔 제작됩니다. <br>
            💛완성된 그림은 작가의 포트폴리오로 개인 SNS에 업로드 됩니다.<br>
            💛 원치 않으시는 분은 미리 말씀해주세요<br>
          </div>
        </article>
        <article id="art_2">
          <h2>배송/교환/환불</h2>
          
          <table id="delivery" class="delivery">
            <tr>
              <td>배송비</td>
              <td>기본료 : 2500원<br/>
                제주 / 도서산간 추가비용 : 0원
              </td>
            </tr>
            <tr>
              <td>제작/배송</td>
              <td>3일 이내<br/>
                주문 및 입금 확인 후 제작이 들어가는 주문 제작 상품입니다.
              </td>
            </tr>
            <tr>
              <td>교환/환불</td>
              <td>불가<br/>
                1:1 주문 제작 상품의 특성상 작업이 시작되면 교환/환불이 불가합니다.</td>
            </tr>
          </table>
        </article>
        <article id="art_3">
          <h2>구매후기</h2>

          <table id="review" class="review">
            <th>구매자</th>
            <th>후기</th>
            <th>등록일</th>
            <tr>
              <td>구은주</td>
              <td>
                <div>
                  작가님 우리 아이들 예쁘게 그려주셔서 감사드려요^^ 상담도 친절하게 잘해주셨고 작업도 빠르게 해주셨답니다.
                작가님 우리 또 만나요^^
                </div>
                <p>구매작품: 사이즈: 정사각형 / 소품추가: 없음</p>
              </td>
              <td>
                2021-06-10
              </td>
            </tr>
            <tr>
              <td>정재은</td>
              <td>
                <div>
                  사진 한 장으로 느낌이나 모습이나 똑닮게 그려주셨어요! 만족해요❤️💞🧡 친절하시고 그림실력도 매우 좋으세요 번창하시길 바랄게요☺️
                </div>
                <p>구매작품: 사이즈: 세트 / 소품추가: 없음</p>
              <td>2021-06-08</td>
            </tr>
            <tr>
              <td>구레오</td>
              <td>
                <div>
                  그림체가 너무 귀여워요 완전 황금손 ㅠㅠㅠ 다른 작가님들보다 가격은 좀 더 있는 것 같아도 디테일이랑 세심한 부분까지 강아지 특징을 너무 잘 잡아주셔서 진짜 만족도 너무너무너무너무 높은 후회 없는 그림이에요 😭❤️‍🔥❤️‍🔥❤️‍🔥❤️‍🔥❤️‍🔥
                </div>
                <p>구매작품: 사이즈: 기본 / 소품추가: 없음</p>
              </td>
              <td>2021-06-01</td>
            </tr>
            <tr>
              <td>마연후</td>
              <td>
                <div>너무 이뻐요! 사진이랑은 다른 포근한 느낌도 있어서 정말 마음에 들어요 :) 감사합니다!</div>
                <p>구매작품: 핸드폰 배경화면 추가 / 소품추가: 추가</p>
              </td>
              <td>2021-05-30</td>
            </tr>
            <tr>
              <td>또복이</td>
              <td>
                <div>주말에 결제했는데 작가님이 주말빼고 며칠 더 걸린다고 메세지를 주셔서 큰 기대 안하고있었는데 오늘 눈뜨자말자 넘 예쁜 그림을 보내주셨어요!<br>
                제가 원하는 느낌을 말씀해드렸는데 빠른 수정해주셔서 더 만족하구요!!<br>
                만원도 안되는 금액으로 이정도 퀄리티라니... 진짜 돈이 하나도 안아까워요 ㅠㅠ<br>
                저희 고양이 순간 보면 귀여운데 자세히보면 멍충해보이는 부분이랑 입 살짝 벌리고 있는데 그런 디테일도 다 살려주셨어요 ㅠㅠ<br>
                다음에 또 다른 사진으로 작업 맡길께용♥️<br>
                월요일부터 너무 행복한 한주가 될것같아요♥️
                </div>
                <p>구매작품: 사이즈: 세트 / 소품추가: 없음</p>
              </td>
              <td>2021-05-26</td>
            </tr>
          </table>
        </article>
        <article id="art_4">
          <h2>문의 및 답변</h2>
          
          <table id="question" class="question">
            <th>문의자</th>
            <th>문의</th>
            <th>등록일</th>
            <tr>
              <td>군만두</td>
              <td>안녕하세요, 작가님 액자에 넣을 그림을 구매하고싶은데요</td>
              <td>2021-06-11</td>
            </tr>
            <tr>
              <td>김치만두</td>
              <td>언제쯤 완성되는지 궁금합니다.</td>
              <td>2021-06-05</td>
            </tr>
            <tr>
              <td>고기만두</td>
              <td>상품 문의입니다.</td>
              <td>2021-06-04</td>
            </tr>
            <tr>
              <td>물만두</td>
              <td>작가님 대량 주문 가능하나요?</td>
              <td>2021-06-01</td>
            </tr>
          </table>
        </articlev>
      </article>
    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
  </body>

</html>
