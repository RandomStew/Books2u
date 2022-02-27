<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="MyPageUpdateServlet" method="post">
	아이디 : <input type="text" name="userId" value="${login.userId}" id="userId" readonly>
	이름 : <input type="text" name="userName" value="${login.userName}" id="userName" readonly><br>
	전화번호 : <input type="text" name="phone1" value="${login.phone1}" id="phone1" maxlength="3"> - <input type="text" name="phone2" value="${login.phone2}" id="phone2" maxlength="4"> - <input type="text" name="phone3" value="${login.phone3}" id="phone3" maxlength="4"><br>
	우편번호 : <input type="text" name="post" value="${login.post}" id="sample4_postcode" placeholder="우편번호">
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	주소 : <input type="text" name="addr1" value="${login.addr1}" id="sample4_roadAddress" placeholder="도로명주소">
	<input type="text" name="addr2" value="${login.addr2}" id="sample4_jibunAddress" placeholder="지번주소">
	<input type="text" name="addr3" value="${login.addr3}" id="addr3" placeholder="상세주소">
	<span id="guide" style="color: #999"></span><br>
	이메일 : <input type="text" name="email1" value="${login.email1}" id="email1" maxlength="10">@<input type="text" name="email2" value="${login.email2}" id="email2" maxlength="10"><br>
	<input type="submit" value="회원정보수정"> <input type="button" value="돌아가기" onclick="javascript:history.back()">
</form>