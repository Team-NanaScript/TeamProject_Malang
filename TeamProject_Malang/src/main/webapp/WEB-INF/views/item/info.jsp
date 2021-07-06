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
	href="${rootPath}/static/css/font.css?ver=2021-07-06-001" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/info.css?ver=2021-07-06-001" />
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
		<%@ include file="/WEB-INF/views/item/info_include/description.jsp"%>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>

</html>
