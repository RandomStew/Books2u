<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

	var phoneResult = true;
	var emailResult = true;

	function validatePhone() {
		phoneResult = false;
		var phone1 = document.querySelector("input[name=phone1]").value;
		var phone2 = document.querySelector("input[name=phone2]").value;
		var phone3 = document.querySelector("input[name=phone3]").value;
		var message = "올바른 형식이 아닙니다";
		if (phone1.length == 3 && phone2.length > 2 && phone3.length == 4 && !/[^0-9]/.test(phone1) && !/[^0-9]/.test(phone2) && !/[^0-9]/.test(phone3)) {
			message = "사용 가능";
			phoneResult = true;
		}
		document.querySelector("#phoneResult").innerText = message;
		updateDisabled();
	}

	function validateEmail() {
		emailResult = false;
		var email1 = document.querySelector("input[name=email1]").value;
		var email2 = document.querySelector("input[name=email2]").value;
		var message = "한글 사용 불가";
		if (email1.length > 3 && email2.length > 3 && !/[ㄱ-힣]/.test(email1) && !/[ㄱ-힣]/.test(email2)) {
			message = "사용 가능";
			emailResult = true;
		}
		document.querySelector("#emailResult").innerText = message;
		updateDisabled();
	}

	function updateDisabled() {
		var disabled = true;
		if (phoneResult && emailResult) {
			if (document.querySelector("#sample4_jibunAddress").value != "") {
				disabled = false;
			}
		}
		document.querySelector("input[type=submit]").disabled = disabled;
	}

</script>
<form action="MyPageUpdateServlet" method="post">
	아이디 : <input type="text" name="userId" value="${login.userId}" id="userId" readonly><br>
	
	이름 : <input type="text" name="userName" value="${login.userName}" id="userName" readonly><br>

	전화번호 : <input type="text" name="phone1" value="${login.phone1}" maxlength="3" onkeyup="validatePhone()"> - <input type="text" name="phone2" value="${login.phone2}" maxlength="4" onkeyup="validatePhone()"> - <input type="text" name="phone3" value="${login.phone3}" maxlength="4" onkeyup="validatePhone()"><br>
	
	우편번호 : <input type="text" name="post" value="${login.post}" id="sample4_postcode" placeholder="우편번호" readonly>
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	주소 : <input type="text" name="addr1" value="${login.addr1}" id="sample4_roadAddress" placeholder="도로명주소" readonly>
	<input type="text" name="addr2" value="${login.addr2}" id="sample4_jibunAddress" placeholder="지번주소" readonly>
	<input type="text" name="addr3" value="${login.addr3}" id="addr3" placeholder="상세주소" onkeyup="updateDisabled()">
	<span id="guide" style="color: #999"></span><br>
	
	이메일 : <input type="text" name="email1" value="${login.email1}" maxlength="16" onkeyup="validateEmail()"> @ <input type="text" name="email2" value="${login.email2}" maxlength="16" onkeyup="validateEmail()"><br>
	<input type="submit" value="회원정보수정" disabled> <input type="button" value="돌아가기" onclick="javascript:history.back()">
</form>