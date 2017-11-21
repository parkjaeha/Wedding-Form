<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

* {
  box-sizing: border-box;
}

body {
  background: #f1f1f1;
  color: #333333;
  font-family: 'Cairo', sans-serif;
  font-size: 16px;
  height: 100vh;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.dialog__trigger, .dialog__action {
  border: 3px solid #333333;
  background: #f1f1f1;
  padding: 15px 20px;
  font-size: 1.1rem;
  text-transform: uppercase;
  display: block;
  -webkit-transition: all 150ms ease-out;
  transition: all 150ms ease-out;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
}
.dialog__trigger:hover, .dialog__action:hover {
  -webkit-transform: translateY(-5px);
          transform: translateY(-5px);
  -webkit-transition: all 100ms ease-in;
  transition: all 100ms ease-in;
  box-shadow: 0 5px 10px rgba(51, 51, 51, 0.4);
}
.dialog__trigger:focus, .dialog__action:focus {
  outline: 0;
}
.dialog__trigger:active, .dialog__action:active {
  -webkit-transform: translateY(-3px);
          transform: translateY(-3px);
}

.dialog {
  background: #f1f1f1;
  width: 70%;
  position: absolute;
  left: calc(50% - 35%);
  top: 0;
  padding: 30px;
  box-shadow: 0 10px 30px rgba(51, 51, 51, 0.4);
  border: 3px solid #333333;
  visibility: hidden;
  opacity: 0;
  -webkit-transition: all 180ms ease-in;
  transition: all 180ms ease-in;
  z-index:999;
}
@media (max-width: 600px) {
  .dialog {
    width: 90%;
    left: calc(50% - 45%);
  }
}
.dialog.dialog--active {
  top: 10%;
  visibility: visible;
  opacity: 1;
  -webkit-transition: all 250ms ease-out;
  transition: all 250ms ease-out;
}
.dialog .dialog__close {
  font-size: 2rem;
  line-height: 2rem;
  position: absolute;
  right: 15px;
  top: 15px;
  cursor: pointer;
  padding: 15px;
  -webkit-transition: color 150ms ease;
  transition: color 150ms ease;
}
.dialog .dialog__close:hover {
  color: #E74C3C;
}
.dialog .dialog__title {
  font-size: 2rem;
  font-family: 'Slabo 27px', serif;
  font-weight: 100;
  margin: 0;
  padding: 0 0 15px 0;
  border-bottom: 2px solid #333333;
}
.dialog .dialog__content {
  font-size: 1.1rem;
  line-height: 2rem;
}
.dialog .dialog__action {
  margin: 0;
  font-size: 1rem;
}


</style>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<!-- 주소 -->
<!-- jQuery와 Postcodify를 로딩한다 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
<script>$(function() {
		$("#postcodify_search_button").postcodifyPopUp();

	});
</script>
<!-- ------------------------------------------------------------------------------------------ -->


<script type="text/javascript">

	var ch = false;
	var auth = false;
	var toggle = "";
	var kind = "Customer";
	var gender = "";
	var auth_result ="";
	
	var count=60;     
	var counter=setInterval(timer, 1000); //1000 will  run it every 1 second
	var min = 2;
	var num = 0;
	
	$(function(){
				
				dialog();
		
				$("#info").hide();
				$("#extra").hide();
				$(".pref").hide();
				$("#join_btn").hide();
				
				$(".next").click(function(){
					num = num+1;
					if(num == 1){
						$("#common").hide();
						$("#info").show();
						$(".pref").show();
					}else if(num == 2){
						$("#info").hide();
						$("#extra").show();
						$(".next").hide();
						$("#join_btn").show();
						
					}
					
				});
				
				$(".pref").click(function(){
					num = num-1;
					if(num ==1){
						$("#info").show();
						$("#extra").hide();
						$(".next").show();
						$("#join_btn").hide();
					}else if(num ==0){
						$("#info").hide();
						$("#common").show();
						$(".pref").hide();
						$(".next").show();
					}
					
				});
				
				
/*---------------------------------- toggle change start ------------------------------------------------ */

		$(".ch").on({
			toggle : function() {
	
			},
			change : function() {

				if ($(this).is(':checked')) {
					kind = $(this).attr("value", "Customer").val();
					$(".require").text("*");
					$(".require").css("color","black");
				} else {
					kind = $(this).attr("value", "Business").val();
					$(".require").text("*");
					$(".require").css("color","red");
				}
				
				//console.log("change: "+ $(this).val());
				/* alert($(this).val() +" "+kind); */
				kind = $(this).val();
	 
				/* alert( $(this).attr("value","Student").val());
				alert($(this).is(':checked')); */

				$.get("common" + kind + ".common",function(data){
					$("#add").html(data);
				});

			}
		});

/*---------------------------------- toggle change end ------------------------------------------------ */

/*---------------------------------- id 중복확인 start ----------------------------------------------------------*/
		 $("#id").on({
			change : function() {
				ch = false;
			},
			blur : function() {
				var id = $(this).val().trim();
				id = $(this).val().replace(/ /g, '');

				//alert(id);
				$(this).val(id);
				
			 	$.ajax({
			 		type:"POST",
			 		url:"./commonIdCheck.common",
			 		data:{
			 			id:id
			 		},
			 		success: function(data){
			 			var result = data.trim();
			 			//alert("id check = "+result);
			 			if(result == "OK" && id !=""){
			 				ch = true;

								
							$("#result").text("사용가능한ID");
							$("#result").css("color","green");
						} else {
							ch = false;
							$("#result").text("사용불가능한ID");
							$("#result").css("color","red");

						}

			 			
			 		}
			 		
			 	});

			}
		});
 
		 /*---------------------------------- id 중복확인 end ----------------------------------------------------------*/
		 
  /*----------------------------------  회원가입 btn start ----------------------------------------------------------*/
 
		$("#btn").click(function() {

			if (!ch) {
				alert("id  중복확인을 하세요");
			} else if (ch && $("#pw1").val().trim() !="" && $("#pw2").val().trim() !="" && $("#name").val().trim() !=""  && $("#phone").val().trim() !="" 
					&& $("#addr_main").val().trim() !="" && $("#addr_sub").val().trim() !="" && $("#select_result").val().trim() !="" ) {
				
				//&& !$("email:contains('@')").css("text-decoration", "underline")
				
				//alert(document.getElementById('pw1').value.length+" / " +$("#pw1").val());
				if( ( $("#pw1").val().trim() == $("#pw2").val().trim() ) && document.getElementById('pw1').value.length >=7 ){
				
				//alert($("#pw1").val() + " / "+$("#pw2").val().trim());
				if (kind == "Customer") {
					//alert($(".gender_ch").val());
					
					//alert($("#birth").val().trim()+" / " + $("#wedding_day").val() +"  /  "+$(".gender_ch").val() + "  /  " +auth)
					if($("#birth").val().trim() !=""  && $("#wedding_day").val() !="" && $(".gender_ch").val() !="" && auth == true){
					document.frm.submit();
					}else{
						alert("고객정보를 확인해주세요.");
					}
					
				} else if (kind == "Business") {
					
				  if($('input[name=type]').val() !="" && $('input[name=meal_cost]').val() !="" && $('input[name=meal_menu]').val() !="" && $('input[name=visitor]').val() !="" 
						  && $('input[name=sido1]').val() !="" && $('input[name=gugun1]').val() !="" && $('input[name=subway01]').val() !="" && $('input[name=subway02]').val() !="" ){
				
					  if($("#company_name").val().trim() !=""  && $("#company_tel").val().trim() !=""  && $("#company_number").val().trim() !="" && auth == true){
						
					document.frm.setAttribute("action", "commonJoinUp.common");
					document.frm.submit();
					
					}else{
						alert("사업자정보를 확인해주세요.");
					}
				
				  }else{
						alert("추가정보를 확인해주세요.");
				}
					
				
				}
				
			}else{
				alert("비밀번호를 확인해주세요.");
			}

			} else{
				alert("정보를 확인해주세요.");
			}


		});
		 
		/*----------------------------------  회원가입 btn end ----------------------------------------------------------*/
		


	});
 
	/* ------------------------------------------글자 제한--------------------------------------------------------- */
	
	
	
	 /*----------------------------------  auth popup  start ----------------------------------------------------------*/
		

function timer()
{
	$("#timer").css("color","red");
  count=count-1;
  if (count < 0 && min==0)
  {
     clearInterval(counter);
     //counter ended, do something here
     
     return;
  }else{
	  if(count<=0) {
					if (min != 0) {
						min = min - 1;
						count = 59;
					}
		} 
  }
  
  if(min==0 && count==0){
	  document.getElementById("timer").innerHTML="time over"; 
  }else{
  document.getElementById("timer").innerHTML=min+":"+count + " secs"; // watch for spelling
  $("#timer").css("color","red");
  //Do code for showing the number of seconds here	 
  }
}

function dialog() {

    var dialogBox = $('.dialog'),
        dialogTrigger = $('.dialog__trigger'),
        dialogClose = $('.dialog__close'),
        dialogTitle = $('.dialog__title'),
        dialogContent = $('.dialog__content'),
        dialogInput = $('.dialog__input'),
        timer = $('.timer'),
        dialogAction = $('.dialog__action');

    // Open the dialog
    dialogTrigger.on('click', function(e) {
    	
    	if($("#phone").val().trim() == ""){
			alert("핸드폰번호를 입력해주세요.");
    	}else{
    		
    	
    	if(auth ==false){
    		
    		var phone = $("#phone").val();
    		//alert(phone);
    		
    	$.ajax({
	 		type:"GET",
	 		url:"./commonAuth.common",
	 		data:{
				phone:phone
			},
	 		success: function(data){	
	 			var result = data.trim();
	 			
	 			if(result !="OK"){
	 				
	 				alert(" (-) or 문자를 제외한 번호만을 입력해주세요.");
	 			}else{
	 				count = 59;
	 				min = 2;
	 				 dialogBox.toggleClass('dialog--active');
	 		         e.stopPropagation();
	 		         timer();
	 			}
	 			
	 			
	 		}
	 	});
  				  }else{
    				alert("이미 인증되었습니다.");
   				  }
    	}
       
    });

    /* dialogAction.on('click',function(e){
	alert($('.dialog__input').val());
    }); */
    
    dialogInput.on({
		change : function() {
			auth = false;
		},
		blur : function() {
			var auth_data = $('.dialog__input').val();
			//alert(id);
			
		  	$.ajax({
		 		type:"POST",
		 		url:"./commonAuth.common",
		 		data:{
		 			auth:auth_data
		 		},
		 		success: function(data){
		 			 auth_result = data.trim();
		 			//alert("auth = "+auth_result);
		 			if(auth_result == "OK" && auth_data !=""){
		 				auth = true;
		 				clearInterval(counter);
		 				dialogInput.attr("readonly","readonly");
						$("#timer").text("인증확인");
						$("#timer").css("color","green");
						
					} else {
						auth = false;
						$("#timer").text("인증실패");
						$("#timer").css("color","red");

					}

		 			
		 		}
		 		
		 	}); 

		}
	});
	
    
    
    // Close the dialog - click close button
    dialogClose.on('click', function() {
        dialogBox.removeClass('dialog--active');
    });
    
    // Close the dialog - press escape key // key#27
    $(document).keyup(function(e) {
        if (e.keyCode === 27) {
            dialogBox.removeClass('dialog--active');
        }
    });
    
    // Close dialog - click outside
    $(document).on("click", function(e) {
        if ($(e.target).is(dialogBox) === false &&
            $(e.target).is(dialogTitle) === false &&
            $(e.target).is(dialogContent) === false &&
            $(e.target).is(dialogInput) === false &&
            $(e.target).is(timer) === false &&
            $(e.target).is(dialogAction) === false) {
            dialogBox.removeClass("dialog--active");
        }
    });

}





// Run function when the document has loaded

/*  */

$('.btn-example').click(function(){
    var $href = $(this).attr('href');
    layer_popup($href);
});


function layer_popup(el){

    var $el = $(el);        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('a.btn-layerClose').click(function(){
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });

    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });

}


