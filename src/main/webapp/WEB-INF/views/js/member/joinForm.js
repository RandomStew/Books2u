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
					userIdResult = true;
				}
				document.querySelector("#userIdResult").innerText = message;
				updateDisabled();
			}
		};
		httpRequest.open("get", "IdDuplicateCheckServlet?userId=" + userId, true);
		httpRequest.send(null);
	} else {
		document.querySelector("#userIdResult").innerText = message;
		updateDisabled();
	}
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
	var message = "형식에 맞게 입력해주세요";
	if (userName.length > 1 && !/[^ㄱ-힣]/.test(userName)) {
		if (userName.length > 5) {
			event.target.value = userName.slice(0, 5);
		}
		if (!/[ㄱ-ㅎ]/.test(document.querySelector("input[name=userName]").value)) {
			message = "";
			userNameResult = true;
		}
	}
	document.querySelector("#userNameResult").innerText = message;
	updateDisabled();
}

function validateSsn() {
	ssnResult = false;
	var ssn1 = document.querySelector("input[name=ssn1]").value;
	var ssn2 = document.querySelector("input[name=ssn2]").value;
	var message = "형식에 맞게 입력해주세요";
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
	var message = "형식에 맞게 입력해주세요";
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
	var message = "형식에 맞게 입력해주세요";
	if (email1.length > 3 && email2.length > 3 && !/[ㄱ-힣]/.test(email1) && !/[ㄱ-힣]/.test(email2)) {
		message = "";
		emailResult = true;
	}
	document.querySelector("#emailResult").innerText = message;
	updateDisabled();
}

//function updateDisabled() {
//	var disabled = true;
//	if (userIdResult && passWdResult && userNameResult && ssnResult && phoneResult && emailResult) {
//		if (document.querySelector("#sample4_jibunAddress").value != "") {
//			disabled = false;
//		}
//	}
//	document.querySelector("input[type=submit]").disabled = disabled;
//}
