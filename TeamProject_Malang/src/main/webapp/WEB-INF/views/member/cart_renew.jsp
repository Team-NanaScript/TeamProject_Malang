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
header.cart {
	width: 100%;
	height: 144px;
	background-color: #707070;
	margin: 0 auto;
}

header.cart h2{
	color:white;
	font-size: 30px;
	width: 1056px;
	margin: 0 auto;
	padding-left: 10px;
	line-height: 6rem;
	background-color: #707070;
}

article.discription {
	width:1056px;
	margin:10px auto;
}

article.discription table.question {
	width:95%;
	margin:0 auto;
}

table th{
	font-size:18px;
	padding:10px 5px;
	background-color: #ccc;
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
<header class="cart">
	<h2>주문/결제</h2>
</header>

	<div class="container">

		<article id="discription" class="discription">
			<article id="art_1">

				<table id="question" class="question">
				<tr>
					<th colspan="2">상품정보</th>
					<th>판매자</th>
					<th>배송비</th>
					<th>수량</th>
					<th>상품금액</th>
					<th></th>
				</tr>
				<c:if test="${empty CART_LIST}">
					<tr>
						<td colspan="7">장바구니에 담은 제품이 없습니다!</td>
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
						<td>${CART.cr_amount}</td>
						<td>${CART.cr_price}</td>
						<td><button type="button" class="delete">삭제</button></td>
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
						<td>${itemPrice}</td>
						<td>+ ${shippingPrice}</td>
						<td>= ${totalPrice}</td>
					</tr>
				</table>
			</article>

			<form id="pay_form" class="pay_form">
				<div id="pay_info" class="pay_info">
					<article id="art_2">
						<h2>배송지 정보</h2>
						<table id="addr_table" class="addr_table">
							<tr>
								<th>주문고객</th>
								<td>${MEMBER.mb_name} (${MEMBER.mb_tel})</td>
							</tr>
							<tr>
								<th>배송지</th>
								<td><input name="od_anum" placeholder="우편번호"><br>
									<input name="od_addr" placeholder="주소" class="addr_dis">
								</td>
							</tr>
						</table>
					</article>
					<article id="art_3">
						<div class="btn_box">
							<button id="pay" type="button">결제하기</button>
						</div>
					</article>
				</div>
			</form>
			
		</article>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script>
let cart_form = document.querySelector("form#pay_form")
const payButton = document.querySelector("button#pay")
const anumInput = document.querySelector("input[name='od_anum']")
const addrInput = document.querySelector("input[name='od_addr']")

payButton.addEventListener("click", ()=> {
	let anumValue = anumInput.value
	let addrValue = addrInput.value
	if(anumValue == null || anumValue == "") {
		alert("please input your address number!")
		anumInput.focus();
		return false;
	} else if(addrValue == null || addrValue == "") {
		alert("please input your address!")
		addrInput.focus();
		return false;
	}
	
	if(confirm("구매하시겠습니까?")){
		cart_form.submit()
	}
	
})

document.querySelector("table#question").addEventListener("click", (e)=>{
	let btnClass = e.target.className
	
	if( btnClass == 'delete' ){
		let code = e.target.closest("TR").dataset.code
		
		fetch("${rootPath}/mypage/cart/delete?cr_code="+code)
		.then(res=>res.text()).then(result=>{
			
			if(result == "OK"){
				alert("장바구니에서 삭제되었습니다.")
				location.reload(true)
			} else {
				alert("삭제 실패")
			}
			
		})
	}
})

</script>
<script src="${rootPath}/static/js/buy.js?ver=2021-06-14-001"></script>
</html>
