<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

	$(document).ready(function(){
		
		// +버튼 이벤트 처리
		$("#plus").on("click", function() {
			$("#amount").val($("#amount").val()-(-1));
		});
		
		// -버튼 이벤트 처리
		$("#minus").on("click", function() {
			if($("#amount").val() > 1) {
				$("#amount").val($("#amount").val()-1);
			}
		});
		
		// 장바구니 넣기 버튼 이벤트 처리
		$("#goCartBtn").on("click", function() {
			// 폼 데이터 직렬화
			var title = $("#hiddenTitle");
			var amount = $("#amount")
			var queryString = $("form[name=bookForm]").serialize() ;
			// Ajax
			$.ajax({
	            type : 'post',
	            url : 'cartAdd',
	            data : queryString,
	            dataType : 'json',
	            error: function(xhr, status, error){
	                alert(error);
	            },
	            success : function(json){
					if (json == 1) {
						//alert(`\${title} \${amountTag.value}권을 장바구니에 담았습니다.`);
						//alert("장바구니 담기 성공!!");
						alert(`\${title.val()} \${amount.val()}권을 장바구니에 담았습니다.`);
					} else {
						alert('담기 실패... 다시 시도해 주세요');
					}
					location.reload();
	            }
	        });
		});
		
		// 주문하기 버튼 이벤트 처리
		$("#purchasebtn").on("click", function(){
			$("form[name='bookForm']").attr({
				action:"directOrder",
				method:"get"
			}).submit();
		});
		
	});

</script>

<div class= "container">

	<div class="row mb-2">
		<div class="col-md-4 ">
			<div class="col-auto d-none d-lg-block">
				<img class='"bd-placeholder-img" img-1' src="images/books/${book.isbn }.jpg" height="300">
			</div>
			
		</div>
		<div class="col-md-8">
			<h3>책 제목: ${book.title}</h3>
			<hr>
		    <p> 작가: ${book.author}</p>
		    <hr>
		    <p> 가격: ${book.price }원</p>
		    <hr>
		    <p> 줄거리: ${book.story}</p>
		    <hr>
		    <form name="bookForm">
		    <div class="mb-2">
			    <input
						class="input_default m-2" type="text" name="amount"
						id="amount" style="text-align: right" maxlength="3"
						size="2" value="1"></input>
						
				<input type="button" value="- "id="minus" style="cursor:pointer"/>	
			    <input type="button" value="+" id="plus" style="cursor:pointer"/>

			</div>
			<div>
			    <input type="hidden" name="isbn" id="hiddenIsbn" value="${book.isbn}">
			    <input type="hidden" name="title" id="hiddenTitle" value="${book.title}">
			    <input type="hidden" name="author" id="hiddenAuthor" value="${book.author}">
			    <input type="hidden" name="price" id="hiddenPrice" value="${book.price}">
			    <input type="hidden" name="publisher" id="hiddenPublisher" value="${book.publisher}">
			    <input type="hidden" name="userId" id="hiddenUserId" value="${sessionScope.login.userId}">
			    <input type="button" id="goCartBtn" class="btn btn-outline-dark btn-lg" value="장바구니에 담기">
			    <button id="purchasebtn" class="btn btn-dark btn-lg">주문하기</button>
		    </div>	
    		</form>
   		</div>
	</div>
</div>

