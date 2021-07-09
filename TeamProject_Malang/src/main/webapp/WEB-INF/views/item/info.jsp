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
	href="${rootPath}/static/css/info.css?ver=2021-07-09-001" />
<script>
	var rootPath = "${rootPath}"
</script>
<script src="${rootPath}/static/js/info.js?ver=2021-06-14-001"></script>
<style>
table.review td:hover, table.question td:hover {
	cursor: pointer;
}

section.img_section div.image_preview {
	/* 은빈언니가 itemVO 수정하면 아래걸로 변경하면 됨 
	background: url("${rootPath}${ITEM.it_photo}") no-repeat; 
	*/
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
					<p>${ITEM.it_seid}</p>
					<h2>${ITEM.it_title}</h2>
					<h3>${ITEM.it_price}원</h3>
				</div>


				<ol>
					<li>후기</li>
					<li>
						<c:choose>
							<c:when test="${AVG eq 0}">☆☆☆☆☆</c:when>
							<c:when test="${AVG eq 1}">★☆☆☆☆</c:when>
							<c:when test="${AVG eq 2}">★★☆☆☆</c:when>
							<c:when test="${AVG eq 3}">★★★☆☆</c:when>
							<c:when test="${AVG eq 4}">★★★★☆</c:when>
							<c:otherwise>★★★★★</c:otherwise>
						</c:choose>
						 (${COUNT})</li>
				</ol>
				<ol>
					<li>배송비</li>
					<li>
						<c:choose>
							<c:when test="${ITEM.it_shippingfee == 0}">무료배송</c:when>
							<c:otherwise>${ITEM.it_shippingfee}</c:otherwise>
						</c:choose>
					</li>
				</ol>


				<div>
					<ul id="title" class="title">작품 옵션</ul>
					<ul>
						<c:forEach items="${OPTION}" var="OP">
						<ol>
							<li>${OP.op_name}</li>
							<li>${OP.op_content}</li>
						</ol>
						</c:forEach>
					</ul>

				</div>
				<form id="option" class="option">
					<ul id="title" class="title">가격 옵션</ul>
					<ul>
						<c:forEach items="${SONAME}" var="SN">
						<ol>
							<li>${SN}</li>
							<li>
								<select name="" id="">
									<c:forEach items="${SOCONTENT[SN]}" var="SC">
										<option value="">${SC.so_content}
											<c:if test="${not empty SC.so_price}">
												( +${SC.so_price}원 )
											</c:if>
										</option>
									</c:forEach>
								</select>
							</li>
						</ol>
						</c:forEach>
					</ul>
					<ul id="btn_box" class="btn_box">
						<li>
							<button id="btn_pack" class="btn_pack" type="button">장바구니</button>
							<button id="btn_question" class="btn_question" type="button">문의하기</button>
							<button id="btn_buy" class="btn_buy" type="button">구매하기</button>
						</li>
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
