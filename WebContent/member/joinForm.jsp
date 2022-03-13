<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<script type="text/javascript">

	var userIdResult;
	var passWdResult;
	var userNameResult;
	var ssnResult;
	var phoneResult;
	var emailResult;

	function validateUserId() {
		userIdResult = false;
		var userId = document.querySelector("input[name=userId]").value;
		var message = "5~10자 / 한글 또는 특수문자 사용 불가";
		if (userId.length > 3 && !/[^\w]/.test(userId)) {
			httpRequest = new XMLHttpRequest();
			httpRequest.onreadystatechange = function() {
				if (httpRequest.readyState == 4 && httpRequest.status == 200) {
					message = httpRequest.responseText;
					if (message == "아이디 사용 가능") {
						document.querySelector("#userIdResult").innerText = message;
						userIdResult = true;
						updateDisabled();
					}
				}
			};
			httpRequest.open("get", "IdDuplicateCheckServlet?userId=" + userId, true);
			httpRequest.send(null);
		} else {
			document.querySelector("#userIdResult").innerText = message;
		}
		updateDisabled();
	}

	function validatePassWd() {
		passWdResult = false;
		var passWd = document.querySelector("input[name=passWd]").value;
		var passWd2 = document.querySelector("input[name=passWd2]").value;
		var message = "8~12자 / 영문 대문자, 소문자, 숫자 각 1개 이상 포함";
		if (passWd.length > 7 && passWd == passWd2 && /[a-z]/.test(passWd) && /[A-Z]/.test(passWd) && /[0-9]/.test(passWd)) {
			message = "비밀번호 확인";
			passWdResult = true;
		}
		document.querySelector("#passWdResult").innerText = message;
		updateDisabled();
	}

	function validateUserName() {
		userNameResult = false;
		var userName = event.target.value;
		var message = "올바른 형식이 아닙니다";
		if (userName.length > 1 && !/[^ㄱ-힣]/.test(userName)) {
			if (userName.length > 5) {
				event.target.value = userName.slice(0, 5);
			}
			message = "";
			userNameResult = true;
		}
		document.querySelector("#userNameResult").innerText = message;
		updateDisabled();
	}

	function validateSsn() {
		ssnResult = false;
		var ssn1 = document.querySelector("input[name=ssn1]").value;
		var ssn2 = document.querySelector("input[name=ssn2]").value;
		var message = "올바른 형식이 아닙니다";
		if (ssn1.length == 6 && ssn2.length == 7 && !/[^0-9]/.test(ssn1) && !/[^0-9]/.test(ssn2)) {
			var y = Number(ssn1.substr(0, 2));
			var m = Number(ssn1.substr(2, 2));
			var d = Number(ssn1.substr(4, 2));
			var date = new Date(m + "-" + d + "-" + y);
			if (date.getFullYear() % 100 == y && date.getMonth() == m - 1 && date.getDate() == d) {
				if ((new Date() - date) / 86400000 >= 1) {
					message = "";
					ssnResult = true;
				}
			}
		}
		document.querySelector("#ssnResult").innerText = message;
		updateDisabled();
	}

	function validatePhone() {
		phoneResult = false;
		var phone1 = document.querySelector("input[name=phone1]").value;
		var phone2 = document.querySelector("input[name=phone2]").value;
		var phone3 = document.querySelector("input[name=phone3]").value;
		var message = "올바른 형식이 아닙니다";
		if (phone1.length == 3 && phone2.length > 2 && phone3.length == 4 && !/[^0-9]/.test(phone1) && !/[^0-9]/.test(phone2) && !/[^0-9]/.test(phone3)) {
			message = "";
			phoneResult = true;
		}
		document.querySelector("#phoneResult").innerText = message;
		updateDisabled();
	}

	function validateEmail() {
		emailResult = false;
		var email1 = document.querySelector("input[name=email1]").value;
		var email2 = document.querySelector("input[name=email2]").value;
		var message = "올바른 형식이 아닙니다";
		if (email1.length > 3 && email2.length > 3 && !/[ㄱ-힣]/.test(email1) && !/[ㄱ-힣]/.test(email2)) {
			message = "";
			emailResult = true;
		}
		document.querySelector("#emailResult").innerText = message;
		updateDisabled();
	}

	function updateDisabled() {
		var disabled = true;
		if (userIdResult && passWdResult && userNameResult && ssnResult && phoneResult && emailResult) {
			if (/[ㄱ-ㅎ]/.test(document.querySelector("input[name=userName]").value)) {
				userNameResult = false;
			} else if (document.querySelector("#sample4_jibunAddress").value != "") {
				disabled = false;
			}
		}
		document.querySelector("input[type=submit]").disabled = disabled;
	}

