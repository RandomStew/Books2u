<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="text-center">
	<div class="form-signin">
		<h3>1:1 문의</h3>
		<p>아래 양식에 맞게 문의사항을 입력하여 보내주십시오.</p>
		<form action="MailServlet" method="post">
			<div class="form-floating">
				<input type="text" name="userId" readonly class="form-control" value="${login.userId}">
				<label>아이디</label>
			</div>
			<div class="row">
				<div class="form-floating col-6">
					<input type="text" name="email1" readonly maxlength="16" onkeyup="validateEmail()" class="form-control" placeholder="email1" value="${login.email1}">
					<label>email1</label>
				</div>
				<div class="form-floating col-6">
					<input type="text" name="email2" readonly maxlength="16" onkeyup="validateEmail()" class="form-control" placeholder="email2" value="${login.email2}">
					<label>email2</label>
				</div>
			</div>
			<div class="form-floating">
				<input type="text" name="subject" class="form-control" placeholder="제목">
				<label>제목</label>
			</div>
			<div class="form-floating">
				<textarea rows="10" cols="50" name="content" class="form-control" placeholder="내용"></textarea>
				<label>내용</label>
			</div>
			<input type="submit" value="문의하기" class="w-100 btn btn-lg btn-outline-dark">
		</form>
	</div>
</div>