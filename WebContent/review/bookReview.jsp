<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

    
<table border=1>
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
		${review.rating }
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
		
		<c:forEach var="i" begin="1" end="${totalPage}">
		<input type="hidden" name="curPage" value="${i}">
		<c:if test="${i==curPage}">
			${i}
		</c:if>
		<c:if test="${i!=curPage}">
		<a href="BookInfoServlet?curPage=${i}&isbn=${book.isbn}">${i}</a>
		</c:if>
		</c:forEach>  
		</td>
	<tr>
</table>

