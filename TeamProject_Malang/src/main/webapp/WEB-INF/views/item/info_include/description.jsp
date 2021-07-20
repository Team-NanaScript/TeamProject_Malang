<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<article id="description" class="description">
	<article id="art_1">
		<div>
			${ITEM.it_content}<br>
		</div>
	</article>
	<article id="art_2">
		<h2>배송/교환/환불</h2>

		<table id="delivery" class="delivery">
			<tr>
				<td>배송비</td>
				<td>${DESC.de_shippingfee}
				</td>
			</tr>
			<tr>
				<td>제작/배송</td>
				<td>${DESC.de_shipping}
				</td>
			</tr>
			<tr>
				<td>교환/환불</td>
				<td>${DESC.de_refund}
				</td>
			</tr>
		</table>
	</article>
	<article id="art_3">
		<h2>구매후기</h2>

		<table id="review" class="review">
			<tr>
				<th>구매자</th>
				<th>후기</th>
				<th>등록일</th>
				<th>평점</th>
			</tr>
			<c:choose>
				<c:when test="${empty REVIEWS}">
					<tr>
						<td colspan="4">첫 후기를 남겨보세요!</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${REVIEWS}" var="RV">
						<tr data-rcode="${RV.r_code}">
							<td>${RV.mb_nickname}<br/>
								<p>(${RV.r_writer})</p>
							</td>
							<td>
								<div>${RV.r_content}</div>
							</td>
							<td>${RV.r_date}</td>
							<td>${RV.r_score}
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>


		</table>
	</article>
	<article id="art_4">
		<h2>문의 및 답변</h2>

		<table id="question" class="question">
			<tr>
				<th>문의자</th>
				<th>제목</th>
				<th>등록일</th>

			</tr>
			<c:choose>
				<c:when test="${empty QNAS}">
					<tr>
						<td colspan="3">아직 문의가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${QNAS}" var="Q">
						<tr data-seq="${Q.q_code}">
							<td>${Q.mb_nickname}<br/>
								<p>(${Q.q_writer})</p>
							</td>
							<td>${Q.q_title}</td>
							<td>${Q.q_date}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</article>
</article>

<script>
document.querySelector("table#question").addEventListener("click", (e)=>{
	let td = e.target
	if(td.tagName === "TD"){
		let tr = td.closest("TR")
		let seq = tr.dataset.seq
		location.href = `${rootPath}/info/qna/view/` + seq; // 여기 seq 넣으려면 어해야함?
	}
 	
})
</script>