<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.menu-bar {
    width: 1080px;
    margin: 0 auto;
    margin-top: 30px;
    background-color: #666;
    height:100px;
    font-size:12px;
    font: "sans-serif";

}

.menu-bar ul{
	list-style:none;
	margin:0;
	padding:0;
}

.menu-bar ul li{
	float:left;
	padding:0px;
}

.menu-bar ul li .item-menu{
background: #666;
color:#fff;
display:block;
line-height:100px;
margin:0px;
padding:0px 25px;
text-align:center;
text-decoration:none;
}



#cartItemList {
	position:absolute;
	z-index:99999;
	border: 0.5px solid blue;
	border-radius: 6px;
	display:none;
	background:lightblue;
}

.menu-bar li a:hover, .menu-bar ul li:hover a{

color:#FFFFFF;
text-decoration:none;
}

.menu-bar li:hover #cartItemList{
display:block;
}

</style>


<script>
	function goCartList() {
		location.href="CartListServlet";
	}
	
	function goBookInfo(isbn) {
		location.href="BookInfoServlet?isbn="+isbn;
	}
</script>
<ul class="nav justify-content-center">
  <li class="nav-item">
    <a class="nav-text active" aria-current="page" href="MainServlet">메인화면</a>
  </li>
  <li style="color:black"> . </li>
  
  <c:choose>
	<c:when test="${empty sessionScope.login}">
		<li class="nav-item">
   			<a class="nav-text" href="LoginUIServlet">로그인</a>
 		</li>
	</c:when>
	<c:when test="${not empty sessionScope.login}">
		<li class="nav-item">
   			<a class="nav-text" href="LogoutServlet">로그아웃</a>
 		</li>
	</c:when>
	</c:choose>
  <li style="color:black"> . </li>
  <li class="nav-item">
    <a class="nav-text" href="JoinUIServlet">회원가입</a>
  </li>
  <li style="color:black"> . </li>
  <li class="nav-item">
    <a class="nav-text" href="CartListServlet">장바구니(${sessionScope.cartSumAmount})</a>
  </li>
    <li style="color:black"> . </li>
  <li class="nav-item">
    <a class="nav-text" href="MyPageServlet">마이페이지</a>
  </li>
  <li style="color:black"> . </li>
  <li class="nav-item">
    <a class="nav-text" href="CustomerCenterServlet">고객센터</a>
  </li>

</ul>

 <!--  <div class="menu-bar">
	<div class="menu">
		<ul>
			<li>
				<c:choose>
					<c:when test="${empty sessionScope.login}">
						<a class="item-menu" href="LoginUIServlet" title="로그인을 해주세요">로그인</a>
					</c:when>
				
					<c:when test="${not empty sessionScope.login}">
						<a class="item-menu" href="LogoutServlet" title="로그아웃">로그아웃</a>
					</c:when>
				</c:choose>
			</li>
			<li><a class="item-menu" href="JoinUIServlet" title="회원가입">회원가입</a></li>
			<li><a class="item-menu" href="MyPageServlet" title="마이페이지">마이페이지</a></li>
			<li><a class="item-menu" href="CartListServlet" title="장바구니">장바구니(${sessionScope.cartSumAmount})</a>
				<div class="cart-wrap">
					<div id="cartItemList">
						<div style="margin:10px;">
							<button onclick="goCartList()">장바구니 가기</button>
							<button>구매하기</button>
						</div>
						<div>
							<table border="0" align="center" cellpadding="1" cellspacing="0" style="display:block;">
								<c:set var="totalSum" value="${0}"></c:set>
								<c:if test="${not empty sessionScope.cartList}">
								<c:forEach var="book" items="${sessionScope.cartList}">
									<tr>
										<td width="275">
											<a href="javascript:goBookInfo(${book.isbn })">${book.title }</a>
										</td>
										
										<td width="75" style="text-align:center;">
											${book.amount } 개
										</td>
										
										<td width="75" style="text-align: right;">
											${book.price }원
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<hr size="1" color="CCCCCC">
										</td>
									</tr>
									<c:set var="totalSum" value="${totalSum + book.amount * book.price }"></c:set>
								</c:forEach>
								</c:if>
								
								<tr>
									<td colspan="3">
									총 상품가격: <span style="color:deeppink; ">${totalSum} 원</span> / 배송비 0원
									</td>
								</tr>
								
							</table>
						</div>
					</div>
				</div>
			</li>
			<li><a class="item-menu" href="CustomerCenterServlet" title="고객센터">고객센터</a></li>
		</ul>
	</div>
</div>
-->