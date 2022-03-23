<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="text-center">
	<div class="form-signin">
		<div class="row">
			<div class="col">
				<input type="button" value="내 정보" class="w-100 btn btn-lg btn-outline-dark" onclick="displayMyPage()">
			</div>
			<div class="col">
				<input type="button" value="주문 내역" class="w-100 btn btn-lg btn-outline-dark" onclick="displayOrderList()">
			</div>
		</div>
		<form action="myPageUpdate" method="post">
			<br><br><br>
			<div class="form-floating">
				<input type="text" name="userId" readonly class="form-control" value="${login.userId}">
				<label>아이디</label>
			</div>

			<div class="form-floating">
				<input type="text" name="userName" readonly class="form-control" value="${login.userName}">
				<label>이름</label>
			</div>

			<div class="row">
				<div class="form-floating col">
					<input type="text" name="phone1" maxlength="3" onkeyup="validatePhone()" class="form-control" placeholder="전화번호" value="${login.phone1}">
					<label>전화번호</label>
				</div>
				-
				<div class="form-floating col">
					<input type="text" name="phone2" maxlength="4" onkeyup="validatePhone()" class="form-control" value="${login.phone2}">
				</div>
				-
				<div class="form-floating col">
					<input type="text" name="phone3" maxlength="4" onkeyup="validatePhone()" class="form-control" value="${login.phone3}">
				</div>
				<span id="phoneResult" style="color:red"></span>
			</div>

			<div class="row">
				<div class="form-floating col">
					<input type="text" name="post" id="sample4_postcode" placeholder="우편번호" readonly class="form-control" value="${login.post}">
					<label>우편번호</label>
				</div>
				<div class="form-floating col">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="w-100 btn btn-lg btn-outline-dark">
				</div>
			</div>
			<div class="row">
				<div class="form-floating col">
					<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" readonly class="form-control" value="${login.addr1}">
					<label>도로명주소</label>
				</div>
				<div class="form-floating col">
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
				<div class="form-floating col">
					<input type="text" name="email1" maxlength="16" onkeyup="validateEmail()" class="form-control" placeholder="이메일" value="${login.email1}">
					<label>이메일</label>
				</div>
				@
				<div class="form-floating col">
					<input type="text" name="email2" maxlength="16" onkeyup="validateEmail()" class="form-control" value="${login.email2}">
				</div>
				<span id="emailResult" style="color:red"></span>
			</div>
			
			<input type="submit" value="내 정보 수정" disabled class="w-100 btn btn-lg btn-outline-dark">
		</form>
	</div>
</div>