<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books2u</title>
<style><%@include file="/css/book/curationMain.css"%></style>
</head>
<body>
	<h1>Main 화면</h1>
	<jsp:include page="common/top.jsp" flush="true" /><br>
	<hr>
	<jsp:include page="book/search.jsp" flush="true" /> <br>
	<hr>
	<jsp:include page="book/curationMain.jsp" flush="true" />
	
</body>
</html>