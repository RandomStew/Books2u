<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	
	function getSameInfo(n){
		
		if(n.checked){
			
			//이름
			var userName = document.querySelector("#hiddenUserName").value;
			document.querySelector("#recipient").value = userName;
			
			//우편번호
			var post = document.querySelector("#hiddenPost").value;
			document.querySelector("#recipientPost").value = post;
			
			//주소
			var addr1 = document.querySelector("#hiddenAddr1").value;
			document.querySelector("#recipientAddr1").value = addr1;
			var addr2 = document.querySelector("#hiddenAddr2").value;
			document.querySelector("#recipientAddr2").value = addr2;
			var addr3 = document.querySelector("#hiddenAddr3").value;
			document.querySelector("#recipientAddr3").value = addr3;
			
			//연락처
			var phone1 = document.querySelector("#hiddenPhone1").value;
			document.querySelector("#recipientPhone1").value = phone1;
			var phone2 = document.querySelector("#hiddenPhone2").value;
			document.querySelector("#recipientPhone2").value = phone2;
			var phone3 = document.querySelector("#hiddenPhone3").value;
			document.querySelector("#recipientPhone3").value = phone3;
			
		} else{
			document.querySelector("#recipient").value = "";
			document.querySelector("#recipientPost").value = "";
			document.querySelector("#recipientAddr1").value = "";
			document.querySelector("#recipientAddr2").value = "";
			document.querySelector("#recipientAddr3").value = "";
			document.querySelector("#recipientPhone1").value = "";
			document.querySelector("#recipientPhone2").value = "";
			document.querySelector("#recipientPhone3").value = "";
		}
	}
	
	//비어있으면 submit방지
	 $(document).ready(function(){
		 $("input[type=submit]").on("click", function(){
		 		if($("#recipient").val().length == 0){
		 			alert("수령인을 입력해주세요.");
		 			$("#recipient").focus();
		 			return false;
		 		} else if($("#recipientPost").val().length == 0){
		 			alert("배송지를 입력해주세요.");
		 			$("#recipientPost").focus();
		 			return false;
		 		} else if($("#recipientPhone1").val().length == 0 || $("#recipientPhone2").val().length == 0 || $("#recipientPhone3").val().length == 0){
		 			alert("연락처를 입력해주세요.");
		 			$("#recipientPhone1").focus();
		 			return false;
		 		} else if($("#recipientPhone1").val().length != 3 || $("#recipientPhone2").val().length < 3 || $("#recipientPhone3").val().length != 4 ||
		 				/[^0-9]/.test($("#recipientPhone1").val()) || /[^0-9]/.test($("#recipientPhone2").val()) || /[^0-9]/.test($("#recipientPhone3").val())){
		 			alert("연락처를 확인해주세요.");
		 			$("#recipientPhone1").focus();
		 			return false;
		 		}
		 	});
	 });
	 

</script>
<!-- 
form[name='orderForm']에서 넘기는 input key 값
orderList
------ foreach -------
isbn
title
author
publisher
price
amount
------ foreach -------

수령인정보
recipient
recipientPost
recipientAddr1
recipientAddr2
recipientAddr3
recipientPhone1
recipientPhone2
recipientPhone3
payment


isDirect
 -->
 
