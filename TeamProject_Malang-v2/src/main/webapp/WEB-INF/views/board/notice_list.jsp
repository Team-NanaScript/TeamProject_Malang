<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<body>
	<div class="s_content">
		<a id="s_text">공지사항</a>

		<div class="sTable">

			<table class="sTable">
				<thead id="top">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>등록일</td>
						<td>조회수</td>
					</tr>
				</thead>

				<c:if test="${empty RESULT}">
					<tbody id="content">
						<c:forEach items="${BDLIST}" var="BD" varStatus="st">
							<tr>
								<td>${fn:length(BDLIST) - st.index}</td>
								<td data-seq="${BD.bd_seq}" id="seq">${BD.bd_title}<c:if
										test="${BD.count ne 0}">
										<a>(${BD.count})</a>
									</c:if>
								</td>



								<td>${BD.bd_author}</td>
								<td data-date="${BD.bd_date}">${BD.bd_date}</td>
								<td>${BD.bd_count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
				
				<c:if test="${not empty RESULT}">
				
				<tbody id="content">
						<c:forEach items="${RESULT}" var="RES" varStatus="st">
							<tr>
								<td>${fn:length(RESULT) - st.index}</td>
								<td data-seq="${RES.bd_seq}" id="seq">${RES.bd_title}
									<c:if test="${RES.count ne 0}">
								<a>(${RES.count})</a>
								</c:if>
								</td>
								
								
								
								<td>${RES.bd_author}</td>
								<td data-date="${RES.bd_date}">${RES.bd_date}</td>
								<td>${RES.bd_count}</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</c:if>
			</table>



		</div>

		<div class="s_search">
			<form>
				<select id="search">
					<option value="title" selected="selected">제목</option>
					<option value="content">내용</option>
					<option value="author">작성자</option>
				</select> <input type="text" name="keyword" id="s_input">
				<button id="s_sch" type="button" >검색</button>
				<c:if test="${MEMBER.mb_role == 2}">
					<a id="s_write">글쓰기</a>
				</c:if>
			</form>
		</div>

		<div class="num">
			<a>1</a>
		</div>
	</div>
<script>
	
document.querySelector("button#s_sch").addEventListener("click", search);
document.querySelector("div.s_search").addEventListener("keydown",()=>{
	
	if(window.event.keyCode == "13"){
		alert("enter!")
		search();
		
	}
	
})
	

function search(){

	
	let op_value = document.querySelector("select#search option:checked").value;
	let keyword = document.querySelector("input#s_input").value;

	if(op_value === "title"){
		
		location.href="${rootPath}/notice/search/title?keyword=" + keyword;
		
	}else if(op_value === "content"){
		
		location.href="${rootPath}/notice/search/content?keyword=" + keyword;
		
	}else if(op_value === "author"){
		
		location.href="${rootPath}/notice/search/writer?keyword=" + keyword;
	}
	
	location.href="${rootPath}/notice/search/"+op_value +"?keyword=" +keyword;
}



</script>