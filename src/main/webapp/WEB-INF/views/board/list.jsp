<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detail_ List</title>

<style>
#list li a{font-size: 20px; }
#list li img{ width:150px; height: 100px;}

</style>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script>
		$(document).ready(function(){
			var go = "${param.go}";
			var check= "${param.check}";
			var ch1 = "b";
			var ch2 = "s";
			
			console.log("parma check :  :" + check)
			 
			if(check == "dld"){			
				$.ajax({
					  type : "post",
					  url : "dld",
					  data : {"go" : go}
				  }).done(function(data){
					  var d = JSON.parse(data)
					  console.log(d);
					  console.log(check);
					  var list = d.list;
					  $("#list").empty();
					  for(var i = 0; i < list.length; i++){
						  var html = "<li>";
						  /****************************************************/
						  		html += "<a href='bSelect?ch="+ ch1 +"&boardNo=";						  
						  		html += list[i].boardNo;
						  		html += "'>";
						  		html += list[i].boardTitle;
						  		html += "</a><br>";
						  		html += "<img src='"+list[i].fileURL+"'>";
						  /****************************************************/
						  		html += "</li>";
						  $("#list").append(html);
					  }
				  }); //ajax
				  
			}else if(check == "sbl"){
				$.ajax({
					  type : "post",
					  url : "sbl"
				  }).done(function(data){
					  var d = JSON.parse(data)
					  console.log(d);
					  var list = d.list;
					  $("#list").empty();
					  for(var i = 0; i < list.length; i++){
						  var html = "<li>";
						  /****************************************************/
						  		html += "<a href='bSelect?ch="+ ch2 +"&fileNo=";
						  		html += list[i].fileNo;
						  		html += "'>";
						  		html += list[i].fileName;
						  		html += "</a><br>";
						  		html += "<img src='"+list[i].fileURL+"'>";
						  /****************************************************/
						  		html += "</li>";
						  $("#list").append(html);
					  }
				  }); //ajax				    
			}
		});//document.ready
	</script>



</head>

<body>
	<h1>detail List</h1>
	<div> 
		<a href ="/jian">메인</a><br>
		<a href ="adList">관리자 목록</a>
	</div>
	<hr>
	<ul id="list"></ul>
	
</body>
</html>