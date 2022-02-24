<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
     function reqCheck(target){
    	 if(target == 'cart'){
    		 // 장바구니 
    		 var f = document.querySelector("form");
    		 f.action="GoodsCartAddServlet",
    		 f.method="get"
    		 f.submit();
    		 
    	 }else{
    		 // 주문
    		 
    	 }
    	 
     }
</script>

<form name="bookInfoForm" method="GET" action="#">
	    <input type="hidden"  name="Isbn" value="${book.isbn}">
	    <input type="hidden"  name="Name" value="${book.title}"> 
	    <input type="hidden" name="price" value="${book.price}">

	<table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td>
				<table align="center" width="710" cellspacing="0" cellpadding="0"
					border="0" style='margin-left: 30px'>
					<tr>
						<td class="td_default"><font size="5"><b>- 상품 정보 -</b></font>
							&nbsp;</td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td height="1" colspan="8" bgcolor="CECECE"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>

					<tr>
						<td rowspan="7"><img src="images/books/${book.isbn}.jpg"
							border="0" align="center" width="300" /></td>
						<td class="td_title" width="50">ISBN</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>${book.isbn}
						</td>
					</tr>
					<tr>
						<td class="td_title">상품명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>${book.title}</td>
					</tr>
					<tr>
						<td class="td_title" width="50">가격</td>

						<td class="td_red" colspan="2" style='padding-left: 30px'>
						${book.price}
						</td>
					</tr>
					<tr>
						<td class="td_title" width="50">배송비</td>
						<td colspan="2"><font color="#2e56a9" size="2"
							style='padding-left: 30px'><b> 무료배송</b> </font> <font size="2">(도서
								산간지역 별도 배송비 추가)</font></td>

					</tr>
					<tr>
						<td width="50">줄거리</td>
						<td colspan="2" style='padding-left: 50px'>
							${book.story }
						</td>
					</tr>

					<tr>
						<td class="td_title">주문수량</td>
						<td style="padding-left: 30px"><input type="text"
							name="goods_amount" value="1" id="goods_amount"
							style="text-align: right; height: 18px"> 
							<img src="images/icons/up.PNG" id="up" style="cursor:pointer;"> 
							<img src="images/icons/down.PNG"
							id="down" style="cursor:pointer;">		
						</td>
					</tr>
				</table>

			</td>
		</tr>
	</table>

	<br> 
	<div>
	<button onclick="reqCheck('order')">구매</button>
	&nbsp;&nbsp;
	<button onclick="reqCheck('cart')">장바구니</button>
	</div>
</form>

<br>