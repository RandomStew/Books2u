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

</script>
<div class="text-center">
	<div class="form-signin">
		<form action="MyPageUpdateServlet" method="post">
			<div class="form-floating">
				<input type="text" name="userId" value="${login.userId}" id="userId" readonly class="form-control">
				<label>아이디</label>
			</div>

			<div class="form-floating">
				<input type="text" name="userName" value="${login.userName}" id="userName" readonly class="form-control">
				<label>이름</label>
			</div>

			<div class="row">
				<div class="form-floating col-4">
					<input type="text" name="phone1" maxlength="3" onkeyup="validatePhone()" class="form-control" value="${login.phone1}">
					<label>phone1</label>
				</div>
				<div class="form-floating col-4">
					<input type="text" name="phone2" maxlength="4" onkeyup="validatePhone()" class="form-control" value="${login.phone2}">
					<label>phone2</label>
				</div>
				<div class="form-floating col-4">
					<input type="text" name="phone3" maxlength="4" onkeyup="validatePhone()" class="form-control" value="${login.phone3}">
					<label>phone3</label>
				</div>
				<span id="phoneResult" style="color:red"></span>
			</div>

			<div class="row">
				<div class="form-floating col-6">
					<input type="text" name="post" id="sample4_postcode" placeholder="우편번호" readonly class="form-control" value="${login.post}">
					<label>우편번호</label>
				</div>
				<div class="form-floating col-6">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="w-100 btn btn-lg btn-outline-dark">
				</div>
			</div>
			<div class="row">
				<div class="form-floating col-6">
					<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" readonly class="form-control" value="${login.addr1}">
					<label>도로명주소</label>
				</div>
				<div class="form-floating col-6">
					<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" readonly class="form-control" value="${login.addr2}">
					<label>지번주소</label>
				</div>
				<span id="guide" style="color: #999"></span>
			</div>
			<div class="form-floating">
				<input type="text" name="addr3" placeholder="상세주소" onkeyup="updateDisabled()" class="form-control" value="${login.addr3}">
				<label>상세주소</label>
			</div>

			<div class="row">
				<div class="form-floating col-6">
					<input type="text" name="email1" maxlength="16" onkeyup="validateEmail()" class="form-control" placeholder="email1" value="${login.email1}">
					<label>email1</label>
				</div>
				<div class="form-floating col-6">
					<input type="text" name="email2" maxlength="16" onkeyup="validateEmail()" class="form-control" placeholder="email2" value="${login.email2}">
					<label>email2</label>
				</div>
				<span id="emailResult" style="color:red"></span>
			</div>

			<input type="submit" value="회원정보수정" disabled class="w-100 btn btn-lg btn-outline-dark">
		</form>
	</div>
</div>