/*----------------------------------  auth popup  end ----------------------------------------------------------*/
	 
	 
</script>

<link href="../css/join.css" rel="stylesheet">
     
</head>
<body>


	<!-- contents 시작 -->
	<section class="contents_wrap2">

		<div class="blank"></div>
		<article class="content_top">
			<!-- 	<img alt="" src="../image/common/join_logo.gif"> -->
		</article>


		<article class="content_main2">


			<div class="container-fluid row">
				<div class="col-md-8 col-centered">
					<div class="blank_small"></div>
					<div class="container">
					

						<!-- common form start -->
						<form name="frm" class="form-horizontal"	
							action="commonJoinUp.common" method="post">
<div id="common">
							<!-- ID -->
							<div class="form-group">
								<label class="control-label col-sm-2 btn btn-primary"
									style="color: white;" for="id"><b>ID</b></label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="id" placeholder=""
										name="id">
									<!-- 		<input type="button" id ="idCheck" value="중복확인"> -->
									<span id="result">ID를 입력하세요.</span>
								</div>
							</div>

							<!-- PW -->
							<div class="form-group">
								<label class="control-label col-sm-2 btn btn-primary"
									style="color: white;" for="pw">Password:</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="pw1" 
										placeholder="비밀번호는 8자리 이상 입력해주세요." name="pw">
								</div>
							</div>

							<!-- Confirm PW -->
							<div class="form-group">
								<label class="control-label col-sm-2 btn btn-primary"
									style="color: white;" for="pw">Password:</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="pw2"
										placeholder="Check password">
								</div>
							</div>

							<!-- Name -->
							<div class="form-group">
								<label class="control-label col-sm-2 btn btn-primary"
									style="color: white;" for="name">Name:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="name"
										placeholder="Enter Name" name="name">
								</div>
							</div>

							<!-- Addr -->
							<div class="form-group">
								<label class="control-label col-sm-2 btn btn-primary"
									style="color: white;" for="addr">Addr:</label>
								<div class="col-sm-10">
									<input type="text" id="addr_main" name="addr_main" readonly="readonly" class="postcodify_address" placeholder="검색을 눌러주세요."
										style="width: 300px;" />
									<button type="button" id="postcodify_search_button">검색</button>
									<br>
									<!-- 주소  -->
									<input type="text" id="addr_sub" name="addr_sub" class="postcodify_details" value=""
										style="width: 300px;" /><br />
									<!-- 빈칸  -->

								</div>
							</div>

							<!-- Phone -->
							<div class="form-group">
								<label class="control-label col-sm-2 btn btn-primary"
									style="color: white;" for="phone">Phone:</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="phone"
										placeholder="Enter Phone" name="phone" style="width: 200px;">
								<!-- 인증번호 -->

