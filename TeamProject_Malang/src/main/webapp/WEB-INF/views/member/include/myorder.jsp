<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<style>
article.order_container, table.order_table {
	width:1056px;
	margin: 2px auto;
}

article.order_container table.order_table th, td {
	border-top: 1px solid #aaa;
	padding: 10px;
	max-width: 500px;

	text-align: center;
}
article.order_container table.order_table th {
	background-color: #ccc;
}
</style>
<article class="order_container">
	<table class="order_table">
	<c:if test="${empty MYORDER}">
	<tr>
		<td colspan="4">구매 목록이 없습니다</td>
	</tr>
	</c:if>
	<c:if test="${not empty MYORDER}">
		<tr>
			<th>주문번호</th>
			<th>상품이름</th>
			<th>상품옵션</th>
			<th>가격</th>
			<th></th>
		</tr>
	<c:forEach items="${MYORDER}" var="MYO">
	<tr data-code="${MYO.od_code}">
		<td>${MYO.od_code}</td>
		<td>${MYO.it_title}</td>
		<td>${MYO.od_option}</td>
		<td>${MYO.od_price}</td>
		<td><c:if test="${empty MYO.od_rcode}"><button class="review" type="button">리뷰작성</button></c:if></td>
	</tr>
	
	</c:forEach>
	
	</c:if>
	</table>
</article>

<script>
	document.querySelector("table.order_table").addEventListener("click", (e)=>{
		let targetClass = e.target.className
		
		if(targetClass == "review"){
		
			let r_code = e.target.closest("TR").dataset.code
			location.href = "${rootPath}/info/"+targetClass+"/"+r_code	
			
			// alert("버튼이얌 " + r_code)
		}	
		
		
	})
</script>