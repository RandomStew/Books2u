<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<script type="text/javascript">

	var userIdResult;
	var passWdResult;
	var userNameResult;
	var ssn1Result;
	var ssn2Result;
	var phone1Result;
	var phone2Result;
	var phone3Result;
	var email1Result;
	var email2Result;

	function validateUserId() {
		userIdResult = false;
		event.target.value = event.target.value.replace(/[^a-z|A-Z|0-9]/, '');
		var userId = event.target.value;
		if (userId.length > 3) {
			httpRequest = new XMLHttpRequest();
			httpRequest.onreadystatechange = function() {
				if (httpRequest.readyState == 4 && httpRequest.status == 200) {
					var message = httpRequest.responseText;
					document.querySelector("#userIdResult").innerText = message;
					if (message == "아이디 사용 가능") {
						userIdResult = true;
					}
				}
			};
			httpRequest.open("get", "IdDuplicateCheckServlet?userId=" + userId, true);
			httpRequest.send(null);
		} else {
			document.querySelector("#userIdResult").innerText = "5~10자, 한글 또는 특수문자 사용불가";
		}
		updateDisabled();
	}

	function validatePassWd() {
		passWdResult = false;
		var passWd = document.querySelector("input[name=passWd]").value;
		var passWd2 = document.querySelector("input[name=passWd2]").value;
		var message = "비밀번호 불일치";
		if (passWd.length > 7 && passWd == passWd2 && /[a-z]/.test(passWd) && /[A-Z]/.test(passWd) && /[0-9]/.test(passWd)) {
			message = "비밀번호 일치";
			passWdResult = true;
		}
		document.querySelector("#passWdResult").innerText = message;
		updateDisabled();
	}

	function validateUserName() {
		userNameResult = false;
		event.target.value = event.target.value.replace(/[^ㄱ-ㅎ|가-힣]/, '');
		var userName = event.target.value;
		if (userName.length > 1) {
			if (userName.length > 5) {
				event.target.value = event.target.value.slice(0, 5);
			}
			userNameResult = true;
		}
		updateDisabled();
	}

	function validateSsn1() {
		ssn1Result = false;
		event.target.value = event.target.value.replace(/[^0-9]/, '');
		var ssn1 = event.target.value;
		if (ssn1.length == 6) {
			var y = Number(ssn1.substr(0, 2));
			var m = Number(ssn1.substr(2, 2));
			var d = Number(ssn1.substr(4, 2));
			var date = new Date(m + "-" + d + "-" + y);
			if (date.getFullYear() % 100 == y && date.getMonth() == m - 1 && date.getDate() == d) {
				if ((new Date() - date) / 86400000 >= 1) {
					ssn1Result = true;
				}
			}
		}
		updateDisabled();
	}

	function validateSsn2() {
		ssn2Result = false;
		event.target.value = event.target.value.replace(/[^0-9]/, '');
		var ssn2 = event.target.value;
		if (ssn2.length == 7) {
			ssn2Result = true;
		}
		updateDisabled();
	}

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
		if (userIdResult && passWdResult && userNameResult && ssn1Result && ssn2Result && phone1Result && phone2Result && phone3Result && email1Result && email2Result) {
			if (/[ㄱ-ㅎ]/.test(document.querySelector("input[name=userName]").value)) {
				userNameResult = false;
				document.querySelector("input[type=submit]").disabled = true;
			} else if (document.querySelector("#sample4_postcode").value != "") {
				document.querySelector("input[type=submit]").disabled = false;
			}
		} else {
			document.querySelector("input[type=submit]").disabled = true;
		}
	}

</script>
<form action="JoinServlet" method="post" onkeydown="return event.key != 'Enter';">
	아이디 : <input type="text" name="userId" maxlength="10" oninput="validateUserId()">
	<span id="userIdResult" style="color:red"></span><br>
	
	비밀번호 : <input type="password" name="passWd" maxlength="12" onkeyup="validatePassWd()"><br>
	비밀번호 확인 : <input type="password" name="passWd2" maxlength="12" onkeyup="validatePassWd()">
	<span id="passWdResult" style="color:red"></span><br>
	
	이름 : <input type="text" name="userName" oninput="validateUserName()"><br>
	주민등록번호 : <input type="text" name="ssn1" maxlength="6" oninput="validateSsn1()"> - <input type="text" name="ssn2" maxlength="7" oninput="validateSsn2()"><br>
	전화번호 : <input type="text" name="phone1" maxlength="3" oninput="validatePhone1()"> - <input type="text" name="phone2" maxlength="4" oninput="validatePhone2()"> - <input type="text" name="phone3" maxlength="4" oninput="validatePhone3()"><br>
	
	우편번호 : <input type="text" name="post" id="sample4_postcode" placeholder="우편번호" readonly>
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	주소 : <input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" readonly>
	<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" readonly>
	<input type="text" name="addr3" placeholder="상세주소">
	<span id="guide" style="color: #999"></span><br>
	
	이메일 : <input type="text" name="email1" maxlength="16" oninput="validateEmail1()"> @ <input type="text" name="email2" maxlength="16" oninput="validateEmail2()"><br>
	<input type="submit" value="회원가입" disabled> <input type="button" value="돌아가기" onclick="javascript:history.back()">
</form>