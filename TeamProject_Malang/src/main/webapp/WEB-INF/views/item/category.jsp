<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 카테고리</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-07-13-001" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/category.css?ver=2021-07-14-000" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="cate_header">
		<div class="cate_name">
			<h3>${CATE_MAIN}</h3>
		</div>
		<nav id="cate_nav">
			<ul>
				<c:forEach items="${CATE_SUB}" var="SUB">
					<li class="tab <c:if test="${SUB.ct_code == cate}">active</c:if>" data-code="${SUB.ct_code}">
					<h3>${SUB.ct_name}</h3>
					</li>
				</c:forEach>
			</ul>
		</nav>
	</div>
	<%@ include file="/WEB-INF/views/include/list.jsp"%>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script>
const cate_nav = document.querySelector("nav#cate_nav")

cate_nav.addEventListener("click", (e)=>{
	let ct_code = e.target.closest("LI").dataset.code
	/* alert("여기야! " + code) */
	location.href="${rootPath}/item/" + ct_code;
})
</script>
</html>