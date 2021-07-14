<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 후기글 보기</title>
</head>
<body>

<article>
<h2>내 후기글 보기</h2>
<table>

<c:if test="${empty MYREVIEW}">
	<tr>
		<td colspan="4">작성한 후기글이 없습니다.</td>
	</tr>
</c:if>

<c:if test="${not empty MYREVIEW}">
	<tr>
		<th>상품사진</th>
		<th>후기</th>
		<th>등록일</th>
		<th>평점</th>
	</tr>
<c:forEach items="${MYREVIEW}" var="MYR">
	<tr data-seq="${MYR.r_code}">
		<td>${MYR.it_photo}</td>
		<td>${MYR.r_content}</td>
		<td>${MYR.r_date}</td>
		<td>${MYR.r_score}</td>
	</tr>
</c:forEach>

</c:if>
</table>
</article>
</body>
</html>