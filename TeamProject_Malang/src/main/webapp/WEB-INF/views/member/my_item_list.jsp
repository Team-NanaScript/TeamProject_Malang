<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
	img{
		background-size:cover;
		width:150px;
	}
	
	table.my_item{
		border-collapse: collapse;
		width: 85%;
		text-align: center;
	}
	
	table.my_item td, table.my_item th{
		border:1px solid rgba(0,0,0,0.2);
	} 
	table.my_item th{
		border-top:1px solid rgba(0,0,0,0.7);
		background-color: rgba(235, 164, 123, 0.993);
		color:white;
	}
	table.my_item td{
		color:rgba(0,0,0,0.7);
	}
	div.items{
		display:flex;
		justify-content: center;
		width: 1056px;
    	margin: 0 auto;
	}
	button#item_delete{
		outline:none;
		border:none;
		background-color: rgba(235, 164, 123, 0.993);
		cursor:pointer;
		color:white;
		
	}
</style>
<body>
	<div class="items">
		<table class="my_item">
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
		alert(it_code)
		
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
		
		fetch("${rootPath}/mypage/items/delete?it_code=" + it_code)
		.then(res=>res.text())
		.then(result=>{
			
			if(result == "OK"){
				alert("삭제 완료 !!")
				location.reload(true)
			} else if (result == "NO"){
				alert("오류 !! 삭제 실패 ")				
			}
			
		})
	}
	
	
	
	
	
})
</script>
