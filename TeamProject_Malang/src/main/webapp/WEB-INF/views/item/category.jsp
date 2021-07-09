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
	href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/category.css?ver=2021-06-15" />
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
					<li class="tab" data-code="${SUB.ct_code}"><h3>${SUB.ct_sub}</h3></li>
				</c:forEach>
			</ul>
		</nav>
	</div>
	<%@ include file="/WEB-INF/views/include/list.jsp"%>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script>
document.querySelector("nav#cate_nav").addEventListener("click",()=>{
	let tab = ev.target.className
})
</script>
</html>