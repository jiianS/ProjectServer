<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
	input {	padding: 5px; margin: 5px 0;}
	.btn { width: 185px; height : 50px; }
	div {align-items: center;}
	
	
</style>

<link rel="stylesheet" type="text/css" href="resources/css/form.css">


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
</script>

</head>
<body>
	<h1>admin Page</h1>
	
	<c:if test="${empty sessionScope}">
		<form action="userSelect" method="post">
			<input type="text"    name="userId"       placeholder="아이디를 입력하세요."   maxlength="100" required="required"><br>
			<input type="password" name="userPassword" placeholder="비밀번호를 입력하세요." maxlength="10"  required="required"><br>
			<input type="submit"  class="btn"  value="로그인">
		</form>
		<button type="button" class="btn" onclick="location.href='join'">관리자추가</button>
	</c:if>
	
	<c:if test="${sessionScope.user.status == 1}">
		${sessionScope.user.userId}		
		<a href="logout">로그아웃</a>
	</c:if>

	<c:if test="${sessionScope.user.status == 0}">
		<script>
			alert("로그인한 계정은 가입이 되어 있지않습니다.");			
		</script>
		<form action="userSelect" method="post">
			<input type="text"    name="userId"       placeholder="아이디를 입력하세요."   maxlength="100" required="required"><br>
			<input type="password" name="userPassword" placeholder="비밀번호를 입력하세요." maxlength="10"  required="required"><br>
			<input type="submit"  class="btn"  value="로그인">
			</form>
	
		<button type="button" class="btn" onclick="location.href='join'">관리자추가</button>
	</c:if>



</body>
</html>