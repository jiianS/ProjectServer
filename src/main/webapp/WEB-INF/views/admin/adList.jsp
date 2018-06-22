<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체 목록 관리</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<style>
table {
	margin : 10px 20px;
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

tr:hover {background-color:#f5f5f5;}

</style>
</head>
<body>
	<h2>관리자용 게시판 관리 </h2>
		<p>페이지별 관리 가능</p>
	<div>
		<ul>
			<li><a href="/jian/"> 메인 페이지</a></li>
			<li><a href="boardList">전체 파일 관리하기</a></li>
			<li><a href="bList?check=sbl">슬라이드 관리하기</a></li>
			<li><a href="bList?go=detail&check=dld">매덩's Pick</a></li>
			<li> 서브 페이지</li>
				<ul>
					<li><a href="bList?go=london&check=dld">London</a> </li>
					<li><a href="bList?go=barcelona&check=dld">barcelona</a> </li>
				</ul>
			<li><a href="binsert">글 추가해보쟈</a></li>	
		</ul>
	</div>
	
	
	
	
	
</body>
</html>