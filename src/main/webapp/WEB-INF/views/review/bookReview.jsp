<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Font Awesome Icon Library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">    
<style>
#reviewTable{
	border-collapse: collapse;
  	width: 100%;
  	border: 1px solid #ddd;
}

#reviewTable th, td{
	text-align: left;
  	padding: 16px;	
}

.checked {
  color: orange;
}
</style>
<script>
	$(document).ready(function(){
		
		$("button[name='edit']").on("click", function() {
			var reviewId = $(this).attr('data-reviewId');
			console.log(reviewId);
			var child = window.open("bookReviewUpdateUI?reviewId="+reviewId, "_blank", "height=350, width=250, top=250, left=650");
			
		}); 
		
	});
</script>

<div class="container">
	<table id="reviewTable">
		<tr>
			<th>작성자</th>
			<th>별점</th>
			<th>내용</th>
			<th>리뷰날짜</th>
			<th>edit </th>
		</tr>
	<c:forEach var="review" items="${reviewPageDTO.list }">
		<tr>
			<td>
			${review.userId}
			</td>
			<td>
			<span class="fa fa-star <c:if test="${review.rating >= 1 }">checked</c:if>"></span>
			<span class="fa fa-star <c:if test="${review.rating >= 2 }">checked</c:if>"></span>
			<span class="fa fa-star <c:if test="${review.rating >= 3 }">checked</c:if>"></span>
			<span class="fa fa-star <c:if test="${review.rating >= 4 }">checked</c:if>"></span>
			<span class="fa fa-star <c:if test="${review.rating >= 5 }">checked</c:if>"></span>
			</td>
			<td>
				<span id="${review.reviewId}_content" data-reviewId="${review.userId }">${review.content } </span>
			</td>
			<td>
			${review.reviewDate }
			</td>
			<td>
				<c:if test="${review.userId == sessionScope.login.userId}">
					<button name="edit" class="btn btn-outline-secondary" data-reviewId="${review.reviewId }">수정</button>
				</c:if>
			</td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="4">
			<!--pageTag -->
			<c:set var="curPage" value="${reviewPageDTO.curPage }"></c:set>
			<c:set var="totalRecord" value="${reviewPageDTO.totalPage }"></c:set>
			<c:set var="perPage" value="${reviewPageDTO.perPage }"></c:set>
			<c:set var="totalPage" value="${Math.ceil(totalRecord / perPage) }"></c:set>
			
			<c:set var="division" value="${(curPage-1) / 10 }"></c:set>
			<fmt:parseNumber var="division" value="${division}" integerOnly="true"/>
	
			<c:set var="startPoint" value="${division*10 + 1 }"></c:set>
			<c:set var="endPoint" value ="${division*10+10 }"></c:set>
			
			<c:if test="${totalPage < endPoint }">
				<c:set var="endPoint" value="${totalPage }"></c:set>
			</c:if>
			
			<!-- 현재페이지가 2 이상일 때 이전 버튼이 존재 -->
			<c:if test="${curPage > 1 }">
				<a href="bookInfo?curPage=${curPage-1}&isbn=${book.isbn}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${startPoint}" end="${endPoint}">
				<input type="hidden" name="curPage" value="${i}">
				<c:if test="${i==curPage}">
					${i}
				</c:if>
				<c:if test="${i!=curPage}">
					<a href="bookInfo?curPage=${i}&isbn=${book.isbn}">${i}</a>
				</c:if>
			</c:forEach>
			
			<!--  curPage < totalPage 일 떄 존재 -->
			<c:if test="${curPage < totalPage }">
				<a href="bookInfo?curPage=${curPage+1}&isbn=${book.isbn}">다음</a>  
			</c:if>
			</td>
		<tr>
	</table>
</div>