<input id="dialog" type="button" class="dialog__trigger" value="휴대폰 인증하기">

<div class="dialog">
  <span class="dialog__close">&#x2715;</span>
  <h2 class="dialog__title">인증 번호</h2>
  <p class="dialog__content">인증번호를 확인해 주세요.</p>
    <input class="dialog__input"> <span class="timer" id="timer">3:00</span>
 <!--  <button class="dialog__action">인증하기 &#8594;</button> -->
</div>  

								
								<!-- <button id="auth" class="auth"> 번호 인증</button> -->
								</div>
								
								
							</div>

							<!-- Email -->
							<div class="form-group">
								<label class="control-label col-sm-2 btn btn-primary"
									style="color: white;" for="email">Email:</label>
								<div class="col-sm-10" style="float: left;">
									<input type="email" class="form-control" id="email"
										placeholder="Enter email" name="email" style="width: 300px;">
									&nbsp; @ &nbsp; 
									<input type="text" class="form-control select_result"
										id="select_result"  placeholder="Enter email site" name="select_result"
										style="width: 300px;" value="">

									<div class="col-sm-10" style="float: right;">
										<select id="email_select" style="height: 40px; width: 120px;" class="form-control">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="google.com">google.com</option>
										</select>
									</div>
								</div>
							</div>




							<!-- Toggle -->
							<div class="form-group">
							<label class="control-label col-sm-2 btn btn-primary"
									style="color: white;" for="job">JOB:</label>
								
								<div class="col-sm-offset-2 col-sm-10">
									<input type="checkbox" data-toggle="toggle" data-on="Customer"
										data-off="Business" data-onstyle="info" data-offstyle="success"
										class="ch" data-offvalue="Business" checked
										data-onvalue="Customer" name="job" id="switch_toggle">

								</div>
							</div>

