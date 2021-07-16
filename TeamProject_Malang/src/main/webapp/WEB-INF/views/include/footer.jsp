<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
article.footer{
	margin-top:10px;
	width:100%;
	background-color:white;
	bottom:0;
}

nav.ft ul {
	position: relative;
    margin-top: -15px;
}

div.ft_nav {
	font-family: "Noto Sans KR", sans-serif;
	text-decoration: none;
	list-style: none;
	width: 100%;
	position: relative;
	border: 1px solid rgba(94, 94, 94, 0.349);
	border-top:2px solid rgba(94, 94, 94, 0.6);
	padding: 15px;
}


div.ft_nav nav {
    white-space: nowrap;
    padding-top: 15px;
    text-align: center
}

nav.ft ul a {
	list-style: none;
	font-size: 18px;
	padding: 0 20px;
	cursor: pointer;
}

nav.ft ul a:nth-of-type(1){
	border-left : 1px solid rgba(0,0,0,0.3);
	border-right: 1px solid rgba(0,0,0,0.3);
}
nav.ft ul a:nth-of-type(2){
	border-right: 1px solid rgba(0,0,0,0.3);
}
nav.ft ul a:nth-of-type(3){
	border-right: 1px solid rgba(0,0,0,0.3);
}
nav.ft ul a:nth-of-type(4){
	border-right: 1px solid rgba(0,0,0,0.3);
}


.ft_div p{
	text-align: center;	
	background-color:gray;
	color:white;
}

nav.ft a{
	color:rgba(0,0,0,0.6);
	text-decoration: none;
}


</style>

<article class="footer">
	<div class="ft_nav">
		<nav class="ft">
			<ul>
				<a href="${rootPath}/notice">공지사항</a>
				<a href="${rootPath}/advice">1:1 문의</a>
				<a href="http://naver.com">광고 문의</a>
				<a href="http://naver.com">입점 문의</a>
			</ul>
		</nav>
	</div>
	<div class="ft_div">
			<p>Copyright &copy Malang Comp. 2021 All Rights Reserved.
	</div>
</article>
