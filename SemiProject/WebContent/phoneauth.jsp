<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

.onoffswitch {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.onoffswitch-checkbox {
    display: none;
}
.onoffswitch-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.onoffswitch-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.onoffswitch-inner:before, .onoffswitch-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.onoffswitch-inner:before {
    content: "ON";
    padding-left: 10px;
    background-color: #34A7C1; color: #FFFFFF;
}
.onoffswitch-inner:after {
    content: "OFF";
    padding-right: 10px;
    background-color: #F0D509; color: #FFFFFF;
    text-align: right;
}
.onoffswitch-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-inner {
    margin-left: 0;
}
.onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-switch {
    right: 0px; 
}

///////////////////////////////////////////////////////////////////////////////
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
	 		url:"./common/commonAuth.common",
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
		 		url:"./common/commonAuth.common",
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

<div class="onoffswitch">
    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" checked>
    <label class="onoffswitch-label" for="myonoffswitch">
        <span class="onoffswitch-inner"></span>
        <span class="onoffswitch-switch"></span>
    </label>
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


	<!-- common form end -->



	<!-- 위에서 생성한 <div>에 검색 기능을 표시하고, 결과를 입력할 <input>들과 연동한다 -->
	<script>
    $(function() { 
    $("#myonoffswitch").click(function(){
    	alert($(".onoffswitch-checkbox:checked").val()+"123 " +$(".onoffswitch-checkbox:checked").val());
    });
	//--------------------------------------------주소----------------------------------------------

    $("#email_select").change(function(){
    	var x  = $("#email_select").val();
    	$(".select_result").val(x);	
    });
    
 
    });
 </script>


</body>
</html>