</div>
	<!-- common form end -->

<div id="info">
							<!-- Customer 추가정보 -->
							<section id="add">
							<!-- Birth -->
								<div class="form-group">
									<label class="control-label col-sm-2 btn btn-primary" for="birth"
										style="color: white;">Birth:</label>
									<div class="col-sm-10">
										<input type="date" class="form-control" id="birth"
											placeholder="Enter birth" name="birth">
									</div>
								</div>

								<!-- Gender -->
								<div class="form-group">
									<label class="control-label col-sm-2 btn btn-primary"
										for="gender" style="color: white;">Gender:</label>
									<div class="col-sm-10">

										<label class="container">남성 <input type="radio"
											id="male" name="gender" class="gender_ch"
											style="width: 20px; height: 20px;" value="male"> <span
											class="checkmark"></span>
										</label> <label class="container">여성 <input
											type="radio" name="gender" id="female" name="radio"
											class="gender_ch" style="width: 20px; height: 20px;"
											value="female"> <span class="checkmark"></span>
										</label>


									</div>
								</div>

								<!-- Wedding_Day -->
								<div class="form-group">
									<label class="control-label col-sm-2 btn btn-primary"
										for="wedding_day" style="color: white;">Wedding_Day:</label>
									<div class="col-sm-10">
										<input type="date" class="form-control" id="wedding_day"
											placeholder="Enter wedding_day" name="wedding_day">
									</div>
								</div>

							</section>
