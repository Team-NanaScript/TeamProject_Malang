<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>말랑말랑해요</title>
<link rel="stylesheet" type="text/css" href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<%@ include file="/WEB-INF/views/include/banner_renew.jsp" %>
<%@ include file="/WEB-INF/views/include/home_list.jsp" %>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>