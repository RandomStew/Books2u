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
		<td height="100">
	</tr>
	
	
	<tr>
		<td align="center">
			<table width="100%" border="1" style="border-collapse: collapse" bordercolor="#CCCCCC">
				<tr>
					<td align="center">
						<img src="images/icons/delivered.png" align="center" border="0" width="100" style="padding-top:30px">
					</td>
				</tr>
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
					<td class="td_default" align="center" style="padding-bottom:30px">
						<font size="4"><b>${sessionScope.login.userName}</b></font>님의 주문이 안전하게 처리되었습니다.
					</td>
				</tr>
				</table>
		</td>
	</tr>
	
	<tr>
		<td height="40">
	</tr>
	
	<!-- 상품 정보 -->
	<tr>
		<td class="td_default"><font class="h4"><b>상품 및 배송정보</b></font>
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td>
			<table width="100%">
				<tr>
					<td class="td_default" width="150" height="35"> 받으시는 분</td>
					<td class="td_default" height="35">${recipient}</td>
				</tr>
				<tr>
					<td class="td_default" height="35"> 주소</td>
					<td>[${recipientPost}] ${recipientAddr1}, ${recipientAddr3}<br>
					<font size="2" color="#CCCCCC">(${recipientAddr1}, ${recipientAddr3})</font></td>
				</tr>
				
				<tr>
					<td class="td_default" height="35"> 연락처</td>
					<td class="td_default" height="35"> ${recipientPhone1} - ${recipientPhone2} - ${recipientPhone3}</td>
				</tr>
			</table>
		</td>	
	</tr>
	

	<tr>
		<td height="20">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td width="100" class="td_default" height="35" align="center" colspan="2"><strong>도서</strong></td>
					<td class="td_default" width="50" height="35" align="center"><strong>수량</strong></td>
				</tr>

 		
    <!--  변수 선언 -->
    <c:set var="totalSum" value="${0}"/>
	<c:forEach var="book" items="${orderList}">
	<c:set var="totalSum" value="${totalSum +(book.price * book.amount)}" />
    </c:forEach>
    <!-- 누적 -->
				<tr>
							
							<!-- 이미지 -->
							<td class="td_default" width="80" align="center">
								<img src="images/books/${order[0].isbn}.jpg" class="img-1" border="0"  width="80" />
							</td>
							
							<!-- 책 정보 -->
							<td class="td_default" width="300" style='padding-left: 30px' align="center">
								${order[0].title } <br> 
								<font size="2" color="#665b5f">
								저자명 : ${order[0].author} <br>
								출판사(${order[0].publisher}) <br>
								</font>
							</td>
								
								
							<!-- 수량 -->
							<td class="td_default" align="center" width="90">
							외 ${orderSumAmount-1} 권
							</td>
					
						</tr>
	

			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>
	
	<!-- 결제 정보 -->
	<tr>
		<td class="td_default" align="center"><b>결제정보</b></td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td>
			<table width="40%" border="1" style="border-collapse: collapse" bordercolor="#CCCCCC" align="center">
				<tr>
					<td class="td_default" width="150" height="35" align="center"> 결제금액</td>
					<td class="td_default" height="35" align = 'right'> 
					<b>${totalSum}</b> 원
					</td>
				</tr>
				<tr>
					<td class="td_default" width="150" height="35" align="center"> 결제수단</td>
					<td class="td_default" height="35" align = 'right'> 
					<span>${payment}</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	

	<tr>
		<td height="40">
	</tr>
	
	
	
	<tr align="center">
		<td>
		<a class="a_default" href="MyPageServlet">주문조회</a> 
		<a class="a_default" href="MainServlet">메인으로 돌아가기</a>
		</td>
	</tr>

	<tr>
		<td height="30">
	</tr>
	
</table>