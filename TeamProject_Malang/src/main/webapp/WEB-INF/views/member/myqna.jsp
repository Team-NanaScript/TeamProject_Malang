<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의글 보기</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-07-15-000" />
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<article>
<h2>내 문의글 보기</h2>
<table>

<c:if test="${empty MYQNA}">
	<tr>
		<td colspan="3">작성한 문의글이 없습니다.</td>
	</tr>
</c:if>

<c:if test="${not empty MYQNA}">
	<tr>
		<th>상품이름</th>
		<th>제목</th>
		<th>등록일</th>
	</tr>
<c:forEach items="${MYQNA}" var="MYQ">
	<tr data-seq="${MYQ.q_code}">
		<td>${MYQ.it_title}</td>
		<td>${MYQ.q_title}</td>
		<td>${MYQ.q_date}</td>
	</tr>
</c:forEach>

</c:if>
</table>
</article>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>