<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>주문내역 화면</h1>
<hr>
<table border="1">
	<tr>
		<th>ISBN</th>
		<th>책</th>
		<th>상품정보</th>
		<th>판매가</th>
		<th>수량</th>
		<th>합계</th>
		<th>수령인 정보</th>
		<th>결제 수단</th>
		<th>주문일</th>
	</tr>
	<c:choose>
	<c:when test="${empty sessionScope.orderList}">
		<tr>
			<td colspan="9" align="center">
				<h4 style="color:#CCCCCC">장바구니가 비었습니다.</h4>
			</td>
		</tr>
	</c:when>
	<c:otherwise>
	<c:forEach var="order" items="${sessionScope.orderList}" varStatus="status">
		<tr>
			<td>${order.isbn}</td>
			<td>
				<img src="images/books/${order.isbn}.jpg" onclick="javascript:location.href='BookInfoServlet?isbn='+${order.isbn}">
			</td>
			<td>
				${order.title}<br>
				저자명 : ${order.author}<br>
				출판사 : ${order.publisher}<br>
			</td>
			<td>${order.price}</td>
			<td>${order.amount}</td>
			<td>${order.price * order.amount}</td>
			<td>
				수령인 : ${order.recipient}<br>
				우편번호 : ${order.recipientPost}<br>
				도로명주소 : ${order.recipientAddr1}<br>
				지번주소 : ${order.recipientAddr2}<br>
				상세주소 : ${order.recipientAddr3}<br>
				전화번호 : ${order.recipientPhone1}-${order.recipientPhone2}-${order.recipientPhone3}<br>
			</td>
			<td>${order.payment}</td>
			<td>${order.orderDate}</td>
		</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
</table>