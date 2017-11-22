<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>password</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">

$(function(){
	var check =false;
	
	$("#auth").hide();
	$("#passChange").hide();
	 $("#success-alert").hide();
	
	/* 이메일 발송 */
	$("#btn_auth").click(function(){			
	var email = $("#email").val().trim();
	email = $("#email").val().replace(/ /g, '');
	if($("#email").val().trim() !=""){
	
		$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
		    $("#success-alert").slideUp(500);
		});
	
	$.ajax({
 		type:"POST",
 		url:"./commonPassword.common",
 		data:{
 			email:email,
 			type:"email"
 		},
 		success: function(data){		
 			var result = data.trim();
 			console.log("result email : "+result);
 			if(result =="OK"){
 				alert("인증번호가 전송되었습니다. 이메일을 확인해주세요.");
 				$("#auth").show();
 				$("#btn_auth").hide();
 				
 			}else{
 				alert("입력하신 이메일은 존재하지 않습니다. 확인해주세요.");	
 			}
 			
 			}
 		});
	}else{
		alert("정확히 기입해주세요.");
	}
	});
	

	/* 인증 확인 */
	$("#btn_check").click(function(){
		
		
		var auth = $("#auth").val().trim();
		auth = $("#auth").val().replace(/ /g, '');
		if($("#auth").val().trim() !=""){
			
		$.ajax({
	 		type:"POST",
	 		url:"./commonPassword.common",
	 		data:{
	 			auth:auth,
	 			type:"auth"
	 		},
	 		success: function(data){
	 			
	 			var result = data.trim();
	 			console.log("result auth : "+result);
	 			if(result=="OK"){
	 				alert("인증 성공");
					$("#passChange").show();
					$("#btn_check").hide();
					$("#btn_pass").show();
				
	 			}else{
	 				alert("인증 실패");	
	 			}
	 		
	 		  }
	 		});
		
		}else{
			alert("정확히 기입해주세요.");
		}
	});

	/* 비밀번호 재설정 */
	$("#btn_pass").click(function(){
		
		var id = $("#id").val().trim();
		var pass = $("#pass").val().trim();
		id = $("#id").val().replace(/ /g, '');
		pass = $("#pass").val().replace(/ /g, '');
		if($("#pass").val().trim() !="" && $("#id").val().trim() !=""){
			
		$.ajax({
	 		type:"POST",
	 		url:"./commonPassword.common",
	 		data:{
	 			id:id,
	 			pass:pass,
	 			type:"pass"
	 		},
	 		success: function(data){
	 			
	 			var result = data.trim();
	 			console.log("result password : "+result);
	 			if(result=="OK"){
	 				alert("변경 성공");
					location.href("./commonLogin.common");
	 			}else{
	 				alert("변경 실패");	
	 			}
	 		
	 		  }
	 		});
		
		}else{
			alert("정확히 기입해주세요.");
		}
	});
	
});

</script>

</head>
<body>


		<h1>회원정보에 등록된 이메일</h1>
		EMAIL 입력: <input type ="text" id="email" name="email"><button id="btn_auth">발송</button>
		<input type ="text" placeholder="인증번호 입력 " id="auth" name="auth">
		<button id="btn_check">인증</button>
		<div id="passChange">
		<input type ="text" placeholder="id 입력" id="id" name="id">
		<input type ="text" placeholder="비밀번호 재설정  " id="pass" name="pass">
		<button id="btn_pass">확인</button>
		</div>


<div class="alert alert-success" id="success-alert">
    <strong>잠시만 기다려주세요.! </strong>
    이메일 전송중입니다......
</div>

</body>
</html>