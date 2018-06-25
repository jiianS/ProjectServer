<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready({
	$.ajax({
		type : "post",
		url : "dld",
		data : {go : "detail"}	
	
	}).done(function(data) {
		var d = JSON.parse(data)
		var list = d.list;	// list타입이라 list로 받아와서 뽑아낸다
		//console.log(list);
	
		$("#ul_list").empty();
		
		for (var i = 0; i < list.length; i++) {
			var html = "<li class='l_list'>"
			
			/***이미지************************************************/
				html += "<div class='l_img'><div class='container_img'>";
				html += "<img src='"+list[i].fileURL+"' class='pick_img'/>";
				html += "<div class='middle_img'><div class='text_img'>";
				html +=  list[i].boardTitle;
				html += "</div></div></div></div>";
			/***text*********************************************/
				html += "<div class='l_r'>"
				html += "<h1>" + list[i].boardTitle + "</h1>";
				html += "<p>" + list[i].boardContents + "</p>"
				html += "</div>"				
			/***************************************************/
			html += "</li>"
			
			$("#ul_list").append(html);
		}
	}); //ajax.done()
	}); 
	</script>
</head>
<body>

</body>
</html>