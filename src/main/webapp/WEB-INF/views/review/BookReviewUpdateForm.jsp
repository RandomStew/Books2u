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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
crossorigin="anonymous"></script>
<style><%@include file="../css/member/loginForm.css"%></style>
<script>
	$(document).ready(function(){
		var reviewId = new URLSearchParams(location.search).get('reviewId');
		console.log(reviewId);
		$("#reviewId").val(reviewId);
		var content = opener.$(`#\${reviewId}_content`).text();
		console.log(content);
		$("textarea").val(content);
		
		$("#updateButton").on("click", function(){
	        var queryString = $("form[name=insertReviewForm]").serialize() ;
	        console.log(queryString);
	        
	        $.ajax({
	            type : 'get',
	            url : '../BookReviewUpdateServlet',
	            data : queryString,
	            dataType : 'text',
	            error: function(xhr, status, error){
	                alert(error);
	            },
	            success : function(text){
	                console.log(text);
	                opener.location.reload();
	                window.close();
	            }
	        });
		});
	});

</script> 
</head>

<div class="container">
	<div class="text-center">
		<div class="form-siginin">
			<form name="insertReviewForm" action="../BookReviewUpdateServlet" method="post">
				<input type="hidden" id="reviewId" name="reviewId" value="">
				<input type="hidden" name="isbn" value="">
				<div class="form-floating">
					<label>작성자</label>
					<input type="text" name="userId" value="${sessionScope.login.userId }" class="form-control" placeholder="아이디" readonly="true">
				</div>
				<div class="form-floating">
					<label>별점</label>
					<input type="text" name="rating" value="5" class="form-control">
				</div>
				
				<div class="form-floating">
					<label>내용</label>
					<textarea name="content" rows="2" cols="20" class="form-control"></textarea>
				</div>
				<input type="button" id="updateButton" value="리뷰 수정" class="w-100 btn btn-lg btn-outline-dark mt-3">
			</form>
		</div>
	</div>
</div>



