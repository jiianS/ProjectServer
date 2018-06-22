<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>글수정</title>
<meta charset="UTF-8">
<style type="text/css">
	input {	padding: 5px; margin: 5px 0; width: 600px;}
	#boardContents { height: 100px;}
	#submit { width: 185px; }
	#files img{  width:450px;height:350px;}
</style>


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
		$(document).ready(function(){
			var fileData = [];
			var fileNo = 0;
			var delData = [];
			var boardID = "${param.boardID}";
/* 			if(boardNo == ""){
				alert("누구세요?");
				location.href = "/app";
			}else {} */
				$.ajax({
					  type : "post",
					  url : "bld",
					  data : {"boardID" : boardID}
				  }).done(function(data){
					  var d = JSON.parse(data)
					  var boardData = d.boardData;
					  var filesData = d.filesData;
					  fileData = filesData;
					  boardHTML(boardData);
					  filesHTML(filesData);
				  });
			
			
			$("form").submit(function(e){
				e.preventDefault();
				$.ajax({
					type: "post",
					url : "http://fileserver/FileUpload/jian",
					data: new FormData($(this)[0]),
					contentType: false,
					cache: false,
					processData: false
				}).done(function(data) {
					  var d = JSON.parse(data)
					  var type = 0;
					  if(d.upload.length == 0){
						  d.upload = fileData;
						  type = 0;
					  }else {
						  d.upload[0].fileNo = fileData[0].fileNo;
						  type = 1;
					  }
					  update(d, type);
				});
			});
			
			function update(d, type){
				$.ajax({
					  type : "post",
					  url : "bud",
					  data : {
						  "boardID" : boardID,
						  "boardTitle" : $("form input").eq(0).val(),
						  "boardContents" : $("form input").eq(1).val(),
						  "data" : JSON.stringify(d.upload),
						  "type" : type
					  }
				  }).done(function(data){
					  console.log(data);
					  var d = JSON.parse(data);
					  alert(d.msg);
					  if(d.status == 1){
						location.href = "bSelect?ch=b&boardID=" + d.boardID;
					  }
				  });
			}
			
			function boardHTML(data){
				var title = data.boardTitle;
				var contents = data.boardContents;
				
				$("form input").eq(0).val(title);
				$("form input").eq(1).val(contents);
			}
			
			function filesHTML(data){
				$("#files").empty();
				for(var i = 0; i < data.length; i++){
					var fileURL = data[i].fileURL;
					var html = "<img src='"+fileURL+"'><br>";
					$("#files").append(html);
				}
			}
		});		
	</script>
</head>


<body>
	<h1>update_ page</h1>
	
	<div id="files"></div>
	
	<form action="" method="post" enctype="multipart/form-data">
		<input type="text" id="boardTitle" name="boardTitle" placeholder="제목를 입력하세요."><br>
		<input type="text" id="boardContents" name="boardContents" placeholder="내용을 입력하세요."><br>
		<input type="file" id="files" name="file"><br> 
		<input type="submit" value="글수정">
	</form>
	
</body>
</html>
