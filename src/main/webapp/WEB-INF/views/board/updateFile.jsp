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
</style>


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
		$(document).ready(function(){
			var fileData = [];
			var fileNo = "${param.fileNo}"
			var delData = [];

				$.ajax({
					  type : "post",
					  url : "sld",
					  data : {"fileNo" : fileNo}
				  }).done(function(data){
					  var d = JSON.parse(data)
					console.log("ddddd : " +d );
					  
					  var filesData = d.filesData;
					  fileData = filesData;				
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
						console.log("dddd : " +d)
					  update(d);
				});
			});
			
			function update(d){
				$.ajax({
					  type : "post",
					  url : "fud",
					  data : {
						  "fileNo" : fileNo,
						  "fileName" : $("form input").eq(0).val(),
						  "data" : JSON.stringify(d.upload),
						
					  }
				  }).done(function(data){
					  console.log(data);
					  var d = JSON.parse(data);
					  alert(d.msg);
					  if(d.status == 1){
						location.href = "bSelect?ch=s&fileNo=" + d.fileNo;
					  }
				  });
			}
			
			function boardHTML(data){
				var title = data.fileTitle;				
				$("form input").eq(0).val(title);
			}
			
			function filesHTML(data){
				$("#files").empty();
				
				var fileURL = data.fileURL;
				var html = "<img src='"+fileURL+"' width='200' height='150'><br>";
				$("#files").append(html);
				
			}
		});		
	</script>
</head>


<body>
	<h1>update_ page</h1>
	
	<div id="files"></div>
	
	<form action="" method="post" enctype="multipart/form-data">
		<input type="text" id="fileTitle" name="fileTitle" placeholder="파일명을 입력하세요."><br>		
		<input type="file" name="file"><br> 
		<input type="submit" value="글수정">
	</form>
	
</body>
</html>
