<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="SearchListServlet" method="post">
<select name="type">
	<option value="title" <c:if test="${type=='title'}">selected </c:if>> 책제목</option>
	<option value="author" <c:if test="${type=='author'}">selected </c:if>> 저자명</option>
	<option value="publisher" <c:if test="${type=='publisher'}">selected </c:if>> 출판사</option>
	<option value="story" <c:if test="${type=='story'}">selected </c:if>> 책 내용</option>
</select>
<input type="text" name="search" value="${title }"> &nbsp
<button>검색</button>
</form>

</body>
</html>