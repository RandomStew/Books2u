<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<script type="text/javascript">

	var httpRequest;
	
	function requestWithAjax() {
		var userId = event.target.value;
		if (userId.length < 5) {
			document.querySelector("#userIdResult").innerText = "5~10자, 한글 또는 특수문자 사용불가";
		} else {
			httpRequest = new XMLHttpRequest();
			httpRequest.onreadystatechange = responseWithAjax;
			httpRequest.open("get", "IdDuplicateCheckServlet?userId=" + userId, true);
			httpRequest.send(null);
		}
	}

	function responseWithAjax() {
		if (httpRequest.readyState == 4 && httpRequest.status == 200) {
			var message = httpRequest.responseText;
			document.querySelector("#userIdResult").innerText = message;
		}
	}

	function comparePassWd() {
		var passWd = document.querySelector("#passWd").value;
		var passWd2 = document.querySelector("#passWd2").value;
		var message = "";
		if (passWd == passWd2) {
			message = "비밀번호 일치";
		} else
		document.querySelector("#passWdResult").innerText = message;
	}
	
	function validateForm() {
		document.querySelector("form");	
	}
	
</script>
<form action="JoinServlet" method="post" onkeydown="return event.key != 'Enter';">
	아이디 : <input type="text" name="userId" id="userId" onkeyup="requestWithAjax()" maxlength="10">
	<span id="userIdResult" style="color:red">5~10자, 한글 또는 특수문자 사용불가</span><br>
	
	비밀번호 : <input type="password" name="passWd" id="passWd" onkeyup="checkPassWd()" maxlength="10"><br>
	비밀번호 확인 : <input type="password" id="passWd2" onkeyup="checkPassWd()" maxlength="10">
	<span id="passWdResult" style="color:red"></span><br>
	
	이름 : <input type="text" name="userName" id="userName" maxlength="10"><br>
	주민등록번호 : <input type="text" name="ssn1" id="ssn1" maxlength="6"> - <input type="text" name="ssn2" id="ssn2" maxlength="7"><br>
	전화번호 : <input type="text" name="phone1" id="phone1" maxlength="3"> - <input type="text" name="phone2" id="phone2" maxlength="4"> - <input type="text" name="phone3" id="phone3" maxlength="4"><br>
	
	우편번호 : <input type="text" name="post" id="sample4_postcode" placeholder="우편번호" readonly>
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	주소 : <input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" readonly>
	<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" readonly>
	<input type="text" name="addr3" id="addr3" placeholder="상세주소">
	<span id="guide" style="color: #999"></span><br>
	
	이메일 : <input type="text" name="email1" id="email1" maxlength="10">@<input type="text" name="email2" id="email2" maxlength="10"><br>
	<input type="button" value="회원가입" onclick="validateForm()"> <input type="button" value="돌아가기" onclick="javascript:history.back()">
</form>