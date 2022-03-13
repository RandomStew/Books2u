<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!-- bootstrap example -->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" 
crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
crossorigin="anonymous"></script>    
    
<script>
	$(document).ready(function(){
		var reviewId = new URLSearchParams(location.search).get('reviewId');
		console.log(reviewId);
		$("#reviewId").val(reviewId);
		var content = opener.$(`#\${reviewId}_content`).text();
		console.log(content);
		$("textarea").val(content);
	});

</script> 
</head>
<body>
	<input type="hidden" id="reviewId" value="">
	
	<form name="insertReviewForm" action="BookReviewAddServlet" method="post">
	<input type="hidden" name="isbn" value="">
	작성자: <input type="text" name="userId"  value="${sessionScope.login.userId }" readonly="true"> <br>
	별점: <input type="text" name="rating" value="5"> <br>
	내용:<br>
	<textarea name="content" rows="2" cols="20"></textarea>
	<input type="submit" value="리뷰 수정">
	</form>

</body>
</html>


