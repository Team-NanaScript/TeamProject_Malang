<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${rootPath}/static/css/list.css?ver=2021-07-12-001" />
<style>
section.item_section {
justify-content: space-around;
}
</style>
<div class="today"><h3>오늘의 말랑</h3></div>
<%@ include file="/WEB-INF/views/include/list.jsp" %>