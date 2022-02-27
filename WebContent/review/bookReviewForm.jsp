<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function addByAjax() {
		var queryString = $("form[name=insertReviewForm]").serialize();
		$.ajax({
            type : 'post',
            url : 'BookReviewAdd',
            data : queryString,
            dataType : 'text',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
                if(json == '1') {
                	alert("등록 성공");
                } else {
                	alert("등록 실패");
                }
                location.reload();
            }
        });
	}
</script>    
<c:if test="${not empty sessionScope.login}">
<form name="insertReviewForm" action="BookReviewAdd" method="post">
<input type="hidden" name="isbn" value="${book.isbn}">
작성자: <input type="text" name="userId" value="${sessionScope.login.userId }"> <br>
별점: <input type="text" name="rating" value="5"> <br>
내용:<br>
<textarea name="content" rows="2" cols="20"></textarea>
<input type="button" onclick="addByAjax()" value="리뷰 등록">
</form>
</c:if>    