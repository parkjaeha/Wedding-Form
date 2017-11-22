<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>id</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">

body {
   font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
   color: #333333;
   
}

.signUp {
   position: relative;
   margin: 50px auto;
   width: 280px;
   padding: 33px 25px 29px;
   background: #FFFFFF;
   border-bottom: 1px solid #C4C4C4;
   border-radius: 5px;
   -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
   box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
}

.signUp:before,
.signUp:after {
   content: '';
   position: absolute;
   bottom: 1px;
   left: 0;
   right: 0;
   height: 10px;
   background: inherit;
   border-bottom: 1px solid #D2D2D2;
   border-radius: 4px;
}

.signUp:after {
   bottom: 3px;
   border-color: #DCDCDC;
}

.signUpTitle {
   margin: -25px -25px 25px;
   padding: 15px 25px;
   line-height: 35px;
   font-size: 26px;
   font-weight: 300;
   color: #777;
   text-align: center;
   text-shadow: 0 1px rgba(255, 255, 255, 0.75);
   background: #F7F7F7;
}

.signUpTitle:before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   height: 8px;
   background: #C4E17F;
   border-radius: 5px 5px 0 0;
   background-image: -webkit-linear-gradient(left, #C4E17F, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #db9CBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
   background-image: -moz-linear-gradient(left, #c4e17f, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9CBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
   background-image: -o-linear-gradient(left, #C4E17F, #C4E17F 12.5%, #F7FDCC 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9DBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
   background-image: linear-gradient(to right, #C4E17F, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9CBE 62.5%, #c49cde 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62c2e4 87.5%, #62C2E4);
}

input {
   font-family: inherit;
   color: inherit;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.signUpInput {
   width: 100%;
   height: 50px;
   margin-bottom: 25px;
   padding: 0 15px 2px;
   font-size: 17px;
   background: white;
   border: 2px solid #EBEBEB;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #EBEBEB;
   box-shadow: inset 0 -2px #EBEBEB;
}

.signUpInput:focus {
   border-color: #62C2E4;
   outline: none;
   -webkit-box-shadow: inset 0 -2px #62C2E4;
   box-shadow: inset 0 -2px #62C2E4;
}

.lt-ie9 .signUpInput {
   line-height: 48px;
}

.signUpButton {
   position: relative;
   vertical-align: top;
   width: 100%;
   height: 54px;
   padding: 0;
   font-size: 22px;
   color: white;
   text-align: center;
   text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
   background: #F0776C;
   border: 0;
   border-bottom: 2px solid #D76B60;
   border-radius: 5px;
   cursor: pointer;
   -webkit-box-shadow: inset 0 -2px #D76B60;
   box-shadow: inset 0 -2px #D76B60;
}

.signUpButton:active {
   top: 1px;
   outline: none;
   -webkit-box-shadow: none;
   box-shadow: none;
}

:-moz-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

::-moz-placeholder {
   color: #AAAAAA;
   opacity: 1;
   font-weight: 300;
}

::-webkit-input-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

:-ms-input-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

::-moz-focus-inner {
   border: 0;
   padding: 0;
}

#panel, #flip {
    padding: 5px;
    text-align: center;
    background-color: #e5eecc;
    border: solid 1px #c3c3c3;
}
#panel2, #flip2 {
    padding: 5px;
    text-align: center;
    background-color: #e5eecc;
    border: solid 1px #c3c3c3;
}

#panel {
    padding: 50px;
    display: none;
}

#panel2 {
    padding: 50px;
    display: none;
}


</style>

<script type="text/javascript">

$(document).ready(function(){
    $("#flip").click(function(){
        $("#panel").slideToggle("slow");
    });
    
    $("#flip2").click(function(){
        $("#panel2").slideToggle("slow");
    });
});

