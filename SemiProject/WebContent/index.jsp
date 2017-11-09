<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<!-- 
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.waterwheelCarousel.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

jQuery library
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

Latest compiled JavaScript
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
<!-- <meta name="google-signin-client_id" content="761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com">
 --> 

<script src="https://apis.google.com/js/platform.js"></script>

<!-- ----------------------------------------------------------------- -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">

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

</script>

<style type="text/css">

* {
  margin: 0;
  padding: 0;
}

body {
  margin: 100px;
}

.pop-layer .pop-container {
  padding: 20px 25px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}

</style>
<!-- ----------------------------------------------------------------- -->


</head>
<body>
<c:if test="${empty sessionScope.common}">
	<a href= "./common/commonLogin.common">login</a>  <br><br>
</c:if>
<c:if test="${not empty common}">
	<a href="./common/commonLogout.common">LogOut</a>  <br><br>
	</c:if>

	<a href= "./member/memberPw.member">pw</a> <br><br>
	<a href= "./member/memberEmail.member">email</a> <br><br>			<!-- email -->
	<a href= "./member/memberSelPhone.member">selphone</a> <br><br>		<!-- 결제 -->
	<a href= "./member/memberUpload.member">Upload</a> <br><br>			
		<a href= "./function/functionCalendar.function">Calendar</a> <br><br>  <!-- 달력 -->
		<a href= "./progressbar3.jsp">drag&drop</a> <br><br>					<!-- drag&drop upload -->
		<a href= "./google_login.jsp">google_login</a> <br><br>					<!-- google_login -->
		<a href= "./facebook.jsp">facebook</a> <br><br>							<!-- facebook login -->
		<a href= "./address.jsp">home_staition_address</a> <br><br>				<!-- 우변주소 -->
	

<!-- ----------------------------------------------------------------- -->



<body>
<div style="height: 300px;"></div>
<a href="#layer1" class="btn-example">일반 팝업레이어</a>
<div id="layer1" class="pop-layer">
    <div class="pop-container">
        <div class="pop-conts">
            <!--content //-->
            <p class="ctxt mb20">Thank you.<br>
                Your registration was submitted successfully.<br>
                Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
                Hope to see you soon!
            </p>

            <div class="btn-r">
                <a href="#" class="btn-layerClose">Close</a>
            </div>
            <!--// content-->
        </div>
    </div>
</div>
<br/><br/>
<a href="#layer2" class="btn-example">딤처리 팝업레이어 1</a>
<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <p class="ctxt mb20">Thank you.<br>
                    Your registration was submitted successfully.<br>
                    Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
                    Hope to see you soon!
                </p>

                <div class="btn-r">
                    <a href="#" class="btn-layerClose">Close</a>
                </div>
                <!--// content-->
            </div>
        </div>
    </div>
</div>







</body>
</html>
