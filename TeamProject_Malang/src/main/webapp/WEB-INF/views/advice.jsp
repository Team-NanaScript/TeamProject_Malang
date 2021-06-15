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
<link rel="stylesheet" href="${rootPath}/static/css/customer.css">
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="s_container">
		<%@ include file="/WEB-INF/views/include/s_nav.jsp"%>
		<div class="s_content">
			<a id="s_text">1:1 문의하기</a>

			<div class="sTable">

				<table class="sTable">
					<thead id="top">
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>등록일</td>
						</tr>
					</thead>

					<tbody id="content">
						<tr>
							<td>3</td>
							<td>결제가 안됩니다!!</td>
							<td>2021-06-13</td>
						</tr>
					
						<tr>
							<td>2</td>
							<td>이용관련 문의드립니다.</td>
							<td>2021-06-11</td>
						</tr>
						
						<tr>
							<td>1</td>
							<td>배송이 너무 늦어요</td>
							<td>2021-06-13</td>
						</tr>
					</tbody>
				</table>

			</div>

			<div class="num">
				<a>1</a>
			</div>

		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>