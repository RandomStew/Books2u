<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books2u</title>
<style>
.serve-list {
	padding-top:70px;
	padding-bottom:70px;
}

.serve-list .container {
	max-width:1100px;
	margin:auto;
}

.serve-list .container .title ul {
	padding-left 0;
	list-style: none;
}

.serve-list .container .title ul li {
	display:inline;
	margin-right: 30px;
}

.serve-list .container .title ul li a {
	color: darkcyan;
}

.serve-list .container .item-list {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	
}

.serve-list .container .item-list .card {
	border: 1px solid #eee;
	border-radius: 5px;
	height: 350px;
	width: 200px;
	padding: 5px;
	margin-bottom: 10px;
}

.serve-list .container .item-list .card	img {
	height: 200px;
	width: 200px;
}

.serve-list .container .item-list .card	p {
	font-size: 14px;
	opacity: .8;
}

.serve-list .container .item-list .card .text button {
	background: black;
	color:white;
	border:2px solid white;
	border-radius: 5px;
	padding: 5px 10px;
	font-size: 10px;
	transition: .5s ease;
}
	
</style>
</head>
<body>
	<h1>Main 화면</h1>
	<jsp:include page="common/top.jsp" flush="true" /><br>
	<hr>
	<jsp:include page="book/search.jsp" flush="true" /> <br>
	<jsp:include page="book/curationMain.jsp" flush="true" />
	
</body>
</html>