<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
	img{
		background-size:cover;
	}
</style>
<body>
	<div>
		<table>
			<tr>
				<th>상품코드</th>
				<th>상품이름</th>
				<th>가격</th>
				<th>이미지</th>
				<th></th>
			</tr>	
			<c:forEach items="${ITLIST}" var="IT">
			<tr data-code="${IT.it_code}" id="items">
				<td>${IT.it_code}</td>
				<td>${IT.it_title}</td>
				<td>${IT.it_price}</td>
				<td><img src="${rootPath}/MalangImages/${IT.it_photo}"></td>
				<td><button id="item_delete">삭제</button></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
<script>
document.querySelector("table").addEventListener("click",(e)=>{

	let id = e.target.id
	
	if(id == 'item_delete'){
		
		let it_code =  e.target.closest("TR").dataset.code
		
		fetch("${rootPath}/mypage/items/delete?it_code=" + it_code)
		.then(res=>response.text())
		.then(result=>{
			
			if(result == "OK"){
				alert("삭제 완료 !!")
			} else if (result == "NO"){
				alert("오류 !! 삭제 실패 ")				
			}
			
		})
	}
	
	
	
	
	
})
</script>
