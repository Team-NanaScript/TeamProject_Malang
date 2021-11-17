<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>말랑 - 후기작성</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/insert.css?ver=2021-07-19-001" />
<style>

	.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('${rootPath}/static/icons/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
	}
	
	.rating .rate_radio:checked + label {
	    background-color: rgba(235, 164, 123, 0.9);
	}
	
	/* 레이아웃 외곽 너비 400px 제한*/
	.wrap{
	    max-width: 480px;
	    margin: 0 auto; /* 화면 가운데로 */
	    background-color: #fff;
	    height: 100%;
	    padding: 20px;
	    box-sizing: border-box;
	
	}
	.reviewform textarea{
	    width: 100%;
	    padding: 10px;
	    box-sizing: border-box;
	}
	.rating .rate_radio {
	    position: relative;
	    display: inline-block;
	    z-index: 20;
	    opacity: 0.001;
	    width: 60px;
	    height: 60px;
	    background-color: #fff;
	    cursor: pointer;
	    vertical-align: top;
	    display: none;
	}

	.warning_msg {
    display: none;
    position: relative;
    text-align: center;
    background: #ffffff;
    line-height: 26px;
    width: 100%;
    color: red;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #e0e0e0;
	}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="container">
	<h1 class="title">후기작성</h1>
	
	<form id="review_insert" class="insert" method="POST">
		<div>
			<label>작성자 ID</label>
			<input class="short" name="r_writer"  value="${MEMBER.mb_id}" readonly/>
		</div>
		<div>
			<label>상품명</label>
			<input class="long" name="it_title" value="${ITEM.it_title}" disabled/>
			<input type="hidden" name="r_itcode" value="${ITEM.it_code}"/>
		</div>
		<div>
			<label>상품옵션</label>
			<input class="long" name="r_odoption" value="${ORDER.od_option}" readonly/>
		</div>
		<div>
			<label>평점</label>	
	        <input type="hidden" name="r_score" id="rate" value="0"/>
	        <div class="review_rating">
	            <div class="warning_msg">평점을 선택해 주세요.</div>
	            <div class="rating">
	                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
	                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
	                <label for="rating1"></label>
	                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
	                <label for="rating2"></label>
	                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
	                <label for="rating3"></label>
	                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
	                <label for="rating4"></label>
	                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
	                <label for="rating5"></label>
	            </div>
	        </div>
        </div>	
		
		<div>
		<label>내용</label>
		<textarea id="r_content" name="r_content" 
			maxlength="1000" required="required" cols="100" rows="30"
			placeholder="후기를 입력하세요"></textarea>
		</div>
        <div class="btn_box">
            <button type="button" id="btn_save">등록하기</button>
        </div>    
	</form>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script src="${rootPath}/ne2/js/service/HuskyEZCreator.js" charset="UTF-8"></script> 

<script>

//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});


//저장 전송전 필드 체크 이벤트 리스너
document.querySelector('#btn_save').addEventListener('click', function(e){
    //별점 선택 안했으면 alert
    if(rating.rate == 0){
        alert("평점을 선택해주세요.")
        return false;
    }
    //리뷰 10자 미만시 alert
    if(document.querySelector('#r_content').value.length < 10){
       	alert("10자 이상 작성해주세요.")
        return false;
    }
    //submit
    
    document.querySelector("form#review_insert").submit();
});

</script>
</html>