<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="jquery-3.1.0.js"></script>

<script type="text/javascript">
	
	function allCheck(){
		var allCheck = document.querySelector("#allCheck");
		var check = document.querySelectorAll(".check");
		
		check.forEach(function(data, idx){
			data.checked = allCheck.checked;
		})
		
		// 개별 체크박스 모두 선택시 모두선택 체크박스 선택
		$("input[name=check]").click(function(){
			var total = $("input[name=check]").length;
			var checked = $("input[name=check]:checked").length;
			
			if(total != checked) $("#allCheck").prop("checked", false);
			else $("#allCheck").prop("checked", true);
		});
	}
	
	
	// 장바구니 수정 ------------------------------------------------------------------------------------------
	
	// 선택 항목 삭제
	function delCheckedCart(){
		var f = document.querySelector("form");
		f.action = "CartDeleteServlet";
		f.method = "get";
		f.submit();
	}
	
	// 장바구니 비우기
	function delAllCart(){
		
		var confirmValue = confirm("정말 비우시겠습니까?");
		  
		  if(confirmValue) {
			var check = document.querySelectorAll(".check");
			check.forEach(function(data, idx){
				data.checked = true;
			})
			
			var f = document.querySelector("form");
			f.action = "CartDeleteServlet";
			f.method = "get";
			f.submit(); 
		}
	}
	
	//개별삭제
	function deleteItem(isbn){
		location.href=`CartDeleteServlet?isbn=\${isbn}`;
	}
	
	
	// 수량 수정-------------------------------------------------------------------------------------------------------------
	function updateAmount(isbn, AscOrDesc){
		var userId = document.querySelector("#hiddenUserId");
		var amountTag = document.querySelector("#amount"+isbn);
		
		if(!userId) {
			alert("로그인을 해주세요");
			return;
		}
		var data = `isbn=\${isbn}&amount=\${amountTag.value}&AscOrDesc=\${AscOrDesc}`;
		// console.log(data);
		
		var httpRequest = new XMLHttpRequest();
		// post 방식 Ajax 통신
		httpRequest.open("POST", "CartUpdateAmountServlet", true);
		httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		httpRequest.send(data);
		httpRequest.onreadystatechange = function() {
			// AJAX 성공시 데이터 응답 조건
			if(httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200){
				console.log("데이터 응답");
			}
		}
		location.reload();
		}
	
	
	function amountAsc(isbn) {
		var amountTag = document.querySelector("#amount"+isbn);
		var AscOrDesc = 1;
		amountTag.value -= -1;
		updateAmount(isbn, AscOrDesc);

	}
	
	function amountDesc(isbn) {
		var amountTag = document.querySelector("#amount"+isbn);
		var AscOrDesc = -1;
		if(amountTag.value > 1) {
			amountTag.value -= 1;
		
			updateAmount(isbn, AscOrDesc);
			}
	}
	
	// 선택항목 주문 -------------------------------------------------------------------------------------
	function orderList(){
		var f = document.querySelector("form");
		f.action = "OrderListServlet";
		f.method = "get";
		f.submit();
	}
	
	
	
</script>

