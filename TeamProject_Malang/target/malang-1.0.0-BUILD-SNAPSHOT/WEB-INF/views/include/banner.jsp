<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Slide BannerV1</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/home_banner.css?ver=2021-06-11" />
<style>

.section .left {
	left: 30px;
	background: url('${rootPath}/static/icons/track.png') center center/100% no-repeat;
}

.section .right {
	right: 30px;
	background: url('${rootPath}/static/icons/track.png') center center/100% no-repeat;
}
</style>
</head>
<body>
	<div class="section">
		<input type="radio" name="slide" id="slide01" checked> <input
			type="radio" name="slide" id="slide02"> <input type="radio"
			name="slide" id="slide03">
		<div class="slidewrap">

			<!-- 슬라이드 영역 -->
			<ul class="slidelist">

				<!-- 슬라이드 아이템 -->
				<li class="slideitem">
				<a>
					<div class="textbox">
						<p>말랑 정식 오픈</p>
						<h3>제작한 상품을</h3>
						<h3>만나보세요!</h3>
					</div> <img src="${rootPath}/static/images/slide_page1.png">
				</a>
				</li>
				<li class="slideitem">
				<a>
					<div class="textbox">
						<p>말랑한 말랑</p>
						<h3>말랑한 순간을</h3>
						<h3>말랑하세요!</h3>
					</div> <img src="${rootPath}/static/images/slide_page2.png">
				</a>
				</li>
				<li class="slideitem">
				<a>
					<div class="textbox">
						<p>우리집 멍냥이를 위한</p>
						<h3>하나뿐인 작품!</h3>
					</div> <img src="${rootPath}/static/images/slide_page3.png">
				</a>
				</li>
				<!-- 슬라이드 아이템 -->

				<!-- 좌,우 슬라이드 버튼 -->
				<div class="slide-control">
					<div>
						<label for="slide03" class="left"></label>
						<label for="slide02" class="right"></label>
					</div>
					<div>
						<label for="slide01" class="left"></label>
						<label for="slide03" class="right"></label>
					</div>
					<div>
						<label for="slide02" class="left"></label>
						<label for="slide01" class="right"></label>
					</div>
				</div>
				<!-- 좌,우 슬라이드 버튼 -->
			</ul>
			<!-- 슬라이드 영역 -->
		</div>
	</div>
</body>
</html>