</div>

						<!-- extra 정보 -->
<div id="extra">
						<div class="form-group" style="text-align:center;">
						
						
						<table class="table">
            <!-- 웨딩홀 지역 -->
            <tr>
               <td><div class="require">*</div>웨딩홀 지역</td>
               <td>
                  <select name="sido1" id="sido1"></select>
                  <select name="gugun1" id="gugun1"></select>
               </td>
            </tr>

            <!-- 지하철 노선 -->
            <tr>
               <td><div class="require">*</div>지하철 노선</td>
               <td>
                  <select id="subway01" name="subway01"></select> 
                  <select id="subway02" name="subway02"></select>
               </td>
            </tr>

            <!-- 웨딩홀 타입 -->
            <tr>
               <td><div class="require">*</div>웨딩홀 타입</td>
               <td>
              
                  <input type="radio" name="type" id="type01" value="일반웨딩홀">
                  <label for="type01">일반웨딩홀</label>
                  <input type="radio" name="type" id="type02" value="야외웨딩홀">
                  <label for="type02">야외웨딩홀</label> 
                  <input type="radio" name="type" id="type03" value="전통웨딩홀">
                  <label for="type03">전통웨딩홀</label>
                  <input type="radio" name="type" id="type04" value="호텔웨딩홀">
                  <label for="type04">호텔웨딩홀</label> 
                  <input type="radio" name="type" id="type05" value="공공기관"><label for="type05">공공기관</label>
               </td>
            </tr>

            <!-- 식사 가격 -->
            <tr>
               <td><div class="require">*</div>식사가격</td>
               <td>
              
               <input type="radio" name="meal_cost" id="meal_cost01" value="1~2만원">
               <label for="meal_cost01">1~2만원</label> 
               <input type="radio" name="meal_cost" id="meal_cost02" value="2~3만원">
               <label for="meal_cost02">2~3만원</label> 
               <input type="radio" name="meal_cost" id="meal_cost03" value="3~4만원">
               <label for="meal_cost03">3~4만원</label> 
               <input type="radio" name="meal_cost" id="meal_cost04" value="4~5만원">
               <label for="meal_cost04">4~5만원</label> 
               <input type="radio" name="meal_cost" id="meal_cost05" value="5~6만원">
               <label for="meal_cost05">5~6만원</label> 
               <input type="radio" name="meal_cost" id="meal_cost06" value="6~7만원">
               <label for="meal_cost06">6~7만원</label> 
               <input type="radio" name="meal_cost" id="meal_cost07" value="7만원이상">
               <label for="meal_cost07">7만원이상</label></td>
            </tr>

            <!-- 식사 메뉴 -->
            <tr>
               <td><div class="require">*</div>식사메뉴</td>
               <td>
               	  <input
                  type="radio" name="meal_menu" id="meal_menu01" value="양식"><label
                  for="meal_menu01">양식</label> <input type="radio"
                  name="meal_menu" id="meal_menu02" value="한식"><label
                  for="meal_menu02">한식</label> <input type="radio"
                  name="meal_menu" id="meal_menu03" value="일식"><label
                  for="meal_menu03">일식</label> <input type="radio"
                  name="meal_menu" id="meal_menu04" value="중식"><label
                  for="meal_menu04">중식</label> <input type="radio"
                  name="meal_menu" id="meal_menu05" value="뷔페"><label
                  for="meal_menu05">뷔페</label></td>
            </tr>

            <!-- 하객수 -->
            <tr>
               <td><div class="require">*</div>하객수</td>
               <td>
               	  <input
                  type="radio" name="visitor" id="visitor01" value="50~100명"><label
                  for="visitor01">50~100명</label> <input type="radio"
                  name="visitor" id="visitor02" value="100~200명"><label
                  for="visitor02">100~200명</label> <input type="radio"
                  name="visitor" id="visitor03" value="200~300명"><label
                  for="visitor03">200~300명</label> <input type="radio"
                  name="visitor" id="visitor04" value="300~400명"><label
                  for="visitor04">300~400명</label> <input type="radio"
                  name="visitor" id="visitor05" value="400~500명"><label
                  for="visitor05">400~500명</label> <input type="radio"
                  name="visitor" id="visitor06" value="500명이상"><label
                  for="visitor06">500명이상</label></td>
            </tr>      
         </table>
         						
					</div>
	</div>
	
