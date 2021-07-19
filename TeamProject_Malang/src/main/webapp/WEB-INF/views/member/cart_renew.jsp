<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>CART</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/info.css?ver=2021-06-14-001" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/buy.css?ver=2021-06-14-001" />
<style>
div.review_img1 {
	
}
</style>
<script>
	let msg = "${MSG}";

	if (msg == "REJECT") {
		alert("로그인이 필요한 서비스입니다")
		location.href = "${rootPath}/login"
	}
</script>

</head>

<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="container">

		<article id="discription" class="discription">
			<article id="art_1">
				<h2>주문/결제</h2>
				<table id="question" class="question">
				<tr>
					<th colspan="2">상품정보</th>
					<th>판매자</th>
					<th>배송비</th>
					<th>수량</th>
					<th>상품금액</th>
				</tr>
				<c:if test="${empty CART_LIST}">
					<tr>
						<td colspan="6">장바구니에 담은 제품이 없습니다!</td>
					</tr>
				</c:if>
				<c:if test="${not empty CART_LIST}">
				<c:forEach items="${CART_LIST}" var="CART">
					<tr data-code="${CART.cr_code}">
						<td>
							<img src="${rootPath}/MalangImages/${CART.it_photo}">
						</td>
						<td>${CART.it_title}<p>${CART.cr_option}</p></td>
						<td>${CART.it_seid}</td>
						<td>${CART.cr_shippingfee}</td>
						<td>${CART.cr_amout}</td>
						<td>${CART.cr_price}</td>
					</tr>
				</c:forEach>
				</c:if>
				</table>
				
				<table class="price_table">
					<tr>
						<td>작품금액</td>
						<td>배송비</td>
						<td>결제 예정금액</td>
					</tr>
					<tr>
						<!-- fetch...? -->
						<!-- 
						cartList.price + cr.price + =.. itemPrice
						cartList.shippingfee + cr.shippingfee + .. = shippingPrice
						itemPrice + shippingPrice = totalPrice
						 -->
						<td class="itemPrice">19,800 원</td>
						<td class="shippingPrice">+ 0 원</td>
						<td class="totalPrice">= 19,800 원</td>
					</tr>
				</table>
			</article>

			<form id="pay_form" class="pay_form">
				<div id="pay_inpo" class="pay_inpo">
					<article id="art_2">
						<h2>배송지 정보</h2>
						<table id="addr_table" class="addr_table">
							<tr>
								<td>주문고객</td>
								<td>${MEMBER.mb_name} (${MEMBER.mb_tel})</td>
							</tr>
							<tr>
								<td>배송지</td>
								<td><input name="od_anum" placeholder="우편번호"><br>
									<input name="od_addr" placeholder="주소" class="addr_dis">
								</td>
							</tr>
						</table>
					</article>
					<article id="art_3">
						<h2>결제 하기</h2>
						<table id="pay_table" class="addr_table">
							<tr>
								<td><input type="radio" name="pay_method" value="" checked>
								</td>
								<td><label>계좌 간편결제</label></td>
							</tr>
							<tr>
								<td><input type="radio" name="pay_method" value="">
								</td>
								<td><label>카드 간편결제</label></td>
							</tr>
							<tr>
								<td><input type="radio" name="pay_method" value="">
								</td>
								<td><label>일반결제</label></td>
							</tr>
						</table>
					</article>
				</div>
				<div class="btn_box">
					<button id="pay" type="button">결제하기</button>
				</div>
			</form>
		</article>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script src="${rootPath}/static/js/buy.js?ver=2021-06-14-001"></script>
</html>
