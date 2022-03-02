<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form action="LoginServlet" method="get">
	아이디:<input type="text" name="userId" id="userId" required maxlength="10"><br>
	비밀번호:<input type="password" name="passWd" id="passWd" required maxlength="12"><br>
	<input type="submit" value="로그인"> <input type="button" value="돌아가기" onclick="javascript:history.back()">
	<input type="hidden" name="prevPage" value="${header.referer}">
</form>