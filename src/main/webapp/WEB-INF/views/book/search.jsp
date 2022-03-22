<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type=text] {
  width: 130px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  font-size: 15px;
  background-color: white;
  //background-image: url('searchicon.png');
  background-position: 10px 10px; 
  background-repeat: no-repeat;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
}
</style>

<script>
	function searchBook() {
		var input = document.querySelector("input[name='search']");
		if(input.value == "")
			return
		var f = document.querySelector("form[name='searchForm']");
		f.action = "SearchListServlet";
		f.method = "get";
		f.submit();
	}
	
	function enterKey() {
		// enterKey == 13
		if (window.event.keyCode == 13) {
			searchBook();
			
		}
	}
	
</script>
</head>

<body>

<form name='searchForm' align="center">
<select name="type">
	<option value="title" <c:if test="${type=='title'}">selected </c:if>> 책제목</option>
	<option value="author" <c:if test="${type=='author'}">selected </c:if>> 저자명</option>
	<option value="publisher" <c:if test="${type=='publisher'}">selected </c:if>> 출판사</option>
	<option value="story" <c:if test="${type=='story'}">selected </c:if>> 책 내용</option>
</select>
<input type="text" name="search" onkeydown="enterKey()" value="${title}"> &nbsp;
<input type="button" onclick="searchBook()" value="검색">
</form>

</body>
</html>