<div id="join_btn">
					<!-- form button -->
							<div class="form-group" style="text-align: center;">
								<div class="col-sm-offset-2 col-sm-10">
									<!-- <button type="submit" class="btn btn-default">Submit</button> -->
									<input type="button" id="btn"
										class="btn btn-default btn btn-warning button" value="Join">
								</div>
							</div>

</div>						 
													<input type="button" class="pref" value="이전">
													<input type="button" class="next" value="다음">
													

						</form>
					</div>

				</div>
			</div>

		</article>
	</section>
	<!-- contents 끝 -->



	<!-- 위에서 생성한 <div>에 검색 기능을 표시하고, 결과를 입력할 <input>들과 연동한다 -->
	<script>
    $(function() { 
    
    	
    $("#postcodify").postcodify({
        insertPostcode5 : "#postcode",
        insertAddress : "#address",
        insertDetails : "#details",
        insertExtraInfo : "#extra_info",
        hideOldAddresses : false
    }); 
	//--------------------------------------------주소----------------------------------------------

    $("#email_select").change(function(){
    	var x  = $("#email_select").val();
    	$(".select_result").val(x);	
    });
    
 
    });
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
    /*------------------------------------------ 시도 군구 ---------------------------------------*/
    
      var area0 = [ "시/도", "서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도" ];
      var area1 = [ "군/구", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
      var area2 = [ "군/구", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군" ];
      var area3 = [ "군/구", "대덕구", "동구", "서구", "유성구", "중구" ];
      var area4 = [ "군/구", "광산구", "남구", "동구", "북구", "서구" ];
      var area5 = [ "군/구", "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ];
      var area6 = [ "군/구", "남구", "동구", "북구", "중구", "울주군" ];
      var area7 = [ "군/구", "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군" ];
      var area8 = [ "군/구", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
      var area9 = [ "군/구", "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군" ];
      var area10 = [ "군/구", "제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군" ];
      var area11 = [ "군/구", "계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군" ];
      var area12 = [ "군/구", "군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군" ];
      var area13 = [ "군/구", "광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" ];
      var area14 = [ "군/구", "경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
      var area15 = [ "군/구", "거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군" ];
      var area16 = [ "군/구", "서귀포시", "제주시", "남제주군", "북제주군" ];

      // 시/도 선택 박스 초기화
      $("select[name^=sido]").each(function() {
         $selsido = $(this);
         $.each(eval(area0), function() {
            $selsido.append("<option value='" + this + "'>" + this + "</option>");
         });
         $selsido.next().append("<option value=''>군/구</option>");
      });

      // 시/도 선택시 구/군 설정
      $("select[name^=sido]").change(function() {
         var area = "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
         var $gugun = $(this).next(); // 선택영역 군구 객체
         $("option", $gugun).remove(); // 구군 초기화
         if (area == "area0")
            $gugun.append("<option value=''>구/군</option>");else {
            $.each(eval(area), function() {
               $gugun.append("<option value='" + this + "'>" + this + "</option>");
            });
         }
      });
    
      
      /*---------------------------------------------------------지하철----------------------------------------------------  */
    
      var subway0 = [ "지하철", "1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선", "9호선", "경부선", "경의선", "경원선", "장안선", "경축선", "중앙선", "경인선", "안산선", "과천선", "분당선", "일산선", "공항철도선", "인천1호선", "분당선", "신분당선"];
      
      $("select[name=subway01]").each(function() {
         $selssub = $(this);
         $.each(eval(subway0), function() {
            $selssub.append("<option value='" + this + "'>" + this + "</option>");
         });
         $selssub.next().append("<option value=''>역선택</option>");
      });
      
      $("#subway01").change(function() {
         $("#subway02 option").remove();
         $("#subway02").append("<option value=''>역선택</option>");
         var index = 0;
         $.ajax({
            url: "../json/subway.json",
            type: "GET",
            success: function(data) {
               while(data[index] != null) {
                  if($("#subway01").val().trim() == data[index].line.trim()) {
                     $("#subway02").append("<option value='"+data[index].subway+"'>"+data[index].subway+"</option>");
                  }
                  index++;
               }
            }
         });
      });
      
      
      
</script>


</body>
</html>