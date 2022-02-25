<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script>
	function goBookInfo(isbn) {
		location.href=`BookInfoServlet?isbn=\${isbn}`;
	}
	

 </script>
 

<table width="90%" cellspacing="0" cellpadding="0" border="0">

	<tr><td height="30"/></tr>
	
	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp;
			<font size="5"> ${title } 키워드 검색 결과입니다. </font>&nbsp;
		</td>
	</tr>
	
	<tr><td height="15"></td>
	<tr><td colspan="10"><hr size="1" color="CCCCCC"></td></tr>
	<tr><td height="7"></tr>
	
	<!-- 테이블 HEADER -->
	<tr>
		<td class="td_default" align="center">
			<input type="checkbox" name="allCheck" id="allCheck" value ="allCheck" onclick="allCheck()">
		</td>
		<td class="td_default" align="center"><strong>ISBN</strong></td>
		<td class="td_default" align="center"><strong>책</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>책정보</strong></td>
		<td class="td_default" align="center"><strong>판매가</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
		<td></td>

	</tr>
	

	<tr>
		<td height="7">
	</tr>
	
	
	
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	
	<!-- 장바구니 요소 목록 -->
	<form name="cartForm">
	<c:set var="sumTotal" value="${0}"/>
	<c:forEach var="book" items="${bookList}" varStatus="status">
		<input type="hidden" name="isbn" value="${book.isbn}" id="${book.isbn}">
		<input type="hidden" name="title" value="${book.title}" id="${book.title}">
		<input type="hidden" name="author" value="${book.author}" id="${book.author}">
		<input type="hidden" name="publisher" value="${book.publisher}" id="${book.publisher}">
		<input type="hidden" name="price" value="${book.price}" id="${book.price}">
	
		<tr>
			<td class="td_default" width="80" align="center">
			<input type="checkbox" name="check" id ="check${book.isbn}" class="check" 
			data-isbn="${book.isbn}" value="${book.isbn}">
			</td>
		
			<!-- ISBN -->
			<td class="td_default" width="120">
				<font size="2">${book.isbn}</font>
			</td>
			<!-- 이미지 -->
			<td class="td_default" width="80" style="cursor:pointer" onclick="goBookInfo(${book.isbn})">
				<img src="images/books/${book.isbn}.jpg" border="0" align="center" width="80" />
			</td>
			<!-- 책 정보 -->
			<td class="td_default" width="300" style='padding-left: 30px' colspan="2" >
				<div style="cursor:pointer">
					${book.title } <br> 
					<font size="2" color="#665b5f">
					저자명 : ${book.author} <br>
					출판사(${book.publisher}) <br>
					</font>
				</div>
			</td>
			<!-- 가격 -->
			<td class="td_default" align="center" width="110">
				<span id="cart_price${book.isbn}">${book.price} </span>
			</td>
			
			<!-- 수량 -->
			<td class="td_default" align="center" width="90">
			<input
				class="input_default" type="text" name="cart_amount"
				id="cart_amount${book.isbn}" style="text-align: right" maxlength="3"
				size="2" value="0" data-amount=""></input>
			</td>
			<!-- 수량 버튼 -->
			<td><input type="button" value="+"
				onclick="amountAsc(${book.isbn})" style="cursor:pointer"/>
				<br>
				<input type="button" value="- "
				onclick="amountDesc(${book.isbn})" style="cursor:pointer"/>
			</td>
		
			
		</tr>
		
		<tr>
			<td height="15">
		</tr>
		
	</c:forEach>
	</form>
	
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
			<button onclick="orderAllConfirm()" style="cursor:pointer"> 전체 주문하기 </button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button onclick="location.href='MainServlet'" style="cursor:pointer"> 계속 쇼핑하기 </button>&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>

</table>