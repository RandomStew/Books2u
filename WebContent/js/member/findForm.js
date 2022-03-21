var userNameResult;
var ssnResult;

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

function updateDisabled() {
	var disabled = true;
	if (userNameResult && ssnResult) {
		disabled = false;
	}
	document.querySelector("input[type=submit]").disabled = disabled;
}
