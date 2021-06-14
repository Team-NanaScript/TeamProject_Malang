<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/home_banner.css?ver=2021-06-11" />
</head>
<body>
<div class="today"><h4>오늘의 말랑</h4></div>
    <!-- item_wrap -->
    <section class="item_wrap">
      <!-- item_list1 -->
      <article class="item_list">
        <div class="item">
          <div class="item_img"></div>
          <div class="item_info">
            <p class="header">말랑한말랑</p>
            <div class="content">
              <h3>
                [증명사진] 큐티뽀짝한 순간들을 사진으로!
              </h3>
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
            <div class="content"><h3>[일러스트] 분위기 있는 일러스트 작업</h3></div>
          </div>
        </div>
        <div class="item">
          <div class="item_img"></div>
          <div class="item_info">
            <div class="header">일상집사</div>
            <div class="content"><h3>[캐리커쳐] 고퀄 멍냥이 초상화</h3></div>
          </div>
        </div>
      </article>
      <!-- item_list1 -->
</body>
</html>