<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
nav.ft ul {
	position: relative;
	display: flex;
	left: -140px;
	width: 100%;
	padding: 1px;
}

div.ft_nav {
	font-family: "Noto Sans KR", sans-serif;
	text-decoration: none;
	list-style: none;
	height: 0px;
	width: 100%;
	display: flex;
	position: relative;
	justify-content: center;
	border: 1px solid rgba(94, 94, 94, 0.349);
	border-top:2px solid rgba(94, 94, 94, 0.6);
	padding: 25px;
}


div.ft_nav nav {
	display:flex;
	margin-top: -15px;
}

nav.ft ul a {
	list-style: none;
	justify-content: center;
	font-size: 18px;
}

nav.ft ul a:nth-of-type(1){
	border:1px solid rgba(0,0,0,0.3);
	border-left:none;
	border-top:none;
	border-bottom:none;
}
nav.ft ul a:nth-of-type(2){
	border:1px solid rgba(0,0,0,0.3);
	border-right:none;
	border-top:none;
	border-bottom:none;
}
nav.ft ul a:nth-of-type(3){
	border:1px solid rgba(0,0,0,0.3);
	border-right:none;
	border-top:none;
	border-bottom:none;
}
nav.ft ul a:nth-of-type(4){
	border:1px solid rgba(0,0,0,0.3);
	border-right:none;
	border-top:none;
	border-bottom:none;
}


</style>
</head>
<body>
	<div class="ft_nav">
		<nav class="ft">
			<ul>
				<a href="http://naver.com">공지사항</a>
				<a href="http://google.com">고객센터</a>
				<a href="http://naver.com">1:1 문의</a>
				<a href="http://naver.com">광고 문의</a>
			</ul>
		</nav>
	</div>
</body>
</html>