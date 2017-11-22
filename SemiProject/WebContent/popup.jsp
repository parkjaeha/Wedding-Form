<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>popup</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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

/* * {
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
 */
</style>


<script type="text/javascript">


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
    	 $("#timer").css("color","red");
        dialogBox.toggleClass('dialog--active');
        e.stopPropagation();
        timer();
    });

    dialogAction.on('click',function(e){
	alert($('.dialog__input').val());
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


var count=60;     

var counter=setInterval(timer, 1000); //1000 will  run it every 1 second
var min = 2;
function timer()
{
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



// Run function when the document has loaded
$(function() {
    dialog();
    
    
});



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




</script>

</head>
<body>



<button class="dialog__trigger">Open Dialog</button>

<div class="dialog">
  <span class="dialog__close">&#x2715;</span>
  <h2 class="dialog__title">This is a title</h2>
  <p class="dialog__content">인증번호를 확인해 주세요.</p>
    <input class="dialog__input"> <span class="timer" id="timer">3:00</span>
  <button class="dialog__action">Read more &#8594;</button>
</div>  



<!--  -->



</body>
</html>