<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books2u</title>
</head>
<body>
	<h1>주문 상품</h1>
	<jsp:include page="common/top.jsp" flush="true" /><br>
	<hr>
	<jsp:include page="order/orderList.jsp" flush="true" />
</body>
</html>