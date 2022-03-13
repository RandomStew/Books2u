var phoneResult = true;
var emailResult = true;

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
	if (phoneResult && emailResult) {
		if (document.querySelector("#sample4_jibunAddress").value != "") {
			disabled = false;
		}
	}
	document.querySelector("input[type=submit]").disabled = disabled;
}

function displayMyPage() {
	var form = document.querySelector("form").style;
	var orderList = document.querySelector("#orderList").style;
	if (form.display == "none") {
		form.display = "block";
		orderList.display = "none";
	}
}

function displayOrderList() {
	var form = document.querySelector("form").style;
	var orderList = document.querySelector("#orderList").style;
	if (orderList.display == "none") {
		form.display = "none";
		orderList.display = "block";
	}
}
