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
		
			var amountTag = document.querySelector("#amount");
			var isbn = document.querySelector("#hiddenIsbn").value;
			var title = document.querySelector("#hiddenTitle").value;
			var author = document.querySelector("#hiddenAuthor").value;
			var publisher = document.querySelector("#hiddenPublisher").value;
			var price = document.querySelector("#hiddenPrice").value;
			var userId = document.querySelector("#hiddenUserId").value;
			
			if(!userId) {
				alert("로그인을 해주세요");
				return;
			}
			var data = `userId=\${userId}&isbn=\${isbn}&`
			+`title=\${title}&author=\${author}&publisher=\${publisher}&`
			+`price=\${price}&amount=\${amountTag.value}`;
			// console.log(data);
			
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
    		 
    		 
    	 }else{
    		 // 주문
    		 
    	 }
    	 
     }
</script>


<form name="bookInfoForm" method="get">
	    <input type="hidden"  id="hiddenIsbn" name="isbn" value="${book.isbn}">
	    <input type="hidden"  id="hiddenTitle" name="title" value="${book.title}">
	    <input type="hidden"  id="hiddenAuthor" name="author" value="${book.author}">
	    <input type="hidden"  id="hiddenPublisher" name="publisher" value="${book.publisher}">
	    <input type="hidden" id="hiddenPrice" name="price" value="${book.price}">
	    <input type="hidden" id="hiddenUserId" name="userId" value="${sessionScope.login.userId}">
	    

	<table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td>
				<table align="center" width="710" cellspacing="0" cellpadding="0"
					border="0" style='margin-left: 30px'>
					<tr>
						<td class="td_default"><font size="5"><b>- 상품 정보 -</b></font>
							&nbsp;</td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td height="1" colspan="8" bgcolor="CECECE"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>

					<tr>
						<td rowspan="7"><img src="images/books/${book.isbn}.jpg"
							border="0" align="center" width="300" /></td>
						<td class="td_title" width="50">ISBN</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>${book.isbn}
						</td>
					</tr>
					<tr>
						<td class="td_title">상품명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>${book.title}</td>
					</tr>
					<tr>
						<td class="td_title" width="50">가격</td>

						<td class="td_red" colspan="2" style='padding-left: 30px'>
						${book.price}
						</td>
					</tr>
					<tr>
						<td class="td_title" width="50">배송비</td>
						<td colspan="2"><font color="#2e56a9" size="2"
							style='padding-left: 30px'><b> 무료배송</b> </font> <font size="2">(도서
								산간지역 별도 배송비 추가)</font></td>

					</tr>
					<tr>
						<td width="50">줄거리</td>
						<td colspan="2" style='padding-left: 50px'>
							${book.story}
						</td>
					</tr>

					<tr>
						<td class="td_title">주문수량</td>
						<!-- 수량 -->
						<td class="td_default" align="center" width="90">
						<input
							class="input_default" type="text" name="amount"
							id="amount" style="text-align: right" maxlength="3"
							size="2" value="1" data-amount=""></input>
						</td>
						<!-- 수량 버튼 -->
						<td><input type="button" value="+"
							onclick="amountAsc()" style="cursor:pointer"/>
							<br>
							<input type="button" value="- "
							onclick="amountDesc()" style="cursor:pointer"/>
						</td>
					</tr>
				</table>

			</td>
		</tr>
	</table>

	<br> 

	<button onclick="reqCheck('order')">구매</button>
	&nbsp;&nbsp;
	<button onclick="reqCheck('cart')">장바구니</button>

</form>


<br>