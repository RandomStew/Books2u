<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <script>
	function goBookInfo(isbn) {
		location.href=`bookInfo?isbn=\${isbn}`;
	}
	
	function amountAsc(isbn) {
		var amountTag = document.querySelector("#cart_amount"+isbn);
		amountTag.value -= -1;
	}
	
	function amountDesc(isbn) {
		var amountTag = document.querySelector("#cart_amount"+isbn);
		if(amountTag.value > 1) {
			amountTag.value -= 1;
		}
	}
	

	function goCartList(isbn) {
		// Ajax 를 활용해서 cartList.jsp로 cartDTO에 필요한 데이터 전송
		
		var amountTag = document.querySelector("#cart_amount"+isbn);
		
		var title = document.querySelector("#hiddenTitle"+isbn).value;
		var author = document.querySelector("#hiddenAuthor"+isbn).value;
		var publisher = document.querySelector("#hiddenPublisher"+isbn).value;
		var price = document.querySelector("#hiddenPrice"+isbn).value;
		var userId = document.querySelector("#hiddenId"+isbn).value;
		if(!userId) {
			alert("로그인을 해주세요");
			amountTag.value = 1;
			return;
		}
		var data = `userId=\${userId}&isbn=\${isbn}&`
		+`title=\${title}&author=\${author}&publisher=\${publisher}&`
		+`price=\${price}&amount=\${amountTag.value}`;
		// console.log(data);
		
		var httpRequest = new XMLHttpRequest();
		// post 방식 Ajax 통신
		httpRequest.open("POST", "cartAdd", true);
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
		location.reload();
		
		
	}
	

 </script>

<div class="container">
	<table width="90%" cellspacing="0" cellpadding="0" border="0">
	
		<tr><td height="30"/></tr>
		
		<tr>
			<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp;
				<font size="5"> ${title } 키워드 검색 결과입니다. </font>&nbsp;
			</td>
		</tr>
		
		<tr><td height="15"></td>
		<tr><td colspan="10"><hr size="4" color="CCCCCC"></td></tr>
		<tr><td height="7"></tr>
		
		<!-- 테이블 HEADER -->
		<tr>
			<td class="td_default" align="center"><strong>ISBN</strong></td>
			<td class="td_default" align="center"><strong>책</strong></td>
			<td class="td_default" align="center" colspan="2"><strong>책정보</strong></td>
			<td class="td_default" align="center"><strong>판매가</strong></td>
			<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
			<td class="td_default" align="center"><strong>장바구니</strong> </td>
	
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
	
		<c:forEach var="book" items="${pageDTO.list}" varStatus="status">
			<input type="hidden" name="isbn" value="${book.isbn}" id="hidden${book.isbn}">
			<input type="hidden" name="title" value="${book.title}" id="hiddenTitle${book.isbn}">
			<input type="hidden" name="author" value="${book.author}" id="hiddenAuthor${book.isbn}">
			<input type="hidden" name="publisher" value="${book.publisher}" id="hiddenPublisher${book.isbn}">
			<input type="hidden" name="price" value="${book.price}" id="hiddenPrice${book.isbn}">
			<input type="hidden" name="userId" value="${sessionScope.login.userId}" id="hiddenId${book.isbn}">
			
			<tr>
			
				<!-- ISBN -->
				<td class="td_default" width="120">
					<font size="2">${book.isbn}</font>
				</td>
				<!-- 이미지 -->
				<td class="td_default" width="80" style="cursor:pointer" onclick="goBookInfo(${book.isbn})">
					<img src="images/books/${book.isbn}.jpg" class="img-1" border="0" align="center" width="80"  />
				</td>
				<!-- 책 정보 -->
				<td class="td_default" width="300" style='padding-left: 30px' colspan="2" >
					<div style="cursor:pointer" onclick="goBookInfo(${book.isbn})">
						<span id="title${book.isbn}">${book.title }</span> <br> 
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
					size="2" value="1" data-amount=""></input>
				</td>
				<!-- 수량 버튼 -->
				<td><input type="button" value="+"
					onclick="amountAsc(${book.isbn})" style="cursor:pointer"/>
					<br>
					<input type="button" value="- "
					onclick="amountDesc(${book.isbn})" style="cursor:pointer"/>
				</td>
				
				<!--  장바구니 담기 -->
				<td>
					&nbsp;&nbsp; <input type="button" value="장바구니에 담기" onclick="goCartList(${book.isbn})">
				</td>
			</tr>
			
			<tr>
				<td height="30">
			</tr>
			
		</c:forEach>
		<tr><td colspan="10"><hr size="4" color="CCCCCC"></td></tr>
		
		<!-- 페이징 링크 처리 부분 -->
		
		<tr>
			<td colspan="6">
			<!--pageTag -->
			<c:set var="curPage" value="${pageDTO.curPage }"></c:set>
			<c:set var="totalRecord" value="${pageDTO.totalPage }"></c:set>
			<c:set var="perPage" value="${pageDTO.perPage }"></c:set>
			<c:set var="totalPage" value="${Math.ceil(totalRecord / perPage) }"></c:set>
	
			<c:set var="division" value="${(curPage-1) / 10 }"></c:set>
			<fmt:parseNumber var="division" value="${division}" integerOnly="true"/>
	
			<c:set var="startPoint" value="${division * 10 + 1 }"></c:set>
			<c:set var="endPoint" value ="${division*10+10 }"></c:set>
			
			<c:if test="${totalPage < endPoint }">
				<c:set var="endPoint" value="${totalPage }"></c:set>
			</c:if>
			
			<!-- 현재페이지가 2 이상일 때 이전 버튼이 존재 -->
			<c:if test="${curPage > 1 }">
				<a href="searchList?curPage=${curPage-1}&search=${title}&type=${type}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${startPoint}" end="${endPoint}">
				<input type="hidden" name="curPage" value="${i}">
				<c:if test="${i==curPage}">
					${i}
				</c:if>
				<c:if test="${i!=curPage}">
					<a href="searchList?curPage=${i}&search=${title}&type=${type}">${i}</a>
				</c:if>
			</c:forEach>
			
			<!--  curPage < totalPage 일 떄 존재 -->
			<c:if test="${curPage < totalPage }">
				<a href="searchList?curPage=${curPage+1}&search=${title}&type=${type}">다음</a>  
			</c:if>
			</td>
		<tr>
		</form>
	
	</table>
</div>

