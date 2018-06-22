<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<style type="text/css">
input {
	padding: 5px;
	margin: 5px 0;
}

#submit {
	width: 185px;
}
</style> 

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
/* 	$(document).ready(function() {	

		$("form").submit(function(e){
			e.preventDefault();
			
			alert("가입되었습니다.로그인하세요")
		});
	}); */
	
	
</script> 

</head>
<body>
	<h1>User_JOIN</h1>
	<form action="userInsert" method="post">
		<input type="text" name="userId" placeholder="아이디를 입력하세요" maxlength="100" required="required"><br> 
		<input type="password" name="userPassword" placeholder="비밀번호를 입력하세요" maxlength="10" required="required" min="8"><br>  
		<input type="submit" id="submit" value="관리자 추가">
	</form>

</body>
</html>
