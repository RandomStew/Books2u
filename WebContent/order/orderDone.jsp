<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="order" value="${orderList}" />
<c:set var="recipient" value="${order[0].recipient}" />
<c:set var="recipientPost" value="${order[0].recipientPost}" />

<c:set var="recipientAddr1" value="${order[0].recipientAddr1}" />
<c:set var="recipientAddr2" value="${order[0].recipientAddr2}" />
<c:set var="recipientAddr3" value="${order[0].recipientAddr3}" />

<c:set var="recipientPhone1" value="${order[0].recipientPhone1}" />
<c:set var="recipientPhone2" value="${order[0].recipientPhone2}" />
<c:set var="recipientPhone3" value="${order[0].recipientPhone3}" />

<c:set var="payment" value="${order[0].payment}" />



<table width="60%" cellspacing="0" cellpadding="0" align="center">

	
	<!-- 처리 메시지 -->
	
	<tr>
		<td align="center">
			<table width="100%">
				<tr>
					<td height="30">
				</tr>
				<tr align="center">
					<td>
						<font size="5" color="#11C619"><b>주문해주셔서 감사합니다</b></font>
					</td>
				</tr>
			
				<tr>
					<td height="7">
				</tr>
			
				<tr>
					<td align="center" style="padding-bottom:30px">
						<font size="4"><b>${sessionScope.login.userName}</b></font>님의 주문이 안전하게 처리되었습니다.
					</td>
				</tr>
			
				<tr>
					<td align="center">
						<img src="images/icons/delivered.png" align="center" border="0" width="100">
					</td>
				</tr>
				<tr>
					<td height="30">
				</tr>
				

				</table>
		</td>
	</tr>
	
	<tr>
		<td height="40">
	</tr>
	
	<!-- 상품 정보 -->
	<tr>
		<td>
			<table width="60%" align="center">
				<tr>
					<td colspan="2"><font class="h4"><b>주문 정보</b></font></td>
				</tr>
				<tr>
					<td colspan="3">
						<hr size="4" color="CCCCCC">
					</td>
				</tr>
				<tr>
					<td width="100" height="35" align="center" colspan="2"><strong>도서</strong></td>
					<td width="50" height="35" align="center"><strong>수량</strong></td>
				</tr>
				<tr>
					<td colspan="3">
						<hr size="1" color="CCCCCC">
					</td>
				</tr>

 		
			    <!--  변수 선언 -->
			    <c:set var="totalSum" value="${0}"/>
				<c:forEach var="book" items="${orderList}">
				<c:set var="totalSum" value="${totalSum +(book.price * book.amount)}" />
			    </c:forEach>
				
				<tr>			
					<!-- 이미지 -->
					<td width="80" align="center">
						<img src="images/books/${order[0].isbn}.jpg" class="img-1" border="0"  width="80" />
					</td>
									
					<!-- 책 정보 -->
					<td width="300" style='padding-left: 30px' align="center">
						${order[0].title } <br> 
						<font size="2" color="#665b5f">
						저자명 : ${order[0].author} <br>
						출판사(${order[0].publisher}) <br>
						</font>
					</td>
										
										
					<!-- 수량 -->
					<td align="center" width="90">
					외 ${orderSumAmount-1} 권
					</td>
							
				</tr>
				<tr>
					<td colspan="3">
						<hr size="1" color="CCCCCC">
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center"> 결제금액</td>
					<td align ='center'> 
					<b>${totalSum}</b> 원
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"> 결제수단</td>
					<td align='center'> 
					<span>${payment}</span>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<hr size="4" color="CCCCCC">
					</td>
				</tr>
	

			</table>

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td>
			<table width="60%" align="center">
				<tr>
					<td colspan="2"><font class="h4"><b>배송 정보</b></font></td>
				</tr>
				<tr>
					<td colspan="3">
						<hr size="4" color="CCCCCC">
					</td>
				</tr>
				<tr>
					<td width="150" height="35"> 받으시는 분</td>
					<td height="35">${recipient}</td>
				</tr>
				<tr>
					<td colspan="3">
						<hr size="1" color="CCCCCC">
					</td>
				</tr>
				<tr>
					<td height="35"> 주소</td>
					<td>[${recipientPost}] ${recipientAddr1}, ${recipientAddr3}<br>
					<font size="2" color="#CCCCCC">(${recipientAddr1}, ${recipientAddr3})</font></td>
				</tr>
				<tr>
					<td colspan="3">
						<hr size="1" color="CCCCCC">
					</td>
				</tr>
				<tr>
					<td height="35"> 연락처</td>
					<td height="35"> ${recipientPhone1} - ${recipientPhone2} - ${recipientPhone3}</td>
				</tr>
				<tr>
					<td colspan="3">
						<hr size="4" color="CCCCCC">
					</td>
				</tr>
			</table>
		</td>	
	</tr>

	<tr align="center">
		<td>
			<div class="d-grid gap-2 col-6 mx-auto">
			  <button onclick="location.href='MainServlet'" class="btn btn-outline-secondary" type="button">메인으로 돌아가기</button>
			  <button onclick="location.href='MyPageServlet'" class="btn btn-dark" type="button">주문조회</button>
			</div>
		</td>
	</tr>

	<tr>
		<td height="30">
	</tr>
	
</table>