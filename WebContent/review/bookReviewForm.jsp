<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function addByAjax() {
		
	}
</script>    
<c:if test="${not empty sessionScope.login}">
<form name="insertReviewForm" action="BookReviewAddServlet" method="post">
<input type="hidden" name="isbn" value="${book.isbn}">
작성자: <input type="text" name="userId"  value="${sessionScope.login.userId }" readonly="true"> <br>
별점: <input type="text" name="rating" value="5"> <br>
내용:<br>
<textarea name="content" rows="2" cols="20"></textarea>
<input type="submit" value="리뷰 등록">
</form>
</c:if>    