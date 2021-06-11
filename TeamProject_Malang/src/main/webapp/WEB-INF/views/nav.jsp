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

<link rel="stylesheet" type="text/css" href="${rootPath}/static/css/hid_nav.css?ver=2021-06-11-001" />
<link rel="stylesheet" type="text/css" href="${rootPath}/static/css/header.css?ver=2021-06-11-002" />
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap")
	;

@font-face {
    font-family: 'TmoneyRoundWindRegular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindRegular.woff') format('woff');
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

nav:hover {
	cursor: pointer;
}

.fix {
	position: fixed;
	width: auto;
	animation: down 0.3s ease;
	top: 0;
	/* width: 100% */
	left: 0;
	right: 0;
	background-color: white;
}

@keyframes down {
        0% {
          -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
        }
        100% {
          -webkit-transform: translateY(0);
          transform: translateY(0);
        }
      }
</style>
</head>
<body>
	<header>
		<a id="logo" href="${rootPath}">MALANG</a>
		<form id="text">
			<input type="text" placeholder="찾고싶은 상품을 검색하세요" class="text" />
			<button type="submit">
				<i class="fas fa-search" id="icon" type="submit"></i>
			</button>
		</form>
		<a href="http://naver.com"><i class="fas fa-user" id="user"></i></a> <a
			href="http://naver.com"><i class="fas fa-shopping-cart"
			id="cart"></i></a>
	</header>
	<div class="adiv">
		<nav class="a">
			<ul>
				<a href="http://naver.com">일러스트</a>
				<a href="http://google.com">수공예</a>
				<a href="http://naver.com">수제간식</a>
				<a href="http://naver.com">반려동물용품</a>
				<a href="http://naver.com">실시간 후기</a>
			</ul>
		</nav>

		<nav class="b">
			<ul>
				<a href="${rootPath}/login">로그인</a>
				<a href="http://naver.com">회원가입</a>
				<a href="http://naver.com">고객센터</a>
			</ul>
		</nav>
	</div>

	<form id="hid">
		<input type="text" placeholder="찾고싶은 상품을 검색하세요" class="hid" />
		<button type="submit">
			<i class="fas fa-search" id="icon" type="submit"></i>
		</button>
	</form>
</body>
<script src="${rootPath}/static/js/nav.js?ver=2021-06-11"></script>
</html>