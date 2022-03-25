<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 및 비밀번호 찾기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
	<%@include file="../css/member/joinForm.css"%>
</style>
<script type="text/javascript" src="js/member/findForm.js"></script>
</head>
<body>
	<div class="text-center">
		<div class="form-signin">
			<form action="FindServlet" method="get">
				<div class="form-floating">
					<input type="text" name="userName" maxlength="5" onkeyup="validateUserName()" class="form-control" placeholder="이름">
					<label>이름</label>
					<span id="userNameResult" style="color:red"></span>
				</div>
				
				<div class="row">
					<div class="form-floating col">
						<input type="text" name="ssn1" maxlength="6" onkeyup="validateSsn()" class="form-control" placeholder="주민등록번호">
						<label>주민등록번호</label>
					</div>
					-
					<div class="form-floating col">
						<input type="password" name="ssn2" maxlength="7" onkeyup="validateSsn()" class="form-control">
					</div>
					<span id="ssnResult" style="color:red"></span>
				</div>
				
				<input type="submit" value="아이디 및 비밀번호 찾기" disabled class="w-100 btn btn-lg btn-outline-dark">
			</form>
		</div>
	</div>
</body>
</html>