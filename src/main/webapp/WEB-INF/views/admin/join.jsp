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
	$(document).ready(function(){
		$("#form").submit(function(e) {
			e.preventDefault();	
			$.ajax({
				type:"post",
				url :"userInsert",
				data : {
					"userId" : $("#form input").eq(0).val(),
					"userPassword" : $("#form input").eq(1).val()
				}
			}).done(function(data) {
				var d = JSON.parse(data);
				console.log("insert Join : " + d);
				alert(d.msg);
				if(d.status == 1) {
                    location.href="admin";
                 }
			});
		});//form submit
	});//document

	function checkId() {
		var checkId = $("#id").val();
		console.log("check ID : " + checkId)	
		$.ajax({
			url : "cId",
			data:{ checkId : checkId },
			success : function(data) {
				var d = JSON.parse(data)
				console.log("datat : :  " + d )
				
				if(d.status == "1"){				
					//아이디 확인 -> 가입 가능한경우
					$("#id").css("background-color", "#dfebff");
					
				}else if(d.status =="0"){		
					//아이디 확인 -> 가입 불가
					$("#id").css("background-color", "#f570a3");
					
				}		
			}
	
		});		
	}
	
	
	//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
    function checkPwd() {
        var checkPwd = $('#pwd').val();
        var rePwd = $('#repwd').val();

       if (checkPwd == rePwd) {
            $("#repwd").css("background-color", "#dfebff");
            $("#submit").prop("disabled", false );
        } else if (checkPwd != repwd) {            
            $("#repwd").css("background-color", "#f570a3");
            $("#submit").prop("disabled", true);
            
        }
    }

</script> 

</head>
<body>
	<h1>User_JOIN</h1>
	
	<form action="" method="post" id="form">
		<input type="text" id="id" name="userId" placeholder="아이디를 입력하세요" maxlength="20" required="required" oninput="checkId()"><br> 
		<input type="password" id="pwd" name="userPassword" placeholder="비밀번호를 입력하세요" maxlength="20" required="required" min="8" oninput="checkPwd()"><br>  
		<input type="password" id="repwd" name="pwdConfirm" placeholder="비밀번호를 다시 입력해주세요" maxlength="20" required="required" min="8" oninput="checkPwd()"><br>
		<input type="submit" id="submit" value="관리자 추가">
	</form>

</body>
</html>
