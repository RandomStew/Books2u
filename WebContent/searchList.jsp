<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h1>검색 리스트</h1>
	<jsp:include page="common/top.jsp" flush="true" /><br>
	<hr>
	<jsp:include page="book/search.jsp" flush="true" /> <br>
	<jsp:include page="book/searchList.jsp" flush="true" />
</body>
</html>