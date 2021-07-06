<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${rootPath}/static/css/list.css?ver=2021-07-05-0002" />
<section class="item_section">
	<!-- item_list1 -->
	<c:forEach items="${ITEM_LIST}" var="ITEM">
		<div class="item_content" data-code="${ITEM.it_code}">
			<img src="${rootPath}${ITEM.it_poto}" />
			<div>
				<p class="item nick_name">${ITEM.it_seid}</p>
				<h3 class="item title">${ITEM.it_title}</h3>
				<p class="item price">${ITEM.it_price}원</p>
			</div>
		</div>
	</c:forEach>
</section>
<!-- <script src="${rootPath}/static/js/"></script> -->