$(function(){

	$("#div_p").hide();
	$("#div_e").hide();
	$(".auth_form").hide();
	$("#btn_phone").hide();
	$(".auth_result").hide();
	$(".auth_result2").hide();
	$("#input_phone").css("color","green"); 
	$("#input_pauth").css("color","black");
	$("#check_id").css("color","black");
	
	$(".move").hide();
	
	var phone;
	var email;
	var ch = false;
	
	 $("#phone").on({
			change : function() {
				ch = false;
			},
			blur : function() {
				var phone = $(this).val().trim();
				phone = $(this).val().replace(/ /g, '');

				//alert(id);
				$(this).val(phone);
				
			 	$.ajax({
			 		type:"POST",
			 		url:"./commonPhoneCheck.common",
			 		data:{
			 			phone:phone
			 		},
			 		success: function(data){
			 			var result = data.trim();
			 			//alert("id check = "+result);
			 			if(result == "OK" && email !=""){
			 				ch = true;
			 				$("#result").text("존재하는 phone");
							$("#result").css("color","green");
							$("#btn_phone").show();
							
						} else {
							ch = false;
							$("#result").text("존재하지 않는 phone");
							$("#result").css("color","red");
							$("#btn_phone").hide();
						}
			 		}
			 	});
			}
		});
	
	$(".ch").click(function(){

			 $('input:radio[name=select]:checked').change(function () {
				 
		            if ($(this).val() == 'phone') {
		            	$("#div_p").show();
		            	$("#div_e").hide();
		            	$("#div_pauth").hide();
		            	$("#div_eauth").hide();
		            }else if($(this).val() == 'email') {
		            	$("#div_p").hide();
		            	$("#div_e").show();
		            	$("#div_pauth").hide();
		            	$("#div_eauth").hide();    
		            }
		        });
	});
	
	
	/* 핸드폰 발송 */
	$("#btn_phone").click(function(){			
	phone = $("#phone").val().trim();
	phone = $("#phone").val().replace(/ /g, '');
	if($("#phone").val().trim() !=""){
	
	
	
	$.ajax({
 		type:"POST",
 		url:"./commonId.common",
 		data:{
 			phone:phone,
 			type:"sms"
 		},
 		success: function(data){		
 			var result = data.trim();
 			console.log("result phone : "+result);
 			if(result =="OK"){
 				alert("인증번호가 전송되었습니다.");
 				$(".auth_form").show();
 				$("#btn_phone").hide();
 				$("#input_phone").css("color","black"); 
				$("#input_pauth").css("color","green");
				$("#check_id").css("color","black");
 				
 			}else{
 				alert("입력하신 번호가 정확하지 않습니다. -를 빼주세요.");	
 			}
 			
 			}
 		});
	}else{
		alert("정확히 기입해주세요.");
	}
	});
	
	
	/* phone 인증 확인 */
	$("#btn_check").click(function(){
		
		var phone_auth = $("#auth").val().trim();
		phone_auth = $("#auth").val().replace(/ /g, '');
		if($("#auth").val().trim() !=""){
			
		$.ajax({
	 		type:"POST",
	 		url:"./commonId.common",
	 		data:{
	 			phone_auth:phone_auth,
	 			type:"pauth"
	 		},
	 		success: function(data){
	 			
	 			var result = data.trim();
	 			console.log("result phone_auth : "+result);
	 			if(result=="OK"){
	 				alert("인증 성공");
					$(".phone_form").hide();
					$("#btn_check").hide();
					$("#input_phone").css("color","black"); 
					$("#input_pauth").css("color","black");
					$("#check_id").css("color","green");
					
					phone = $("#phone").val().trim();
					phone = $("#phone").val().replace(/ /g, '');
					
					$.ajax({
				 		type:"POST",
				 		url:"./commonId.common",
				 		data:{
				 			phone:phone,
				 			type:"auth_phone"
				 		},
				 		success: function(data){
				 			
				 			$(".auth_result").show();
				 			$(".move").show();
				 			$(".auth_result").css("font-size","14px");
				 			$(".auth_result").val("당신의 ID는 "+data+" 입니다.");
				 			//$(".auth_result").innerHTML="당신의 ID는 "+data+" 입니다.";			
				 			
				 		}
					});
				
					
				 	
	 			}else{
	 				alert("인증 실패");	
	 			}
	 		
	 		  }
	 		});
		
		}else{
			alert("정확히 기입해주세요.");
		}
	});

	///////////////////////////////////////////////////////////////////////
	//search using email for id
	
	var check = false;
	$(".auth_form").hide();
	$(".passChange").hide();
	$("#success-alert").hide();
	$("#btn_auth").hide();
	$("#input_email").css("color","green"); 
	$("#input_eauth").css("color","black");
	$("#change_pass").css("color","black");
	 	
	/* 이메일 발송 */
	$("#btn_auth").click(function(){			
	email = $("#email").val().trim();
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
 				$(".email_form").hide();
 				$(".auth_form").show();
 				$("#input_email").css("color","black"); 
 				$("#input_eauth").css("color","green");
 				$("#change_pass").css("color","black");
 				
 			}else{
 				alert("이메일이 발송되지 않았습니다. 다시 시도해주세요.");	
 			}
 			
 			}
 		});
	}else{
		alert("정확히 기입해주세요.");
	}
	});
	

	/* 인증 확인 */
	$("#btn_check2").click(function(){
		
		
		var auth = $("#auth2").val().trim();
		auth = $("#auth2").val().replace(/ /g, '');
		if($("#auth2").val().trim() !=""){
			
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
					$(".auth_form").hide();
					$(".auth_result2").show();
					$("#input_email").css("color","black"); 
	 				$("#input_eauth").css("color","black");
	 				$("#change_pass").css("color","green");
					
					$.ajax({
				 		type:"POST",
				 		url:"./commonId.common",
				 		data:{
				 			email:email,
				 			type:"auth_email"
				 		},
				 		success: function(data){
				 			
				 			$(".auth_result2").show();
				 			$(".move").show();
				 			$(".auth_result2").css("font-size","14px");
				 			$(".auth_result2").val("당신의 ID는 "+data+" 입니다.");
				 			//$(".auth_result").innerHTML="당신의 ID는 "+data+" 입니다.";			
				 			
				 		}
					});
					
				
	 			}else{
	 				alert("인증 실패");	
	 			}
	 		
	 		  }
	 		});
		
		}else{
			alert("정확히 기입해주세요.");
		}
	});

	 $("#email").on({
			change : function() {
				check = false;
			},
			blur : function() {
				var email = $(this).val().trim();
				email = $(this).val().replace(/ /g, '');

				//alert(id);
				$(this).val(email);
				
			 	$.ajax({
			 		type:"POST",
			 		url:"./commonEmailCheck.common",
			 		data:{
			 			email:email
			 		},
			 		success: function(data){
			 			var result = data.trim();
			 			//alert("id check = "+result);
			 			if(result == "OK" && email !=""){
			 				check = true;
			 				$("#result2").text("존재하는 Email");
							$("#result2").css("color","green");
							$("#btn_auth").show();
							
						} else {
							check = false;
							$("#result2").text("존재하지 않는 Email");
							$("#result2").css("color","red");
							$("#btn_auth").hide();
						}
			 		}
			 	});
			}
		});
	
	 ////////////////////////////////////////////////////
	 $(".move").click(function(){
		 location.href = "./commonLogin.common";
	 });
	


});

