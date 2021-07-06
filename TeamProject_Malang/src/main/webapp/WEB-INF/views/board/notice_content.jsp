<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	tbody#content td a{
		font-weight: normal;
		color:rgba(235, 164, 123, 0.993);
	}
</style>
</head>
<body>
	<div class="s_content">
			<a id="s_text">공지사항</a>

			<div class="sTable">

				<table class="sTable">
					<thead id="top">
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>등록일</td>
						</tr>
					</thead>

					<tbody id="content">
						<c:forEach items="${BDLIST}" var="BD" varStatus="st">
							<tr>
								<td>${fn:length(BDLIST) - st.index}</td>
								<td data-seq="${BD.bd_seq}" id="seq">${BD.bd_title}
									<c:if test="${BD.count ne 0}">
								<a>(${BD.count})</a>
								</c:if>
								</td>
								
								
								
								<td>${BD.bd_author}</td>
								<td>${BD.bd_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>

			<div class="s_search">
				<form method="post">
					<input type="text">
					<button id="s_sch" type="submit">검색</button>
					<c:if test="${MEMBER.mb_role == 2}">
						<a id="s_write">글쓰기</a>
					</c:if>
				</form>
			</div>

			<div class="num">
				<a>1</a>
			</div>
		</div>
</body>
</html>