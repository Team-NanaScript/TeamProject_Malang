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
    <title>Buy</title>
    <link rel="stylesheet" type="text/css" href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
    <link rel="stylesheet" type="text/css" href="${rootPath}/static/css/info.css?ver=2021-06-14-001" />
    <link rel="stylesheet" type="text/css" href="${rootPath}/static/css/buy.css?ver=2021-06-14-001" />
    <style>
   		div.review_img1 {
	        background-image: url("${rootPath}/static/images/ex1.png");
     	 }
    </style>
    <script src="${rootPath}/static/js/buy.js?ver=2021-06-14-001"></script>
    

  </head>

  <body>
    <%@ include file="/WEB-INF/views/include/nav.jsp" %>
    <div class="container">
     
      <article id="discription" class="discription">
        <article id="art_1">
          <h2>주문/결제</h2>
          <table id="question" class="question">
            <th colspan='2'>상품정보</th>
            <th>판매자</th>
            <th>배송비</th>
            <th>수량</th>
            <th>상품금액</th>
            <tr>
              <td>
                <div class="review_img1"></div>  
              </td>
              <td>🥐🍩와플 속에 쏙! 귀여운 일러스트🥐🍩</td>
              <td>맴맴 작가</td>
              <td>0 원</td>
              <td>1 개</td>
              <td>9,900 원</td>
            </tr>
            <tr>
              <td>
                <div class="review_img1"></div>  
              </td>
              <td>🥐🍩와플 속에 쏙! 귀여운 일러스트🥐🍩</td>
              <td>맴맴 작가</td>
              <td>0 원</td>
              <td>1 개</td>
              <td>9,900 원</td>
            </tr>
          </table>
            <table class="price_table">
              <tr>
                <td>작품금액</td>
                <td>배송비</td>
                <td>결제 예정금액</td>
              </tr>
              <tr>
                <td>19,800 원</td>
                <td>+ 0 원</td>
                <td>= 19,800 원</td>
              </tr>
            </table>
        </article>


        <form id="pay_form" class="pay_form">
        <div id="pay_inpo" class="pay_inpo">
          <article id="art_2">
            <h2>배송지 정보</h2>
            <table id="addr_table" class="addr_table">
              <tr>
                <td>주문고객</td>
                <td>김만두 (010-0000-0000)</td>
              </tr>
              <tr>
                <td>받는 사람</td>
                <td>
                  <input name="receiver">
                </td>
              </tr>
              <tr>
                <td>전화번호</td>
                <td>
                  <input name="tel">
                </td>
              </tr>
              <tr>
                <td>배송지</td>
                <td>
                  <input name="addr_num" placeholder="우편번호"><br>
                  <input name="addr_dis" placeholder="주소" class="addr_dis">
                </td>
              </tr>
            </table>
          </article>
          <article id="art_3">
            <h2>결제 수단</h2>
            <table id="pay_table" class="addr_table">
              <tr>
                <td>
                  <input type="radio" name="pay_method" value="" checked> 
                </td>
                <td>
                  <label>계좌 간편결제</label>
                </td>
              </tr>
              <tr>
                <td>
                  <input type="radio" name="pay_method" value="" >
                </td>
                <td>
                  <label>카드 간편결제</label>
                </td>
              </tr>
              <tr>
                <td>
                  <input type="radio" name="pay_method" value="" >
                </td>
                <td>
                  <label>일반결제</label>
                </td>
              </tr>
            </table>
          </article>
        </div>
        <div class="btn_pay">
          <button type="button">
            결제하기
          </button>
        </div>
        </form>
      </article>
    </div>
  </div>
  <%@ include file="/WEB-INF/views/include/footer.jsp" %>
  </body>
</html>
