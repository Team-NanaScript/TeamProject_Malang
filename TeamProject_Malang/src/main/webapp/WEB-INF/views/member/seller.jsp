<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<style>
header.mypage {
	width:100%;
	height:144px;
	background-color: #9e6e4e;
	display: flex;
	flex-direction: column;
	margin:0 auto;
}

header.mypage h2{
	color:white;
	font-size: 30px;
	width: 1056px;
	margin: 0 auto;
	padding-left: 10px;
	line-height: 6rem;
	background-color: #9e6e4e;
}

nav#mypage_nav {
	display: flex;
	width: 1056px;
	margin: 0 auto;
	align-items: flex-end;
}

nav#mypage_nav ul {
	display: flex;
	align-items: flex-end;
}

nav#mypage_nav li {
	background-color: #DEBA9B;
	font-size: 15px;
	width: 140px;
	height: 48px;
	line-height: 48px;
	margin-left: 5px;
	text-align: center;
	cursor: pointer;
	list-style: none;
}

nav#mypage_nav li:nth-of-type(1) {
	margin-left: 10px;
}

nav#mypage_nav li.active {
	background-color: white;
}
body{
		display: flex;
    	flex-direction: column;
    	width: 100%;
    	height: 100vh;
	}
	
</style>
<script>
let msg = "${MSG}";

if(msg == "REJECT"){
	alert("로그인이 필요한 서비스입니다")
	location.href="${rootPath}/login"
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<header class="mypage">
	<h2>상품 관리 페이지</h2>
	<nav id="mypage_nav">
			<ul>
				<li id="itemList" class="tab
				<c:if test="${BODY == 'ITEM_LIST'}">
				active</c:if>">상품 관리</li>
				<li	id="itemInsert" class="tab
				<c:if test="${BODY == 'ITEM_INSERT'}">
				active</c:if>">상품 등록</li>
			</ul>
		</nav>
</header>
	<section>
		<c:choose>
			<c:when test="${BODY == 'ITEM_LIST' }">
			<%@ include file="/WEB-INF/views/member/my_item_list.jsp"%>
			</c:when>
			<c:when test="${BODY == 'ITEM_INSERT' }">
			<%@ include file="/WEB-INF/views/item/insert.jsp"%>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>

<script>
document.querySelector("nav#mypage_nav").addEventListener("click", (e)=>{
	const nav_tab = e.target.closest("LI").id
	location.href = "${rootPath}/seller/" + nav_tab;
	})
</script>
</html>