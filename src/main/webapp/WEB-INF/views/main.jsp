<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">

<title>Books2u</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	<!-- StyleSheet -->
	<style><%@include file="css/member/loginForm.css"%>
	<%@include file="css/book/curationMain.css"%></style>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
</head>

<header>
	<jsp:include page="common/banner.jsp" flush="true" /><br>
	<jsp:include page="common/top.jsp" flush="true" /><br>
	<hr width="100%" color="#D7D7D7" style="margin-top:0px">
</header>

<body data-new-gr-c-s-check-loaded="14.1051.0" data-gr-ext-installed="">	
	<jsp:include page="book/search.jsp" flush="true" /> <br>
	<jsp:include page="book/curationMain.jsp" flush="true" />
</body>
</html>