<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
<link rel="stylesheet"
	href="${rootPath}/static/css/list.css?ver=2021-07-12-002" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="search_header">
		<div class="header_wrap">
			<h3>${keyword}</h3>
			<p>에 대한 검색결과</p>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/list.jsp"%>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>