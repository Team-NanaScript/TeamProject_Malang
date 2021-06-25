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
div.s_nav {
	display: flex;
	font-family: "Noto Sans KR", sans-serif;
	text-decoration: none;
	padding: 5px;
	position: relative;
	top: 11px;
	left: -45px;
}

div.s_nav ul {
	list-style: none;
	display: flex;
}

div.s_nav ul li {
	padding: 10px;
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-bottom: none;
	text-align: center;
}

div.s_nav ul li:hover {
	background-color: rgba(235, 164, 123, 0.993);
	color: white;
	font-weight: bold;
	transition: 0.3s ease;
	cursor: pointer;
}


.on {
	background-color: rgba(235, 164, 123, 0.993);
	color: white;
	font-weight: bold;
	border:none;
}
</style>
</head>
<body>
	<div class="s_nav">
		<nav>
			<ul>
				<li id="notice">&nbsp;&nbsp;&nbsp;공지사항&nbsp;&nbsp;&nbsp;</li>
				<li id="advice">1:1 문의하기</li>
				<li id="ask">자주하는 질문</li>
			</ul>
		</nav>
	</div>
</body>

<script>
document.addEventListener("DOMContentLoaded",(e)=>{
	
	let path = document.location.pathname;
	if(path === "${rootPath}/notice"){
		document.querySelector("#notice").classList.add("on");
	}
	else if(path === "${rootPath}/advice"){
		document.querySelector("#advice").classList.add("on");
	}
	
	document.querySelector(".s_nav").addEventListener("click", (ev)=>{
	
		let iName = ev.target.id;
		if(iName === "notice"){
			location.href="${rootPath}/notice"
		} else if(iName === "advice"){
			location.href="${rootPath}/advice"
		} else if(iName === "ask"){
			alert("준비중입니다!!!")
		}
	});
	
	
});

</script>
</html>