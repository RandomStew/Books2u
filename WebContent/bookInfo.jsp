<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books2u:${bookDTO.title}</title>

<style>
	.img-1 {
	    box-shadow:4px 4px 8px grey;
	}
</style>

	<!-- StyleSheet -->
	<style><%@include file="css/book/curationMain.css"%></style>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

<script type="text/javascript" src="js/member/join.js" ></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="js/member/postcode.js" ></script>

</head>
<body>
	<h1>${bookDTO.title}상세정보 화면</h1>
	<jsp:include page="common/top.jsp" flush="true" /><br>
	<hr>
	<jsp:include page="book/search.jsp" flush="true" /> <br>
	<jsp:include page="book/bookInfo.jsp" flush="true" /> <br>
	<jsp:include page="review/bookReview.jsp" flush="true" /> 
	<br>
	<br>
	<jsp:include page="review/BookReviewInsertForm.jsp" flush="true" />
</body>
</html>