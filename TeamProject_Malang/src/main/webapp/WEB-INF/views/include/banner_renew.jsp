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
	href="${rootPath}/static/css/banner.css?ver=2021-06-28" />
<script src="${rootPath}/static/js/banner.js?ver=2021-06-28"></script>
</head>
<body>
	 <section class="banner">
      <div class="mask">
        <div class="images">
          <img src="${rootPath}/static/images/slide_page1.png" />
          <img src="${rootPath}/static/images/slide_page2.png" />
          <img src="${rootPath}/static/images/slide_page3.png" />
        </div>
      </div>
      <article class="textbox">
        <div>
          <p>말랑 정식 오픈</p>
          <h3>제작한 상품을</h3>
          <h3>만나보세요!</h3>
          <h3>이미지랑 배경 아직 작업중</h3>
        </div>
        <div>
          <p>말랑한 말랑</p>
          <h3>말랑한 순간을</h3>
          <h3>말랑하세요!</h3>
          <h3>이미지랑 배경 아직 작업중</h3>
        </div>
        <div>
          <p>우리집 멍냥이를 위한</p>
          <h3>하나뿐인 작품!</h3>
          <h3>이미지랑 배경 아직 작업중</h3>
        </div>
      </article>
      <article class="nav">
        <div>&lt;</div>
        <div>&gt;</div>
      </article>
    </section>
</body>
</html>