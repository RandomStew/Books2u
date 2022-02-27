<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<form name="orderForm" method="get" action="orderComplete">
	<table width="80%" cellspacing="0" cellpadding="0">

		<tr>
			<td height="30">
		</tr>

		<tr>
			<td><b>주문상품</b></td>
		</tr>

		<tr>
			<td height="15">
		</tr>

		<tr>
			<td>
				<hr size="1" color="CCCCCC">
			</td>
		</tr>

		<tr>
			<td height="5">
		</tr>

		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0">
					<tr>
						<td class="td_default" align="center"><strong>주문번호</strong></td>
						<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
						<td class="td_default" align="center"><strong>판매가</strong></td>
						<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>

					</tr>
					
	<c:set var="sumTotal" value="${0}"/>
	
	<c:forEach var="cart" items="${cList}">
	<c:set var="sumTotal" value="${sumTotal + (cart.gPrice*cart.gAmount)}"/>
		<input type="hidden" name="cartNum" value="${cart.num}">
		
		
						
					<tr>
						<td colspan="5">
						<hr size="1" color="CCCCCC">
						</td>
					</tr>
	
					<tr>
						<td class="td_default" width="80">${cart.num}</td>
						<td class="td_default" width="80"><img
							src="images/items/${cart.gImage}.gif" border="0" align="center"
							width="80" /></td>
						<td class="td_default" width="300" style='padding-left: 30px'>${cart.gName}
							<br> <font size="2" color="#665b5f">[옵션 : 사이즈(${cart.gSize})
									, 색상(${cart.gColor})]
						</font></td>
							
						<td class="td_default" align="center" width="110">${cart.gPrice}
						</td>
						<td class="td_default" align="center" width="90">${cart.gAmount}</td>
	
					</tr>
		</c:forEach>


				<tr>
					<td height="30"></td>
					<td class="td_default" align="right">총 결제 금액 :</td>
					<td class="td_default" align='right'>${sumTotal}원</td>
				</tr>
			</table> <tr>
		<td>
					<hr size="1" color="CCCCCC">
				</td>
			</tr>

		</td>
	</tr>
	

</table>

</form>