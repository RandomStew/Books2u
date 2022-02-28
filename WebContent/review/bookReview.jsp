<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    
<table id="reviewTable">
	<tr>
		<th>작성자</th>
		<th>별점</th>
		<th>내용</th>
		<th>리뷰날짜</th>
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
		${review.content }
		</td>
		<td>
		${review.reviewDate }
		</td>
	</tr>
</c:forEach>
	<tr>
		<td colspan="4">
		<!--pageTag -->
		<c:set var="curPage" value="${reviewPageDTO.curPage }"></c:set>
		<c:set var="totalRecord" value="${reviewPageDTO.totalPage }"></c:set>
		<c:set var="perPage" value="${reviewPageDTO.perPage }"></c:set>
		<c:set var="totalPage" value="${totalRecord / perPage }"></c:set>
		<c:if test="${totalPage % perPage != 0 }">
			<c:set var="totalPage" value="${totalPage+(1-(totalPage%1))%1}"></c:set>
		</c:if>
		<a href="">이전</a>
		<c:forEach var="i" begin="1" end="${totalPage}">
		<input type="hidden" name="curPage" value="${i}">
		<c:if test="${i==curPage}">
			${i}
		</c:if>
		<c:if test="${i!=curPage}">
		<a href="BookInfoServlet?curPage=${i}&isbn=${book.isbn}">${i}</a>
		</c:if>
		</c:forEach>  
		<a href="">다음</a>
		</td>
	<tr>
</table>

