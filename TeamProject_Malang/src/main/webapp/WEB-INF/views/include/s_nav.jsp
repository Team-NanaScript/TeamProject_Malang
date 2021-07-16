<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
	<div class="s_nav">
		<nav>
			<ul>
				<li id="notice">&nbsp;&nbsp;&nbsp;공지사항&nbsp;&nbsp;&nbsp;</li>
				<li id="advice">1:1 문의하기</li>
				<li id="ask">자주하는 질문</li>
			</ul>
		</nav>
	</div>

<script>
document.addEventListener("DOMContentLoaded",(e)=>{
	
	let path = document.location.pathname;
	let sch_Root = "${rootPath}/notice/search"
	if(path == "${rootPath}/notice" || path == sch_Root + "/title" || path == sch_Root + "/content" || path == sch_Root + "/writer"){
		document.querySelector("#notice").classList.add("on");
	}
	else if(path == "${rootPath}/advice"){
		document.querySelector("#advice").classList.add("on");
	}
	
	document.querySelector(".s_nav").addEventListener("click", (ev)=>{
	
		let iName = ev.target.id;
		if(iName === "notice"){
			location.href="${rootPath}/notice"
		} else if(iName === "advice"){
			location.href="${rootPath}/advice"
		} else if(iName === "ask"){
			alert("준비중입니다!!!")
		}
	});
	
	
});

</script>