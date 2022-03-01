<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="js/member/postcode.js" ></script>
</head>
<body>
	<h1>회원가입 화면입니다.</h1>
	<jsp:include page="common/top.jsp" flush="true" /><br>
	<hr>
	<jsp:include page="member/joinForm.jsp" flush="true" />
</body>
</html>