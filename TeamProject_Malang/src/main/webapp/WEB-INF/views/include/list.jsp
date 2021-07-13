<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${rootPath}/static/css/list.css?ver=2021-07-13-011" />
<script>
var rootPath = "${rootPath}"
</script>
<section class="item_section">
	<!-- item_list1 -->
	<c:if test="${empty ITEM_LIST}">
		<div class="item_content empty">
			<h2>상품 정보가 없습니다.</h2>
		</div>
	</c:if>
	<c:if test="${not empty ITEM_LIST}">
	<c:forEach items="${ITEM_LIST}" var="ITEM">
		<div class="item_content" data-code="${ITEM.it_code}">
			<img src="${rootPath}/MalangImages/${ITEM.it_photo}" />
			<p class="item nick_name">${ITEM.it_seid}</p>
			<h3 class="item title">${ITEM.it_title}</h3>
			<p class="item price">${ITEM.it_price}원</p>
		</div>
	</c:forEach>
	</c:if>
</section>
<script src="${rootPath}/static/js/list.js?ver=2021-07-13-002"></script>