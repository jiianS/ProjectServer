<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>글내용</title>
<meta charset="UTF-8">
<style>
	#container {
		width: 500px;

		padding: 10px 20px;
	}
	
	#tab {
		text-align: right;
	}
	
	#files {
		width: 200px;
		height: 200px;
		background-color: #808080;
	}
	
	#files img {
		width: 200px;
		height: 200px;
	}
</style>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<script>
	$(document).ready(function() {
		var boardNo =  "${param.boardNo}";
		var fileNo = "${param.fileNo}";
		var ch = "${param.ch}";	// 슬라이드 | 목록 나눠주기 위한 체크
	
		if (ch == "b") {
			$.ajax({
				type : "post",
				url : "bld",
				data : {
					"boardNo" : boardNo,
					"go" : ch
				}
			}).done(function(data) {
				var d = JSON.parse(data)

				var boardData = d.boardData;
				var filesData = d.filesData;

				boardHTML(boardData);
				filesHTML(filesData);
			});//_ boardData_ 리스트 갖고 오기 위한 ajax
		
		} else if (ch == "s") {
			$.ajax({
				type : "post",
				url : "sld",
				data : {
					"fileNo" : fileNo
				}
			}).done(function(data) {
				var d = JSON.parse(data)
				var fileData = d.fileData;

				file_HTML(fileData);
			});
		}

	});//document(ready)

	function boardHTML(data) {
		console.log("boardHTML", data);
		var title = data.boardTitle;
		var contents = data.boardContents;
		$("#title").text(title);
		$("#contents").text(contents);
	}

	//여러 DB를 이용하는 !!( Picks! )
	function filesHTML(data) {
		console.log("filesHTML", data);
		$("#files").empty();

		for (var i = 0; i < data.length; i++) {
			var fileURL = data[i].fileURL;
			var html = "<img src='"+fileURL+"'><br>";
			console.log(fileURL, html);
			$("#files").append(html);
		}
	}

	//S&B+ 단일 DB여서 따로 나눴음
	function file_HTML(data) {
		$("#files").empty();
		var fileName = data.fileName;
		var fileURL = data.fileURL;
		
		$("#title").text(fileName);
		var html = "<img src='"+fileURL+"'><br>";
		console.log(fileURL, html);
		$("#files").append(html);
	}
	
</script>
</head>


<body>
	<div id="container">
		<h1 id="title"></h1>
  		<c:choose>				
				<c:when test="${param.ch == 'b'}">	
					<div style="text-align: right">			
						<a href="bUpdate?ch=${param.ch}&boardNo=${param.boardNo}">수정</a>
						<a href="bDel?ch=${param.ch}&boardNo=${param.boardNo}">삭제</a>				 
						<a href="admin">관리자페이지로</a>
					</div>	
				</c:when>
				
				<c:when test="${param.ch == 's'}">
					<div style="text-align: right">				
						<a href="fUpdate?fileNo=${param.fileNo}">수정</a>
						<a href ="main"> 메인 </a>
						<a href="admin">관리자페이지</a>
					</div>
				</c:when>
			</c:choose> 
					</div>	
		<hr>
		<p id="contents"></p>
		<div id="files"></div>
	</div>

</body>
</html>

