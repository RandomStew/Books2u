<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">

	function validate() {
		var userId = document.querySelector("#userId").value;
		var passWd = document.querySelector("#passWd").value;
		if (userId.length == 0 || passWd.length == 0) {
			alert("아이디 및 비밀번호를 입력해주세요.")
			event.preventDefault();
		}
	}

	function main() {
		location.href = "MainServlet";
	}

</script>
<form action="LoginServlet" method="get" onsubmit="validate()">
	아이디:<input type="text" name="userId" id="userId"><br>
	비밀번호:<input type="text" name="passWd" id="passWd"><br>
	<input type="submit" value="로그인"> <button type="button" onclick="main()">Main</button>
</form>
