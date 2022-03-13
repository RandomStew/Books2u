<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="text-center">
	<div class="form-signin">
		<form action="LoginServlet" method="get">
			<div class="form-floating">
				<input type="text" name="userId" required maxlength="10" class="form-control" placeholder="아이디">
				<label>아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" name="passWd" required maxlength="12" class="form-control" placeholder="비밀번호">
				<label>비밀번호</label>
			</div>
			<input type="submit" value="로그인" class="w-100 btn btn-lg btn-outline-dark">
			<input type="hidden" name="prevPage" value="${header.referer}">
		</form>
	</div>
</div>
