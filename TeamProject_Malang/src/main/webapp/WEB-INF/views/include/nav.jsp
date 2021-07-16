<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<script src="https://kit.fontawesome.com/d9b9bbc6a7.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/hid_nav.css?ver=2021-06-16-001" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/header.css?ver=2021-07-08-002" />
<link href="${rootPath}/static/css/font.css" rel="stylesheet">
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

input, button{
	outline:none;
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

li a {
	font-weight: bold;
}

#hid_nav a {
	text-decoration: none;
}

</style>
<script>
var rootPath ="${rootPath}";
</script>
	<div class="h_container">
		<header>
			<a id="logo" href="${rootPath}">MALANG</a>
			<form id="text">
				<input type="text" placeholder="찾고싶은 상품을 검색하세요" class="text" />
				<button type="button">
					<i class="fas fa-search" id="icon" type="submit"></i>
				</button>
			</form>
			<div class="icon">
			<c:choose>
				<c:when test="${MEMBER.mb_role == 2 }">
					<a><i class="fas fa-user" id="manage"></i></a>
				</c:when>
				<c:otherwise>
					<a><i class="fas fa-user" id="user"></i></a>
				</c:otherwise>
			</c:choose>
			<a><i class="fas fa-shopping-cart" id="cart"></i></a>
			</div>
		</header>
		<div class="adiv">
			<nav id="one">
				<ul>
					<li class="item/0022">일러스트</li>
					<li class="item/0018">수공예</li>
					<li class="item/0013">수제간식</li>
					<li class="item/0028">반려동물용품</li>
					<li class="review">실시간 후기</li>
				</ul>
			</nav>

			<nav id="two">
				<ul>
				<c:if test="${empty MEMBER}">
					<li class="login">로그인</li>
					<li class="join">회원가입</li>
				</c:if>
				<c:if test="${not empty MEMBER}">
					<li><a>${MEMBER.mb_nickname}</a>님</li>
					<c:if test="${MEMBER.mb_role > 0}">
						<li class="insert">상품등록</li>
					</c:if>
					<li class="logout">로그아웃</li>
				</c:if>
				<li class="notice">고객센터</li>
				</ul>
			</nav>
		</div>

		<div id="hid_nav">
			<a id="logo" href="${rootPath}">MALANG</a>
			<form id="hid">
				<input type="text" placeholder="찾고싶은 상품을 검색하세요" class="hid_input" />
				<button type="button">
					<i class="fas fa-search" id="icon"></i>
				</button>
			</form>
		</div>
	</div>
<script src="${rootPath}/static/js/nav.js?ver=2021-07-12-002"></script>