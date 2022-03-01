<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

	function amountAsc() {
		var amountTag = document.querySelector("#amount");
		amountTag.value -= -1;
	}
	
	function amountDesc() {
		var amountTag = document.querySelector("#amount");
		if(amountTag.value > 1) {
			amountTag.value -= 1;
		}
	}
	
	
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

<style>
* {
  box-sizing: border-box;
}
.column{
	float:left;
}
.column1 {
  width: 10%;
  padding: 10px;
  height: 300px; /* Should be removed. Only for demonstration */
}

.column2 {
  width: 80%;
  padding: 10px;
  height: 300px; /* Should be removed. Only for demonstration */
}

</style>


<div class="row">
  <div class="column1 column" style="background-color:#aaa;">
    <img height="200" width="140" src="images/books/${book.isbn }.jpg">
  </div>
  <div class="column2 column" style="background-color:#bbb;">
    <h2>책 제목: ${book.title}</h2>
    <p> 작가: ${book.author}</p>
    <p> 가격: ${book.price }원</p>
    <p> 줄거리: ${book.story}</p>
    <form name="bookForm">
    <div>
	    <input
				class="input_default" type="text" name="cart_amount"
				id="amount" style="text-align: right" maxlength="3"
				size="2" value="1"></input>
	    <input type="button" value="+"
					onclick="amountAsc()" style="cursor:pointer"/>
		<input type="button" value="- "
					onclick="amountDesc()" style="cursor:pointer"/>	
	</div>	
    <input type="hidden" name="hiddenIsbn" id="hiddenIsbn" value="${book.isbn}">
    <input type="hidden" name="hiddenTitle" id="hiddenTitle" value="${book.title}">
    <input type="hidden" name="hiddenAuthor" id="hiddenAuthor" value="${book.author}">
    <input type="hidden" name="hiddenPrice" id="hiddenPrice" value="${book.price}">
    <input type="hidden" name="hiddenPublisher" id="hiddenPublisher" value="${book.publisher}">
    <input type="hidden" name="hiddenUserId" id="hiddenUserId" value="${sessionScope.login.userId}">
    <input type="button" onclick="reqCheck('cart')" value="장바구니에 담기">
    <button>구매하기</button>
    </form>
  </div>
  
</div>
