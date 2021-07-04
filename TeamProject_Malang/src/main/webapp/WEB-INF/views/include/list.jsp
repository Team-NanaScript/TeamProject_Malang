<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
<link rel="stylesheet" href="${rootPath}/static/css/list.css?ver=2021-06-14-2000" />
<style>
section.item_wrap .item_list .item:nth-child(1) .item_img {
	background: url('${rootPath}/static/images/ex2.png') no-repeat;
	background-size: 100%;
}

section.item_wrap .item_list .item:nth-child(2) .item_img {
	background: url('${rootPath}/static/images/slide_img1.png') no-repeat;
	background-size: 100%;
}

section.item_wrap .item_list .item:nth-child(3) .item_img {
	background: url('${rootPath}/static/images/slide_img4.png') no-repeat;
	background-size: 125%;
}

section.item_wrap .item_list .item:nth-child(4) .item_img {
	background: url('${rootPath}/static/images/slide_img5.png') no-repeat;
	background-size: 100%;
}
</style>
</head>
<body>
	<!-- item_wrap -->
	<section class="item_wrap">
		<!-- item_list1 -->
		<article class="item_list">
			<div class="item">
				<img class="item_img" src="${rootPath}${ITEM.it_image}">
				<div class="item_info">
					<p class="header">${ITEM.it_}</p>
					<div class="content">
						<h3>🥐🍩와플 속에 쏙! 귀여운 일러스트🥐🍩</h3>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="item_img"></div>
				<div class="item_info">
					<div class="header">냥덕성덕</div>
					<div class="content">
						<h3>나만의 냥냥한 포토앨범</h3>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="item_img"></div>
				<div class="item_info">
					<div class="header">아티스트릿</div>
					<div class="content">
						<h3>[일러스트] 분위기 있는 일러스트 작업</h3>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="item_img"></div>
				<div class="item_info">
					<div class="header">일상집사</div>
					<div class="content">
						<h3>[캐리커쳐] 고퀄 멍냥이 초상화</h3>
					</div>
				</div>
			</div>
		</article>
		<!-- item_list1 -->
	</section>
</body>
</html>