</script>
<div class="text-center">
	<div class="form-signin">
		<form action="JoinServlet" method="post" onkeyup="return event.key != 'Enter';">
			<div class="form-floating">
				<input type="text" name="userId" maxlength="10" onkeyup="validateUserId()" class="form-control" placeholder="아이디">
				<label>아이디</label>
				<span id="userIdResult" style="color:red"></span>
			</div>
			
			<div class="form-floating">
				<input type="password" name="passWd" maxlength="12" onkeyup="validatePassWd()" class="form-control" placeholder="비밀번호">
				<label>비밀번호</label>
			</div>
			<div class="form-floating">
				<input type="password" name="passWd2" maxlength="12" onkeyup="validatePassWd()" class="form-control" placeholder="비밀번호 확인">
				<label>비밀번호 확인</label>
				<span id="passWdResult" style="color:red"></span>
			</div>
			
			<div class="form-floating">
				<input type="text" name="userName" maxlength="5" onkeyup="validateUserName()" class="form-control" placeholder="이름">
				<label>이름</label>
				<span id="userNameResult" style="color:red"></span>
			</div>
			
			<div class="row">
				<div class="form-floating col-6">
					<input type="text" name="ssn1" maxlength="6" onkeyup="validateSsn()" class="form-control" placeholder="ssn1">
					<label>ssn1</label>
				</div>
				<div class="form-floating col-6">
					<input type="password" name="ssn2" maxlength="7" onkeyup="validateSsn()" class="form-control" placeholder="ssn2">
					<label>ssn2</label>
				</div>
				<span id="ssnResult" style="color:red"></span>
			</div>
			
			<div class="row">
				<div class="form-floating col-4">
					<input type="text" name="phone1" maxlength="3" onkeyup="validatePhone()" class="form-control" placeholder="phone1">
					<label>phone1</label>
				</div>
				<div class="form-floating col-4">
					<input type="text" name="phone2" maxlength="4" onkeyup="validatePhone()" class="form-control" placeholder="phone2">
					<label>phone2</label>
				</div>
				<div class="form-floating col-4">
					<input type="text" name="phone3" maxlength="4" onkeyup="validatePhone()" class="form-control" placeholder="phone3">
					<label>phone3</label>
				</div>
				<span id="phoneResult" style="color:red"></span>
			</div>
			
			<div class="row">
				<div class="form-floating col-6">
					<input type="text" name="post" id="sample4_postcode" placeholder="우편번호" readonly class="form-control">
					<label>우편번호</label>
				</div>
				<div class="form-floating col-6">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="w-100 btn btn-lg btn-outline-dark">
				</div>
			</div>
			
			<div class="row">
				<div class="form-floating col-6">
					<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" readonly class="form-control">
					<label>도로명주소</label>
				</div>
				<div class="form-floating col-6">
					<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" readonly class="form-control">
					<label>지번주소</label>
				</div>
				<span id="guide" style="color: #999"></span>
			</div>
			<div class="form-floating">
				<input type="text" name="addr3" placeholder="상세주소" class="form-control">
				<label>상세주소</label>
			</div>
			
			<div class="row">
				<div class="form-floating col-6">
					<input type="text" name="email1" maxlength="16" onkeyup="validateEmail()" class="form-control" placeholder="email1">
					<label>email1</label>
				</div>
				<div class="form-floating col-6">
					<input type="text" name="email2" maxlength="16" onkeyup="validateEmail()" class="form-control" placeholder="email2">
					<label>email2</label>
				</div>
				<span id="emailResult" style="color:red"></span>
			</div>
			
			<input type="submit" value="회원가입" disabled class="w-100 btn btn-lg btn-outline-dark">
		</form>
	</div>
</div>
