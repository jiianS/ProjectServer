<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert</title>

<style type="text/css">
	input {	padding: 5px; margin: 5px 0; width: 400px;}
	#boardContents { height: 100px;}
	#submit { width: 185px; }
	textarea { width: 400px; height: 60px;}
	
</style>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function(){
		$("#form").submit(function(e) {
			e.preventDefault();			
			console.log("--------------");
			$.ajax({
				type: "post",
				url : "http://fileserver/FileUpload/jian",
				data: new FormData($(this)[0]),
				contentType: false,
				cache: false,
				processData: false
			}).done(function(data) {
				var d = JSON.parse(data)
				console.log(d);
				
				$.ajax({
					type:"post",
					url :"bid",
					data : {
						"boardTitle" : $("#form input").eq(0).val(),
						"boardContents" : $("#form textarea").eq(0).val(),
						"boardType" : $("#form boardType").eq(1).val(),
						"data" : JSON.stringify(d.upload)
					}
				}).done(function(data) {
					var d = JSON.parse(data);
					console.log("insert d : " + d);
                    alert(d.msg);
                    if(d.status == 1) {
                        location.href="admin/allList";
                     }
				});
			});// ajax done
		});//form submit
	});//document

</script>
</head>
<body>
<h1>
    글작성
</h1>
<form action=""  id="form" method="post"  enctype="multipart/form-data">
 	<h3>제목</h3>
     <input type="text" name="boardTitle" placeholder="제목 입력"><br>
	<h3>내용</h3>
    <textarea type="text" name="boardContents" placeholder="내용 입력" ></textarea><br>
   
   <h3>board Type</h3>
   <input list="browsers" name="browser" value=${param.i}>
       <datalist id="browsers">
	       <option value="detail" selected="selected">
	       <option value="london">
	       <option value="barcelona">
     </datalist>
   <h3>첨부파일</h3>
    <input type="file" name="file" placeholder="사진"><br><br>
   <input type="submit" value="제출">
</form>
</body>
</html>