<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>말랑</title>
<style>
	body{
		display:flex;
		flex-direction: column;
		width:100%;
		height:100vh;
	}
	
	section{
		flex:auto;
	}
</style>
=======
<title>말랑말랑해요</title>
<link rel="stylesheet" type="text/css" href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
>>>>>>> d76a29018a76a920ae0087cc3c9b4c8703a50b38
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<section>
<%@ include file="/WEB-INF/views/include/banner.jsp" %>
<<<<<<< HEAD
</section>
=======
<%@ include file="/WEB-INF/views/include/home_list.jsp" %>
>>>>>>> d76a29018a76a920ae0087cc3c9b4c8703a50b38
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>