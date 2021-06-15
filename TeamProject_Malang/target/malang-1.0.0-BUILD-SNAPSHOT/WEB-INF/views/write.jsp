<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	display: flex;
	flex-direction: column;
	width: 100%;
	height: 100vh;
}

div.w_container {
	display: flex;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="w_container"></div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>