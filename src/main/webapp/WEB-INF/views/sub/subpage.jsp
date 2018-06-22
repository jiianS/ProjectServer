<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="resources/css/index.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>


<script>
	$(document).ready(function() {
		var go = "${param.go}"	//boardType으로  지정해주기
		console.log("go :  " + go)	
		
		$.ajax({
			type : "post",
			url : "dld",
			data : {"go" : go}
		}).done(function(data) {
			var d = JSON.parse(data)
			
			console.log("data :  " + d)
			var list = d.list;	// list타입이라 list로 받아와서 뽑아낸다
			console.log(list);
			
			$("#section").empty();
			
			for (var i = 0; i < list.length; i++) {
				
				var html = "<section class='bar' style='background-image:url(";
				html += list[i].fileURL + "')>";
				html += "<article>";					
				html +=	"<h1>" +  list[i].boardTitle + "</h1>";
				html += "<p>" + list[i].boardContents + "</p>";
				html += "</article></section>" ;
				$("#section").append(html);
			}			
		}); //ajax.done
	});//document

</script>
</head>
<body>
	<section id ="section"></section>
	
	<div id="before_button">
		<a href="/jian/"> 
		<img src="resources/icon/before_icon.png" width="70px"></a>
	</div>
	</body>
</html>