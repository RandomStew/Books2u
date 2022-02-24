<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script>
	function goBookInfo(isbn) {
		location.href=`BookInfoServlet?isbn=\${isbn}`;
	}
	

 </script>
 
<table width="90%" cellspacing="0" cellpadding="0" border="0">

	<tr>
		<td height="40">
	</tr>

	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; <font
			size="5"><b>${title} 키워드 검색 결과</b></font> &nbsp;
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>
		<td class="td_default" align="center"><strong>ISBN</strong></td>
		<td class="td_default" align="center"><strong>책</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
		<td class="td_default" align="center"><strong>판매가</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
		<td class="td_default" align="center"><strong>주문/장바구니</strong></td>
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



<c:forEach var="book" items="${bookList}" varStatus="status">
		<tr>
			<td class="td_default" width="120">
			<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. -->
			<font size="2">${book.isbn}</font>
			</td>
			
			<td class="td_default" width="80"><img
				src="images/books/${book.isbn}.jpg" border="0" align="center"
				width="80" onclick="goBookInfo('${book.isbn}')" style="cursor:pointer;"/>
			</td>
			
			<td class="td_default" width="300" style='padding-left: 30px'>
				<div style="cursor:pointer;" onclick="goBookInfo('${book.isbn}')">
					${book.title } <br> 
					<font size="2" color="#665b5f">
					저자명 : ${book.author} <br>
					출판사(${book.publisher}) <br>
					 장르: ${book.genre} <br>
					 출판날짜: ${book.publishDate}]
					</font>
				</div>
			</td>
			
			<td class="td_default" align="center" width="110">
			<span id="cart_price${book.isbn}">${book.price} </span>
			</td>
			
			<td class="td_default" align="center" width="90">
			<input
				class="input_default" type="text" name="cart_amount"
				id="cart_amount${book.isbn }" style="text-align: right" maxlength="3"
				size="2" value="1" data-amount=""></input>
			</td>
			<td><input type="button" value="+"
				onclick="amountAsc(${book.isbn})" />
				<br>
				<input type="button" value="-"
				onclick="amountDesc(${book.isbn})" />
			</td>
			
			<td class="td_default" align="center" width="80"
				style='padding-left: 5px'><span id="sum81">
				<input type="button" value="주문"
				onclick="order(${book.isbn})">
				<br>
				<input type="button" value="장바구니에 넣기"
				onclick="cartList()">
			</td>
			<td>
			
			</td>
			<td height="10"></td>
		</tr>
</c:forEach>


</table>