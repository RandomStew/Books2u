<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

	var phone1Result = true;
	var phone2Result = true;
	var phone3Result = true;
	var email1Result = true;
	var email2Result = true;

	function validatePhone1() {
		phone1Result = false;
		event.target.value = event.target.value.replace(/[^0-9]/, '');
		var phone1 = event.target.value;
		if (phone1.length == 3) {
			phone1Result = true;
		}
		updateDisabled();
	}

	function validatePhone2() {
		phone2Result = false;
		event.target.value = event.target.value.replace(/[^0-9]/, '');
		var phone2 = event.target.value;
		if (phone2.length > 2) {
			phone2Result = true;
		}
		updateDisabled();
	}

	function validatePhone3() {
		phone3Result = false;
		event.target.value = event.target.value.replace(/[^0-9]/, '');
		var phone3 = event.target.value;
		if (phone3.length == 4) {
			phone3Result = true;
		}
		updateDisabled();
	}

	function validateEmail1() {
		email1Result = false;
		event.target.value = event.target.value.replace(/[ㄱ-ㅎ|가-힣]/, '');
		var email1 = event.target.value;
		if (email1.length > 3) {
			email1Result = true;
		}
		updateDisabled();
	}

	function validateEmail2() {
		email2Result = false;
		event.target.value = event.target.value.replace(/[ㄱ-ㅎ|가-힣]/, '');
		var email2 = event.target.value;
		if (email2.length > 3) {
			email2Result = true;
		}
		updateDisabled();
	}

	function updateDisabled() {
		if (phone1Result && phone2Result && phone3Result && email1Result && email2Result) {
			document.querySelector("input[type=submit]").disabled = false;
		} else {
			document.querySelector("input[type=submit]").disabled = true;
		}
	}

</script>
<form action="MyPageUpdateServlet" method="post">
	아이디 : <input type="text" name="userId" value="${login.userId}" id="userId" readonly><br>
	이름 : <input type="text" name="userName" value="${login.userName}" id="userName" readonly><br>

	전화번호 : <input type="text" name="phone1" value="${login.phone1}" maxlength="3" oninput="validatePhone1()"> - <input type="text" name="phone2" value="${login.phone2}" maxlength="4" oninput="validatePhone2()"> - <input type="text" name="phone3" value="${login.phone3}" maxlength="4" oninput="validatePhone3()"><br>
	
	우편번호 : <input type="text" name="post" value="${login.post}" id="sample4_postcode" placeholder="우편번호" readonly>
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	주소 : <input type="text" name="addr1" value="${login.addr1}" id="sample4_roadAddress" placeholder="도로명주소" readonly>
	<input type="text" name="addr2" value="${login.addr2}" id="sample4_jibunAddress" placeholder="지번주소" readonly>
	<input type="text" name="addr3" value="${login.addr3}" id="addr3" placeholder="상세주소">
	<span id="guide" style="color: #999"></span><br>
	
	이메일 : <input type="text" name="email1" value="${login.email1}" maxlength="16" oninput="validateEmail1()"> @ <input type="text" name="email2" value="${login.email2}" maxlength="16" oninput="validateEmail2()"><br>
	<input type="submit" value="회원가입" disabled> <input type="button" value="돌아가기" onclick="javascript:history.back()">
</form>