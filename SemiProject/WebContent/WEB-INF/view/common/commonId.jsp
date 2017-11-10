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

	$("#div_p").hide();
	$("#div_e").hide();
	$("#div_pauth").hide();
	$("#div_eauth").hide();
	
	
	
	$(".ch").click(function(){

			 $('input:radio[name=select]:checked').change(function () {
				 
		            if ($(this).val() == 'phone') {
		            	$("#div_p").show();
		            	$("#div_e").hide();
		            	$("#div_pauth").show();
		            	$("#div_eauth").hide();
		            }else if($(this).val() == 'email') {
		            	$("#div_p").hide();
		            	$("#div_e").show();
		            	$("#div_pauth").hide();
		            	$("#div_eauth").show();    
		            }
		        });
	});
	
	/* 이메일 발송 */
	$("#btn_email").click(function(){			
	var email = $("#email").val().trim();
	email = $("#email").val().replace(/ /g, '');
	if($("#email").val().trim() !=""){
	
		$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
		    $("#success-alert").slideUp(500);
		});
	
	$.ajax({
 		type:"POST",
 		url:"./commonCommonId.common",
 		data:{
 			email:email,
 			type:"email"
 		},
 		success: function(data){		
 			var result = data.trim();
 			console.log("result email : "+result);
 			if(result =="OK"){
 				alert("인증번호가 전송되었습니다. 이메일을 확인해주세요.");
 				$("#div_eauth").show();
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
	
	/* email 인증 확인 */
	$("#btn_check2").click(function(){
		
		
		var auth = $("#email_auth").val().trim();
		auth = $("#email_auth").val().replace(/ /g, '');
		if($("#email_auth").val().trim() !=""){
			
		$.ajax({
	 		type:"POST",
	 		url:"./commonCommonId.common",
	 		data:{
	 			email_auth:email_auth,
	 			type:"auth"
	 		},
	 		success: function(data){
	 			
	 			var result = data.trim();
	 			console.log("result email_auth : "+result);
	 			if(result=="OK"){
	 				alert("인증 성공");
					$("#passChange").show();
					$("#btn_email").hide();
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
	
	/* 핸드폰 발송 */
	$("#btn_phone").click(function(){			
	var phone = $("#phone").val().trim();
	phone = $("#phone").val().replace(/ /g, '');
	if($("#phone").val().trim() !=""){
	
	
	
	$.ajax({
 		type:"POST",
 		url:"./commonCommonId.common",
 		data:{
 			phone:phone,
 			type:"phone"
 		},
 		success: function(data){		
 			var result = data.trim();
 			console.log("result phone : "+result);
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
	
	
	/* phone 인증 확인 */
	$("#btn_check1").click(function(){
		
		
		var phone_auth = $("#phone_auth").val().trim();
		phone_auth = $("#phone_auth").val().replace(/ /g, '');
		if($("#phone_auth").val().trim() !=""){
			
		$.ajax({
	 		type:"POST",
	 		url:"./commonCommonId.common",
	 		data:{
	 			phone_auth:phone_auth,
	 			type:"auth"
	 		},
	 		success: function(data){
	 			
	 			var result = data.trim();
	 			console.log("result phone_auth : "+result);
	 			if(result=="OK"){
	 				alert("인증 성공");
					$("#div_pauth").show();
					$("#btn_auth").hide();
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
	

	
	
});

</script>

</head>
<body>

		<input type="radio" name="select" class="ch" value="phone"><h1>회원정보에 등록된  핸드폰으로 ID 조회</h1>
		<div id="div_p">
		phone 입력: <input type ="tel" id="phone" name="phone" placeholder="핸드폰번호 입력"><button id="btn_phone">발송</button>
		
			<div id ="div_pauth">
		<input type ="text" placeholder="인증번호 입력 " id="phone_auth" name="phone_auth">
		<button id="btn_check1">인증</button>
			</div>
		</div>
		
		<input type="radio" name="select" class="ch" value="email"><h1>회원정보에 등록된 Email로 ID 조회</h1>
		<div id="div_e">
		EMAIL 입력: <input type ="text" id="email" name="email" placeholder="email 입력"><button id="btn_email">발송</button>
			
			<div id ="div_eauth">
		<input type ="text" placeholder="인증번호 입력 " id="email_auth" name="email_auth">
		<button id="btn_check2">인증</button>
			</div>
		</div>
				
</body>
</html>