<form name="orderForm" action="orderDone" method="post">
	<table width="80%" cellspacing="0" cellpadding="0" align="center">

		<tr>
			<td height="30">
		</tr>
		
		<!-- 주문 상품 정보 -->	
		<tr>
			<td class="h3"><b>주문상품</b></td>
			<td><input type="hidden" name="orderList" value="${orderList}"></td>
		</tr>

		<tr>
			<td height="15">
		</tr>

		<tr>
			<td>
				<hr size="4" color="CCCCCC">
			</td>
		</tr>

		<tr>
			<td height="5">
		</tr>

		<tr>
			<td>
 				<table width="100%" cellspacing="0" cellpadding="0">
					<tr>
						<td  align="center"><strong>ISBN</strong></td>
						<td  align="center"><strong>책</strong></td>
						<td  align="center"><strong>상품정보</strong></td>
						<td  align="center"><strong>수량</strong></td>
						<td  align="center"><strong>합계</strong></td>
					</tr>
	
							
					<c:set var="sumTotal" value="${0}"/>
					
					<c:forEach var="book" items="${orderList}">
					<input type="hidden" name="isbn" value="${book.isbn}" id="hiddenIsbn${book.isbn}">
					<input type="hidden" name="title" value="${book.title}" id="hiddenTitle${book.isbn}">
					<input type="hidden" name="author" value="${book.author}" id="hiddenAuthor${book.isbn}">
					<input type="hidden" name="publisher" value="${book.publisher}" id="hiddenPublisher${book.isbn}">
					<input type="hidden" name="price" value="${book.price}" id="hiddenPrice${book.isbn}">
					<input type="hidden" name="amount" value="${book.amount}" id="hiddenAmount${book.isbn}">
					<c:set var="sumTotal" value="${sumTotal + (book.price*book.amount)}"/>
						
						<tr>
							<td colspan="5">
							<hr size="1" color="CCCCCC">
							</td>
						</tr>
					
						<tr>
							<!-- ISBN -->
							<td  width="120" align="center">
								<font size="2">${book.isbn}</font>
							</td>
							
							<!-- 이미지 -->
							<td  width="80">
								<img src="images/books/${book.isbn}.jpg" onclick="goBookInfo(${book.isbn})" class="img-1" border="0" align="center" width="80" />
							</td>
							
							<!-- 책 정보 -->
							<td width="300" style='padding-left: 30px' align="center">
								${book.title } <br> 
								<font size="2" color="#665b5f">
								저자명 : ${book.author} <br>
								출판사(${book.publisher}) <br>
								</font>
							</td>
								
								
							<!-- 수량 -->
							<td  align="center" width="90">
							${book.amount}
							</td>
							
							
							<!-- 합계 -->
							<td class="cart_sum" align="center" width="110" style='padding-left: 5px'>
								<span id="cart_sum${book.isbn}"> ${book.price*book.amount} </span>
							</td>
					
						</tr>
					</c:forEach>
					
						<tr>
							<td colspan="5">
							<hr size="1" color="CCCCCC">
							</td>
						</tr>
				
				
						<tr>
							<td height="30"></td>
							<td align="right">총 결제 금액</td>
							<td align="right">${sumTotal}원</td>
						</tr>
				</table>
				<!-- 주문 상품 정보 END -->
		
		<tr>
			<td>
				<hr size="4" color="CCCCCC">
			</td>
		</tr>
		
		
		<tr>
			<td height="50">
		</tr>
		
		<!-- 고객 정보 -->
	
		<tr>
			<td>
				<table width="60%" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td class="h3" colspan="2">
							<b>고객 정보</b>
							<input type="hidden" name="userId" id="hiddenUserId" value="${sessionScope.login.userId}">
							<input type="hidden" name="userName" id="hiddenUserName" value="${sessionScope.login.userName}">
							<input type="hidden" name="post" id="hiddenPost" value="${sessionScope.login.post}">
							<input type="hidden" name="addr1" id="hiddenAddr1" value="${sessionScope.login.addr1}">
							<input type="hidden" name="addr2" id="hiddenAddr2" value="${sessionScope.login.addr2}">
							<input type="hidden" name="addr3" id="hiddenAddr3" value="${sessionScope.login.addr3}">
							<input type="hidden" name="phone1" id="hiddenPhone1" value="${sessionScope.login.phone1}">
							<input type="hidden" name="phone2" id="hiddenPhone2" value="${sessionScope.login.phone2}">
							<input type="hidden" name="phone3" id="hiddenPhone3" value="${sessionScope.login.phone3}">
							
							<input type="hidden" name="isDirect" id="hiddenIsDirect" value="${isDirect }">
						</td>
					</tr>
					
					<tr>
						<td height="15">
					</tr>
					<tr>
						<td colspan="5">
							<hr size="4" color="CCCCCC">
						</td>
					</tr>
					<!-- 고객 이름 -->
					<tr>
						<td width="125" height="35"  align="center">이 름</td>
						<td height="35"  align="center">
						${sessionScope.login.userName}
						</td>
					</tr>
					
					<tr>
						<td colspan="5">
							<hr size="1" color="CCCCCC">
						</td>
					</tr>
				
					<!-- 고객 주소 -->
					<tr>
						<td height="35"  align="center">주 소</td>
						<td height="35"  align="center">
						[ ${sessionScope.login.post} ]
						${sessionScope.login.addr1}, ${sessionScope.login.addr3}<br>
							<font size="2" color="#665b5f">
								(${sessionScope.login.addr1}, ${sessionScope.login.addr3})
							</font>
						
						</td>
					</tr>
					
					<tr>
						<td colspan="5">
							<hr size="1" color="CCCCCC">
						</td>
					</tr>
					
					<!-- 고객 연락처 -->
					<tr>
						<td height="35"  align="center">연락처</td>
						<td height="35"  align="center">
						${sessionScope.login.phone1} - ${sessionScope.login.phone2} - ${sessionScope.login.phone3}	
						</td>
					</tr>
					
					<tr>
						<td colspan="5">
							<hr size="4" color="CCCCCC">
						</td>
					</tr>
					
				</table>							
			</td>
		</tr>
	<!-- 고객 정보 END -->	
	
	
	<!-- 배송지 정보 -->
	<tr>
		<td height="50">
	</tr>
	
	<tr>
		<td>
			<table width="60%" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td colspan="2" class="h3"><b>배송지 정보</b></td>
				</tr>
			
				<tr>
					<td height="30">
				</tr>
			<tr>
				<td  colspan="3">
					<input type="checkbox" name="sameInfo" onclick="javascript:getSameInfo(this);"> 고객정보와 동일
				</td>
			</tr>
					
				<tr>
					<td colspan="5">
						<hr size="4" color="CCCCCC">
					</td>
				</tr>
				
				<!-- 수령인 이름 -->
				<tr>
					<td width="125" height="35"  align="center">수령인</td>
					<td height="35"  >
						<input type="text" id="recipient" name="recipient" size="20" maxlength="5" placeholder="이름">
					</td>
				</tr>
				
				<tr>
					<td colspan="5">
						<hr size="1" color="CCCCCC">
					</td>
				</tr>
				
				<!-- 배송지 정보 -->
				<tr>
					<!-- 다음주소 끝 -->
					<td height="35"  align="center">배송지 주소</td>
					<td height="35" class="td_default">
						<input name="recipientPost" id="recipientPost" size="5" readonly>
						<input onclick="openDaumPostcode()" type="button" value="우편번호찾기" pattern=".{5,}"  style="margin-bottom:5px" class="btn btn-outline-dark btn-sm">
						<br>
						<input name="recipientAddr1" id="recipientAddr1" size="40" readonly placeholder="도로명주소" pattern=".{1,}"  style="margin-bottom:5px">
						<br>
						<span style="line-height: 10%;"></span>
						<input name="recipientAddr2" id="recipientAddr2" size="40" placeholder="지번주소" pattern=".{1,}" style="margin-bottom:5px">
						<input name="recipientAddr3" id="recipientAddr3" size="40" placeholder="상세주소(직접 입력)">
					</td>
					<!-- 다음주소 끝 -->		
				</tr>
				
				<tr>
					<td colspan="5">
						<hr size="1" color="CCCCCC">
					</td>
				</tr>
				
				<!-- 수령인 연락처 -->
				<tr>
					<td height="35"  align="center">휴대전화</td>
					<td height="35">
						<input type="text" name="recipientPhone1" id="recipientPhone1" maxlength="3" size="4"> - 
						<input type="text" name="recipientPhone2" id="recipientPhone2" maxlength="4" size="5"> - 
						<input type="text" name="recipientPhone3" id="recipientPhone3" maxlength="4" size="5">
					</td>
				</tr>
				
				<tr>
					<td colspan="5">
						<hr size="4" color="CCCCCC">
					</td>
				</tr>
			</table>							
	<!--  배송지 정보 끝-->
	
	<!-- 결제 수단 -->
	
		
		<tr>
			<td height="50">
		</tr>
		
		<tr>
			<td>
				<table width="60%" cellspacing="0" cellpadding="0" align="center">
					<tr class="h3">
						<td colspan="2"><b>결제수단</b></td>
					</tr>
			
					<tr>
						<td height="15">
					</tr>
					<tr>
						<td colspan="5">
							<hr size="4" color="CCCCCC">
						</td>
					</tr>
					<tr align="center">
						<td width="125" height="35">
							<input type="radio" name="payment" value="신용카드" checked>&nbsp;신용카드 &nbsp;
							<input type="radio" name="payment" value="계좌이체">&nbsp;계좌이체 &nbsp;
							<input type="radio" name="payment" value="무통장 입금" >&nbsp;무통장 입금 &nbsp;
						</td>
					</tr>
					<tr>
					<td colspan="5">
						<hr size="4" color="CCCCCC">
					</td>
				</tr>
				</table>							
			</td>
		</tr>
		
		<tr>
			<td height="30">
		</tr>
	
	
		<tr>
			<td align="center">
				<input type='button' value='주문취소' onclick="javascript:history.back()" class="btn btn-outline-danger"> &nbsp;
				<input type='submit' value='결제하기' class="btn btn-dark btn-lg">
			</td>
		</tr>
		
	<!-- 결제 수단 END -->
		
	</table>

</form>

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function openDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('recipientPost').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('recipientAddr1').value = fullRoadAddr;
						document.getElementById('recipientAddr2').value = data.jibunAddress;

					}
				}).open();
	}
</script>