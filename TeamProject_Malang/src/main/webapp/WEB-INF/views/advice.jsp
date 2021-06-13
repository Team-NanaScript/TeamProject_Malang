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
<style>
div.sNav, div.sTable {
	display: flex;
	position: relative;
	justify-content: center;
}

div.sTable {
    width: 1000px;
    margin: 10px auto;
}

div.sNav {
	border: 1px solid gray;
}

nav.sNav {
	
}

.sNav ul {
	list-style: none;
	text-decoration: none;
	display: flex;
}

.sNav li {
	
}

table.sTable {
	border-top: 1px solid rgba(0, 0, 0, 0.2);
    width: 1000px;
    margin: 10px auto;
    padding: 5px;
    position: relative;
	border-collapse: collapse;
	top:10px;
}

thead#top {
	font-weight: bold; 
	vertical-align: middle;
}

.sTable td {
	text-align: center;
	white-space: nowrap;
	padding:6px;
	border-bottom:1px solid rgba(0, 0, 0, 0.3);
}

.num {
	justify-content:center;
	display:flex;
	margin:10px auto;
	margin-left:-60px;
}

.num a {
	border:white;
	color:white;
	background-color: rgba(0, 0, 0, 0.3);
	display: inline-block;
    min-width: 36px;
    height: 36px;
    padding-left: 10px;
    padding-right: 10px;
    font-size: 14px;
    line-height: 34px;
    text-decoration: none;
    text-align: center;
    border-radius: 500px;
    cursor:pointer;
}

.s_container{
	border:1px solid rgba(0, 0, 0, 0.2);
	width: 1200px;
    padding: 10px;
    margin:5px auto;
}

#content td:nth-of-type(1), #content td:nth-of-type(3){
	color:rgba(0, 0, 0, 0.4);
	font-size:12px;
}

#content td:nth-of-type(2){
	color:rgba(0, 0, 0, 0.6);
}

a#s_text{
	margin-left: 85px;
    padding: 5px;
    border-bottom: 3px solid rgba(235, 164, 123, 0.7);
    font-size: 28px;
    font-weight: bold;
    color:rgba(235, 164, 123, 0.993);
}

</style>
<body>
	<%@ include file="/WEB-INF/views/nav.jsp"%>
<div class="s_container">
	<a id="s_text">1:1 문의하기</a>

	<div class="sTable">

		<table class="sTable">
		<thead id="top">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>날짜</td>
		</tr>
		</thead>
		
		<tbody id="content">
		<tr>			
			<td>1</td>
			<td>이용관련 문의드립니다.</td>
			<td>2021-06-11</td>
		</tr>
		</tbody>
		</table>
		
	</div>
	
	<div class="num">
		<a>1</a>
		</div>
</div>	
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>