<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/category.css?ver=2021-06-15" />
<script>
let msg = "${MSG}";
if(msg === "REJECT") {
	alert("접근 권한이 없습니다.")
	location.href="${rootPath}";
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<h1>관리자 계정 회원관리</h1>
<c:if test="${not empty M_MEMBER}">
	<c:forEach items="${M_MEMBER}" var="M">
	<div>
		<label>ID</label>
		<p>${M.mb_id}</p>
	</div>
	<div>
		<label>ID</label>
		<p>${M.mb_role}</p>
	</div>
	</c:forEach>
</c:if>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>