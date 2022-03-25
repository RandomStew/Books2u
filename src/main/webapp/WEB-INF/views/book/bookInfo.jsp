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
						alert("장바구니 담기 성공!!");
					} else {
						alert('담기 실패... 다시 시도해 주세요');
					}
	            }
	        });
		});
		
		
	});


     function reqCheck(target){
    	 
    	 if(target=='cart'){
    		 // 장바구니 
    		 
    		 // Ajax 를 활용해서 cartList.jsp로 cartDTO에 필요한 데이터 전송
			console.log("dom 찾기")
			var amountTag = document.querySelector("#amount");
			var isbn = document.querySelector("#hiddenIsbn").value;
			var title = document.querySelector("#hiddenTitle").value;
			var author = document.querySelector("#hiddenAuthor").value;
			var publisher = document.querySelector("#hiddenPublisher").value;
			var price = document.querySelector("#hiddenPrice").value;
			var userId = document.querySelector("#hiddenUserId").value;
			
			console.log("dom찾기 완료")
			if(!userId) {
				alert("로그인을 해주세요");
				return;
			}
			var data = `userId=\${userId}&isbn=\${isbn}&`
			+`title=\${title}&author=\${author}&publisher=\${publisher}&`
			+`price=\${price}&amount=\${amountTag.value}`;
			console.log(data);
			
			var httpRequest = new XMLHttpRequest();
			// post 방식 Ajax 통신
			httpRequest.open("POST", "CartAddServlet", true);
			httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			httpRequest.send(data);
			httpRequest.onreadystatechange = function() {
				// AJAX 성공시 데이터 응답 조건
				if(httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200){
					console.log("데이터 응답");
				}
			}
			
			// 사용자에게 정보 리턴
			alert(`\${title} \${amountTag.value}권을 장바구니에 담았습니다.`);
			amountTag.value = 1;
    		location.reload();
    		 
    	 }else{
    		 // 주문
    		 
    	 }
    	 
     }
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
			    <button id="purchasebtn" class="btn btn-dark btn-lg">구매하기</button>
		    </div>	
    		</form>
   		</div>
	</div>
</div>

