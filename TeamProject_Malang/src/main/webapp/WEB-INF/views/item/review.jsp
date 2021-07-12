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
    <link rel="stylesheet" type="text/css" href="${rootPath}/static/css/view.css?ver=2021-06-14-004" />
    <style>
		div.review-img img{
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
            <div class="review-img">
            	<img src="${rootPath}${IT.it_photo}"/>
            </div>
            <li>
              <p>${IT.it_seid}</p>
              <h3>${IT.it_title}</h3>
            </li>
            <c:forEach items="${REVIEWS[IT.it_code]}" var="RV" begin="0" end="1">
	            <li>
	              <div>${RV.mb_nickname}
	              (${RV.r_writer}) 
	              ${RV.r_score}</div>
	              <p>${RV.r_content}</p>
	            </li>
            </c:forEach>
          </ul>
		</c:forEach>
		
		
<!-- 	<ul class="review">
            <div class="review-img"></div>
            <li>
              <p>그린달</p>
              <h3>[몽글네컷] 몽글몽글하고 귀여운 4컷, 6컷 드로잉📸</h3>
            </li>
            <li>
              <div>감자칩(pot***) ★★★★★</div>
              <p>
                "그림 너무 잘받았습니다! 작가님 매우 친절하시고 답변도
                빠르세요☺️ 인생네컷을 찍었을때 마스크를 착용하고 있는것이 너무
                아쉬워서 제작을 맡겼는데 너무 만족스럽네요! 조만간 다시 찍"
              </p>
            </li>
            <li>
              <div>고구마칩(swe***) ★★★★★</div>
              <p>
                진짜 너무 마음에 들어요.. 돈쓴거 아깝지 않고 후회도 안되요☺️
                다들 어여 주문하세여!!!!😆😆
              </p>
            </li>
          </ul> -->
         
        </article>
      </section>
    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
  </body>
</html>
