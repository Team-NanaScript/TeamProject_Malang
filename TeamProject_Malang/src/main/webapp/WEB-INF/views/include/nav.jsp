<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/d9b9bbc6a7.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/hid_nav.css?ver=2021-06-16-001" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/header.css?ver=2021-06-16-003" />
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap")
	;

@font-face {
	font-family: 'TmoneyRoundWindRegular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindRegular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	position: relative;
}

i{
	cursor: pointer;
}

.fix {
	position: fixed;
	width: auto;
	animation: down 0.3s ease;
	top: 0;
	left: 0;
	right: 0;
	background-color: white;
}

@keyframes down {
	0%{
		-webkit-transform: translateY(-50%);
		transform: translateY(-50%);
	}
	
	100%{
	-webkit-transform: translateY(0%);
	transform: translateY(0%);
	}
}

</style>
</head>
<body>
	<div class="h_container">
		<header>
			<a id="logo" href="${rootPath}">MALANG</a>
			<form id="text">
				<input type="text" placeholder="찾고싶은 상품을 검색하세요" class="text" />
				<button type="submit">
					<i class="fas fa-search" id="icon" type="submit"></i>
				</button>
			</form>
			<div class="icon">
			<a><i class="fas fa-user" id="user"></i></a> 
			<a><i class="fas fa-shopping-cart" id="cart"></i></a>
			</div>
		</header>
		<div class="adiv">
			<nav id="one">
				<ul>
					<li class="cate1">일러스트</li>
					<li class="handi">수공예</li>
					<li class="handf">수제간식</li>
					<li class="animal">반려동물용품</li>
					<li class="review">실시간 후기</li>
				</ul>
			</nav>

			<nav id="two">
				<c:if test="${empty MEMBER}">
				<ul>
					<li class="login">로그인</li>
					<li class="join">회원가입</li>
					<li class="notice">고객센터</li>
				</ul>
				</c:if>
				<c:if test="${not empty MEMBER}">
				<ul>
					<li>${MEMBER.mb_id}님 반갑습니다</li>
					<li class="logout">로그아웃</li>
					<li class="notice">고객센터</li>
				</ul>
				</c:if>
			</nav>
		</div>



		<div id="hid_nav">
			<a id="logo" href="${rootPath}">MALANG</a>
			<form id="hid">
				<input type="text" placeholder="찾고싶은 상품을 검색하세요" class="hid_input" />
				<button type="submit">
					<i class="fas fa-search" id="icon"></i>
				</button>
			</form>
		</div>
	</div>

</body>
<script src="${rootPath}/static/js/nav.js?ver=2021-06-16-004"></script>
</html>