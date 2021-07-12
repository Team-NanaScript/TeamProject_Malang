<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Review</title>
    <link rel="stylesheet" type="text/css" href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
    <link rel="stylesheet" type="text/css" href="${rootPath}/static/css/info.css?ver=2021-06-14-001" />
    <link rel="stylesheet" type="text/css" href="${rootPath}/static/css/view.css?ver=2021-07-12-007" />
    <style>
		div.review_img img{
	        width: 240px;
	        height: 240px;
/*	        background-repeat: no-repeat;
	
	        background-image: url("${rootPath}/static/images/ex2.png");
	        background-size: 100%; */
	      }

    </style>
  </head>
  <body>
  <%@ include file="/WEB-INF/views/include/nav.jsp"%>
    <header class="review">
      <h2>실시간 후기</h2>
    </header>
    <div id="container" class="container">

      <section>
        <article class="review-list">
        
        <c:forEach items="${ITEMS}" var="IT">
          <ul class="review">
            <div class="review_img">
            	<img src="${rootPath}${IT.it_photo}"/>
            </div>
            <li>
              <p>${IT.it_seid}</p>
              <h3 class="review_title">${IT.it_title}</h3>
            </li>
            <c:forEach items="${REVIEWS[IT.it_code]}" var="RV" begin="0" end="1">
	            <li>
	              <div>${RV.mb_nickname}
	              (${RV.r_writer}) 
	              ${RV.r_score}</div>
	              <p class="review_content">${RV.r_content}</p>
	            </li>
            </c:forEach>
          </ul>
		</c:forEach>
		
        </article>
      </section>
    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
  </body>
</html>
