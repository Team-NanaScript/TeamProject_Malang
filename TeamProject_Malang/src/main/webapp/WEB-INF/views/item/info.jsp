<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Info</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/info.css?ver=2021-06-14-001" />
<script>
	var rootPath = "${rootPath}"
</script>
<script src="${rootPath}/static/js/info.js?ver=2021-06-14-001"></script>
<style>
table.review td:hover, table.question td:hover {
	cursor: pointer;
}

section.img_section div.image_preview {
	background: url("${rootPath}/static/images/ex2.png") no-repeat;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
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
							<li><select name="" id="">
									<option value="">비상업용</option>
									<option value="">상업용</option>
							</select></li>
						</ol>
						<ol>
							<li>추가옵션</li>
							<li><select name="" id="">
									<option value="">없음</option>
									<option value="">배경추가(+2000원)</option>
							</select></li>
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
					크레파스로 그린 듯한 따뜻한 느낌의 반려동물 그림이에요 (어류와 파충류는 제작하지 않습니다.) <br> 🔺설명
					끝까지 읽어주세요! 읽지 않아생기는 일은 책임 못 드립니다. <br> 문구는 이름만 써드려요 그 외 문구 추가는
					추가 비용이 발생할 수 있습니다. 몸이 잘려서 나온 사진은 잘린 그대로 제작이 들어가게 됩니다(유의해주세요!) <br>
					*옷/악세사리는 창작으로 그려드리지는 않아요* <br> *사진 그대로 그리는 제작 상품이에요. 자세 합성
					안됩니다.* <br> ❗️상업용(로고/간판) 사전 문의해주세요 ❗️ <br> *상업용 제작시
					재판매(굿즈) 불가함* <br> **원하시는 패턴 말씀해주세요**<br> #1꽃🌸 #2하트❤
					#3동그링⚪ #4우주별⭐ #5크레용짱🟢 이 외에 패턴은 말씀해주세용<br> 🤍주문방법🤍<br>
					제작을 희망하는 사진을 고른 후 옵션 선택+주문-> 메시지로 제작 희망 사진과 이름을 보내주세요! <br>
					그림은 기본 정사각형(2000*2000px 해상도300 고화질 jpeg)로 제공됩니다. <br> *주말에는
					메시지 확인이 늦습니다*<br> 🌟사진 고르는 팁🌟<br> ✔ 반려동물의 몸 전체가나온 사진<br>
					✔ 고화질일수록 그림에 특징이 잘 들어 납니다<br> ✔귀여운 표정을 짓고 있는 전신 사진<br>
					🔥필독🔥<br> 1. 1:1 주문제작 특성상 제작 후 환불이 어렵습니다. <br> 2. 화려한
					패턴의 옷/소품(반려동물이 착용)일 경우 단순화되어서 표현될 수동 있습니다. <br> 3. 상업적으로 이용/2차
					가공은 협의없이 불가합니다. 이를 어길 시 법적인 책임을 물을 수 있습니다. <br> 4. 수정은 반려동물당
					2회씩입니다. (2회 초과시 추가요금이 발생할 수 있습니다.) <br> . 토요일/공휴일/수요일은 휴무입니다.
					<br> 6. 시안 확인이 느려지면 순서가 먼저 확인하신 분 뒤로 밀려납니다! <br> 7. 12개월
					달력은 패턴이 들어간 효과 배경색만 바꿔 제작됩니다. <br> 💛완성된 그림은 작가의 포트폴리오로 개인
					SNS에 업로드 됩니다.<br> 💛 원치 않으시는 분은 미리 말씀해주세요<br>
				</div>
			</article>
			<article id="art_2">
				<h2>배송/교환/환불</h2>

				<table id="delivery" class="delivery">
					<tr>
						<td>배송비</td>
						<td>기본료 : 2500원<br /> 제주 / 도서산간 추가비용 : 0원
						</td>
					</tr>
					<tr>
						<td>제작/배송</td>
						<td>3일 이내<br /> 주문 및 입금 확인 후 제작이 들어가는 주문 제작 상품입니다.
						</td>
					</tr>
					<tr>
						<td>교환/환불</td>
						<td>불가<br /> 1:1 주문 제작 상품의 특성상 작업이 시작되면 교환/환불이 불가합니다.
						</td>
					</tr>
				</table>
			</article>
			<article id="art_3">
				<h2>구매후기</h2>

				<table id="review" class="review">
					<tr>
						<th>구매자</th>
						<th>후기</th>
						<th>등록일</th>
						<th>평점</th>
					</tr>
					<c:choose>
						<c:when test="${empty REVIEWS}">
							<tr>
								<td colspan="4">첫 후기를 남겨보세요!</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${REVIEWS}" var="RV">
							<tr data-rcode="${RV.r_code}">
								<td>${RV.r_writer}<br/>
									${RV.mb_nickname}</td>
								<td>
									<div>${RV.r_content}</div>
								</td>
								<td>${RV.r_date}</td>
								<td>${RV.r_score}
							</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>


				</table>
			</article>
			<article id="art_4">
				<h2>문의 및 답변</h2>

				<table id="question" class="question">
					<tr>
						<th>문의자</th>
						<th>제목</th>
						<th>등록일</th>

					</tr>
					<c:choose>
						<c:when test="${empty QNAS}">
							<tr>
								<td colspan="3">아직 문의가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
						<c:forEach items="${QNAS}" var="Q">
							<tr>
								<td>${Q.q_writer}
									${Q.mb_nickname}</td>
								<td>${Q.q_content}</td>
								<td>${Q.q_date}</td>
							</tr>
						</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				</article>
			</article>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>

</html>
