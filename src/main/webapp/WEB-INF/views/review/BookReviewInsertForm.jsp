<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
	
	var id = <c:if test="${not empty sessionScope.login }">
	'<c:out value="${sessionScope.login.userId}"></c:out>';
	</c:if>
	$(document).ready(function(){
		$("input[name='userId']").val(id);
	});
	
</script>

<c:if test="${not empty sessionScope.login.userId }">
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="form-siginin">
					<form name="insertReviewForm" action="bookReviewAdd" method="post">
						<input type="hidden" name="isbn" value="${book.isbn }">
						<div class="form-floating">
							작성자: 
							<input type="text" name="userId"  value="" readonly="true" class="w-100 form-control">
						</div>
						<div class="form-floating">
						별점:
						<input type="text" name="rating" value="5" class="w-100 form-control">
						</div>
						내용:<br>
						<textarea name="content" rows="2" cols="20" class="form-control"></textarea>
						<input type="submit" value="리뷰 등록" class="w-100 btn btn-lg btn-outline-dark mt-3 mb-3">
					</form>
				</div>
			</div>
			<div class="col-md-4">
			</div>
		</div>
	</div>
</c:if> 