</script>

</head>
<body>

<div id="flip"><h1>회원정보에 등록된  핸드폰으로 ID 조회</h1></div>
<div id="panel">

<div class="signUp" id="signupForm">
    <h1 style="font-size: 12px; display: inline-block;"  class="signUpTitle"><div style="display: inline-block;" id="input_phone">휴대폰 번호 입력</div> > <div style="display: inline-block;" id="input_pauth">본인 확인</div> > <div style="display: inline-block;" id="check_id">ID 확인</div></h1>
   <div class="phone_form">
   <input type="text" class="signUpInput" placeholder="휴대폰 번호 입력" id="phone" name="phone" autofocus required>
   <span id="result">정보를 입력하세요.</span>
   <input type="submit" value="발송!" id="btn_phone" class="signUpButton">
   </div>
   <div class="auth_form">
   <input type="password" class="signUpInput" placeholder="인증번호 입력" id="auth" name="auth" required>
   <input type="submit" value="인증!" id="btn_check" class="signUpButton">
	</div>
	<input type="text" class="auth_result signUpInput">
	<input type="submit" value="메인으로 이동"  class="move signUpButton">
	
</div>

</div>

<div id="flip2"><h1>회원정보에 등록된  이메일로 ID 조회</h1></div>
<div id="panel2">

<div class="signUp" id="signupForm">
   <h1 style="font-size: 12px; display: inline-block;"  class="signUpTitle"><div style="display: inline-block;" id="input_email">이메일 입력</div> > <div style="display: inline-block;" id="input_eauth">본인 확인</div> > <div style="display: inline-block;" id="change_pass">ID 확인</div></h1>
   
   <div class="email_form">
   <input type="text" class="signUpInput" placeholder="이메일 입력" id="email" name="email" autofocus required>
   <span id="result2">정보를 입력하세요.</span>
   <input type="submit" value="발송!" id="btn_auth" class="signUpButton">
   </div>
   <div class="auth_form">
   <input type="password" class="signUpInput" placeholder="인증번호 입력" id="auth2" name="auth2" required>
   <input type="submit" value="인증!" id="btn_check2" class="signUpButton">
	</div>
		<input type="text" class="auth_result2 signUpInput">
		<input type="submit" value="메인으로 이동"  class="move signUpButton">
</div>

</div>

<div class="alert alert-success" id="success-alert">
    <strong>잠시만 기다려주세요.! </strong>
    이메일 전송중입니다......
</div>

		
				 -->
</body>
</html>