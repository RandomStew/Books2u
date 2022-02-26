<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="SearchListServlet" method="post">
<select name="type">
	<option value="title"> 책제목</option>
	<option value="author"> 저자명</option>
	<option value="publisher"> 출판사</option>
	<option value="story"> 책 내용</option>
</select>
<input type="text" name="search"> &nbsp
<button>검색</button>
</form>

</body>
</html>