<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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