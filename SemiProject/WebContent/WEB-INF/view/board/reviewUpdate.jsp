<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="/SemiProject/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>

<style type="text/css">
.contents{
	float: none;
	margin: 0 auto;
	width:800px;
	margin-bottom: 100px;
}

.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#5D5D5D;}


input {
   width: 700px;
   height: 30px;
}

.review_1 {
	height: 34px;
	margin: 0 auto;
	text-align: center;
	margin-top: 50px;
}

.review_2 {
	width: 70px;
	height: 30px;
	border-top: 1px solid black;
	margin: 0 auto;
}
.panel-body{
margin-left: 25px;
}

.form-control{width:700px; margin-left: 0;}
</style>

<script type="text/javascript">
/*별점  */
var star;
$(function(){
	
$( ".star_rating a" ).click(function() {
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");

/*  star = $(this).prop("name");
    alert(star); */
   $("#temp").prop("value",$(this).prop("name"));
    return false;
});

//전역변수선언
var editor_object = [];
 
nhn.husky.EZCreator.createInIFrame({
    oAppRef: editor_object,
    //textarea ID
    elPlaceHolder: "smarteditor",
    /* 주소 바꿀껏  */
    sSkinURI: "/SemiProject/SE2/SmartEditor2Skin.html", 
    htParams : {
        // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
        bUseToolbar : true,             
        // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
        bUseVerticalResizer : true,     
        // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
        bUseModeChanger : true, 
    }
});
 
//전송버튼 클릭이벤트
$("#savebutton").click(function(){
    //id가 smarteditor인 textarea에 에디터에서 대입
    editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
     
    // 이부분에 에디터 validation 검증
     
    //폼 submit
    $("#frm").submit();
})

});

</script>
</head>
<body>
	<div id="all">
 <c:import url="../../../temp/header.jsp"></c:import>
<div id="blank"></div>
   <div id="blank"></div>
<div class="contents panel panel-default" style="margin-top: 150px;">
				<article class="review_1">REVIEW</article>
         <article class="review_2"></article>
					 <form action="./reviewUpdate.review?type=${param.type}" method="post"> 
					<input type="hidden" name="num" value="${param.num}">
			
						<p class="panel-body"><input class="form-control" type="text" readonly="readonly" name="writer" value="${update.writer}"></p>
				
					
						<p class="panel-body"><input class="form-control" type="text" name="title" value="${update.title}"></p>
					
				
			
					 	 <p class="panel-body">별점을 체크해주세요.(1점당 ★)</p>
					 	 <div class="star_rating panel-body">
					 	 <input type="hidden" id="temp" name="starscore">
                                  <a href="#" class="on" name="1">★</a>
                                  <a href="#" class="on" name="2">★</a>
                                  <a href="#" class="on"name="3">★</a>
                                  <a href="#" name="4">★</a>
                                  <a href="#" name="5">★</a>
                                </div>
                              
                  


					
<p class="panel-body"><textarea name="smarteditor" id="smarteditor" rows="10" cols="100"
            style="width: 700px; height: 312px;">${update.contents}</textarea></p>
         <p class="panel-body"><input type="submit" class="btn btn-default" id="savebutton" value="write" /></p>
			
				
					
				</form>
		

			
			
			</div>

 <c:import url="../../../temp/footer.jsp"></c:import>
 </div>
</body>
</html>