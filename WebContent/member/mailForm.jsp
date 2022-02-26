<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="MailServlet" method="post">
	<p>아래 양식에 맞게 문의사항을 입력하여 보내주십시오.</p>
	<h3>1:1 문의</h3>
	아이디 : <input type="text" name="userId" value="${login.userId}" readonly><br>
	이메일 : <input type="text" name="email1" value="${login.email1}">@<input type="text" name="email2" value="${login.email2}"><br>
	<input type="text" name="subject" placeholder="제목"><br>
	<textarea rows="10" cols="50" name="content" placeholder="내용"></textarea><br>
	<input type="submit" value="문의하기">
</form>