<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
<link rel="stylesheet" href="${rootPath}/static/css/list.css?ver=2021-07-05-0002" />
</head>
<body>
	<!-- item_wrap -->
	<section class="item_wrap">
		<!-- item_list1 -->
		<article class="item_list">
		<c:forEach items="${ITEM_LIST}" var="ITEM">
			<div class="item">
				<img class="item_img" src="${rootPath}${ITEM.it_poto}">
				<div class="item_info">
					<p class="header">${ITEM.it_seid}</p>
					<div class="content">
						<h3>${ITEM.it_title}</h3>
					</div>
				</div>
			</div>	
		</c:forEach>
		</article>
		<!-- item_list1 -->
	</section>
</body>
</html>