<table width="90%" cellspacing="0" cellpadding="0" border="0">

	<tr><td height="30"/></tr>
	
	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp;
			<font size="5"> 장바구니 </font>&nbsp;
		</td>
	</tr>
	
	<tr><td height="15"></td>
	<tr><td colspan="10"><hr size="1" color="CCCCCC"></td></tr>
	<tr><td height="7"></tr>
	
	<!-- 테이블 HEADER -->
	<tr>
		<td class="td_default" align="center">
			<input type="checkbox" name="allCheck" id="allCheck" value ="allCheck" onclick="allCheck()" checked="checked">
		</td>
		<td class="td_default" align="center"><strong>ISBN</strong></td>
		<td class="td_default" align="center"><strong>책</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
		<td class="td_default" align="center"><strong>판매가</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
		<td class="td_default" align="center"><strong>합계</strong></td>
		<td class="td_default" align="center"></td>
	</tr>
	

	<tr>
		<td height="7">
	</tr>
	
	
	
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	
	
	<c:choose>
	<c:when test="${sessionScope.cartSumAmount == 0}">
		<tr>
			<td colspan="10" align="center">
				<h4 style="color:#CCCCCC">장바구니가 비었습니다.</h4>
			</td>
		</tr>

	</c:when>
	<c:otherwise>
	<!-- 장바구니 요소 목록 -->
	<form name="cartForm">
		<c:set var="sumTotal" value="${0}"/>
		<c:forEach var="book" items="${sessionScope.cartList}" varStatus="status">
			<input type="hidden" name="userId" value="${sessionScope.login.userId}" id="hiddenUserId">
			<input type="hidden" name="hiddenIsbn${book.isbn}" value="${book.isbn}" id="hiddenIsbn${book.isbn}">
			<input type="hidden" name="hiddenTitle${book.isbn}" value="${book.title}" id="hiddenTitle${book.isbn}">
			<input type="hidden" name="hiddenAuthor${book.isbn}" value="${book.author}" id="hiddenAuthor${book.isbn}">
			<input type="hidden" name="hiddenPublisher${book.isbn}" value="${book.publisher}" id="hiddenPublisher${book.isbn}">
			<input type="hidden" name="hiddenPrice${book.isbn}" value="${book.price}" id="hiddenPrice${book.isbn}">
		
			<tr>
				<td class="td_default" width="80" align="center">
				<input type="checkbox" name="check" id ="check${book.isbn}" class="check" 
				data-isbn="${book.isbn}" value="${book.isbn}" checked="checked">
				</td>
			
				<!-- ISBN -->
				<td class="td_default" width="120">
					<font size="2">${book.isbn}</font>
				</td>
				<!-- 이미지 -->
				<td class="td_default" width="80">
					<img src="images/books/${book.isbn}.jpg" border="0" align="center" width="80" />
				</td>
				<!-- 책 정보 -->
				<td class="td_default" width="300" style='padding-left: 30px' colspan="2" align="center">
					${book.title } <br> 
					<font size="2" color="#665b5f">
					저자명 : ${book.author} <br>
					출판사(${book.publisher}) <br>
					</font>
				</td>
				<!-- 가격 -->
				<td class="td_default" align="center" width="110">
					<span id="cart_price${book.isbn}">${book.price} </span>
				</td>
				
				<!-- 수량 -->
				<td class="td_default" align="center" width="90">
				<input
					class="input_default" type="text" name="amount"
					id="amount${book.isbn}" style="text-align: right" maxlength="3"
					size="2" value="${book.amount}" data-amount=""></input>
				</td>
				<!-- 수량 버튼 -->
				<td><input type="button" value="+"
					onclick="amountAsc(${book.isbn})" style="cursor:pointer"/>
					<br>
					<input type="button" value="- "
					onclick="amountDesc(${book.isbn})" style="cursor:pointer"/>
				</td>
			
				<!-- 총합 -->
				<c:set var="sumTotal" value="${sumTotal + (book.price*book.amount)}"/>
				<td class="cart_sum" align="center" width="110" style='padding-left: 5px'>
					<span id="cart_sum${book.isbn}"> ${book.price*book.amount} </span>
				</td>
				
				<td class="td_default" width="80" align="center">
				<input type="button" id ="delete${book.isbn}" data-isbn="${book.isbn}" value="X"
				onclick="deleteItem(${book.isbn})" style="cursor:pointer">
				</td>
			</tr>
			
			<tr>
				<td height="15">
			</tr>
			
		</c:forEach>
	</form>
	
	</c:otherwise>
	</c:choose>
	
	
	
	<!-- 장바구니 요약 -->
		<tr>
			<td colspan="10">
				<hr size="1" color="CCCCCC">
			</td>
		</tr>
		
		<tr>
			<td align="center" colspan="3"></td>
		
			<td align="center" colspan="3">
			총 결제 금액</td>
		
			<td align="center" colspan="3">
			${sumTotal}
			</td>
		</tr>
		
		<tr>
			<td colspan="10">
				<hr size="1" color="CCCCCC">
			</td>
		</tr>
		
		<tr>
			<td align="center" colspan="3">
			<button onclick="delCheckedCart()" style="cursor:pointer"> 선택 항목 삭제 </button>&nbsp;&nbsp;&nbsp;&nbsp; 
			<button onclick="delAllCart()" class="delAllCart" style="cursor:pointer"> 장바구니 비우기 </button>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
		
			<td align="center" colspan="3"></td>
		
			<td align="center" colspan="3">
			<button onclick="javascript:orderList()" style="cursor:pointer"> 주문하기 </button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button onclick="location.href='MainServlet'" style="cursor:pointer"> 계속 쇼핑하기 </button>&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>

</table>