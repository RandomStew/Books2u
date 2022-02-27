<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${bookDTO.title }상세정보 화면</h1>
	<jsp:include page="common/top.jsp" flush="true" /><br>
	<hr>
	<jsp:include page="book/search.jsp" flush="true" /> <br>
	<jsp:include page="book/bookInfo.jsp" flush="true" /> <br>
	<jsp:include page="review/bookReview.jsp" flush="true" /> 
	<br>
	<br>
	<jsp:include page="review/bookReviewForm.jsp" flush="true" />
</body>
</html>