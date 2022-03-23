<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
	
	$(document).ready(function(){
		
		// 전체 선택 체크박스 버튼
		$("#allCheck").on("click", function() {
			if($(this).is(":checked")) {
				$(".check").attr("checked", true);
			} else {
				$(".check").attr("checked", false);
			}
		});
		
		
		// 개별 체크박스 모두 선택시 모두선택 체크박스 선택
		$(".check").on("click", function() {
			var total = $("input[name=check]").length;
			var checked = $("input[name=check]:checked").length;
			if(total != checked) $("#allCheck").prop("checked", false);
			else $("#allCheck").prop("checked", true);
		});
		
		
		// 장바구니 수정 -------------------------------------------------------------------------------------
		
		// 선택 항목 삭제 버튼
		$("#delCheckedCart").on("click", function() {
			if($(".check").length == 0) {
				alert("삭제할 상품이 없습니다.");
			} else {
				$("form[name='cartForm']").attr({
					 "action": "cartDel",
					 "method": "get"
				 }).submit();
			}
		});
		
		// 장바구니 모두 비우기 버튼
		$("#delAllCart").on("click", function(){
			if($('.check').length == 0) {
				alert("삭제 할 상품이 없습니다.");
			} else {
				location.href = "cartDelAll";
			}
		});

	});
	
	
	//개별삭제
	function deleteItem(isbn){
		location.href=`cartDel?isbn=\${isbn}`;
	}
	
	
	// 수량 수정-------------------------------------------------------------------------------------------------------------
	function updateAmount(isbn, AscOrDesc){
		var amountTag = document.querySelector("#amount"+isbn);
		var data = `isbn=\${isbn}&amount=\${amountTag.value}&AscOrDesc=\${AscOrDesc}`;
		
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
		var check = document.querySelectorAll(".check");
		
		if(check.length == 0){
			alert("주문할 상품이 없습니다.");
		} else{
			f.action = "OrderConfirmServlet";
			f.method = "get";
			f.submit();
		}
		
	}
	

	// 책을 클릭하면 책 상세정보로 이동
	function goBookInfo(isbn) {
		location.href="bookInfo?isbn=" + isbn;
	}
	
</script>

<div class="container">
<div class="row">
<div class="col-12">
<table width="90%" cellspacing="0" cellpadding="0" border="0" align="center"> 

	<tr><td height="30"/></tr>
	<tr>
		<td colspan="5" >&nbsp;&nbsp;&nbsp;
			<font class="h4"> <b>장바구니</b> </font>&nbsp;
			<input type="hidden" name="hiddenUserId" value="${sessionScope.login.userId}" id="hiddenUserId">
		</td>
	</tr>
	
	<tr><td height="15"></td>
	<tr><td colspan="10"><hr color="CCCCCC" size="4"></td></tr>
	<tr><td height="7"></tr>
	
	<!-- 테이블 HEADER -->
	<tr>
		<td  align="center">
		<input type="checkbox" name="allCheck" id="allCheck" value ="allCheck" checked="checked">
		</td>
		<td  align="center"><strong>ISBN</strong></td>
		<td  align="center"><strong>책</strong></td>
		<td  align="center" colspan="2"><strong>상품정보</strong></td>
		<td  align="center"><strong>판매가</strong></td>
		<td  align="center" colspan="2"><strong>수량</strong></td>
		<td  align="center"><strong>합계</strong></td>
		<td  align="center"></td>
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
				<h6 style="color:#CCCCCC"><b>장바구니가 비었습니다.</b></h6>
			</td>
		</tr>

	</c:when>
	<c:otherwise>
	<!-- 장바구니 요소 목록 -->

	<form name="cartForm">
		<c:set var="sumTotal" value="${0}"/>
		<c:forEach var="book" items="${cartList}" varStatus="status">
			<input type="hidden" name="hiddenisbn" value="${book.isbn}" id="hiddenIsbn${book.isbn}">
			<input type="hidden" name="title" value="${book.title}" id="hiddenTitle${book.isbn}">
			<input type="hidden" name="author" value="${book.author}" id="hiddenAuthor${book.isbn}">
			<input type="hidden" name="publisher" value="${book.publisher}" id="hiddenPublisher${book.isbn}">
			<input type="hidden" name="price" value="${book.price}" id="hiddenPrice${book.isbn}">
		
			<tr>
				<td  width="80" align="center">
				<input type="checkbox" name="isbn" id ="check${book.isbn}" class="check"
				data-isbn="${book.isbn}" value="${book.isbn}" checked="checked">

				</td>
			
				<!-- ISBN -->
				<td  width="120">
					<font size="2">${book.isbn}</font>
				</td>
				<!-- 이미지 -->
				<td  width="80">
					<img src="images/books/${book.isbn}.jpg" onclick="goBookInfo(${book.isbn})" border="0" align="center" class="img-1" width="80" />
				</td>
				<!-- 책 정보 -->
				<td  width="200" style='padding-left: 30px' colspan="2" align="center">
					${book.title } <br> 
					<font size="2" color="#665b5f">
					저자명 : ${book.author} <br>
					출판사(${book.publisher}) <br>
					</font>
				</td>
				<!-- 가격 -->
				<td  align="center" width="110">
					<span id="cart_price${book.isbn}">${book.price} </span>
				</td>
				
				<!-- 수량 -->
				<td  align="center" width="90">
				<input
					type="text" name="amount"
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
			
				<!-- 합계 -->
				<c:set var="sumTotal" value="${sumTotal + (book.price*book.amount)}"/>
				<td class="cart_sum" align="center" width="110"  style='padding-left: 5px'>
					<span id="cart_sum${book.isbn}"> ${book.price*book.amount} </span>
				</td>
				
				<td  width="80" align="center">
				<button type="button" class="btn-close" aria-label="Close" id ="delete${book.isbn}" data-isbn="${book.isbn}"
				onclick="deleteItem(${book.isbn})" ></button>
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
				<hr size="4" color="CCCCCC">
			</td>
		</tr>
		
		<tr>
			<td align="center" colspan="3">
			<button type="button" id="delCheckedCart" class="btn btn-outline-secondary btn-sm" style="cursor:pointer"> 선택 항목 삭제 </button>&nbsp;&nbsp;&nbsp;&nbsp; 
			<button type="button" id="delAllCart" class="btn btn-outline-secondary btn-sm" style="cursor:pointer"> 장바구니 비우기 </button>&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
		
			<td align="center" colspan="4"></td>
		
			<td align="center" colspan="3">
			<button type="button" class="btn btn-outline-secondary btn-md" onclick="location.href='main'" style="cursor:pointer"> 계속 쇼핑하기 </button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-dark btn-lg" onclick="orderList()" style="cursor:pointer"> 주문하기 </button>&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>

</table>
</div></div></div>
