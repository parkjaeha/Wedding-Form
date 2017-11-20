<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


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
<title>Insert title here</title>
<style type="text/css">
.contents {
	width: 800px;
	float: none;
	margin: 0 auto;
	margin-top : 100px;
	margin-bottom: 200px;
}

.report_1 {
	height: 34px;
	margin: 0 auto;
	text-align: center;
	margin-top: 50px;
}

.report_2 {
	width: 70px;
	height: 30px;
	border-top: 1px solid black;
	margin: 0 auto;
}



input {
   width:350px;
   height: 30px;
}

.panel-body{
margin-left: 25px;
}

.form-control{width:700px; margin-left: 0;}

</style>

</head>
<script type="text/javascript">
$(function(){
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
})
</script>
<body>
 <c:import url="../../../temp/header.jsp"></c:import>
  <div id="blank"></div>
 <div id="blank"></div>
		<div class="contents panel panel-default">
<article class="report_1">신고하기</article>
         <article class="report_2"></article>
  <div id="blank"></div>

			<form action="./reportWrite.report" method="post">
			
	
			
		
			
			<!-- id는 hidden -->
	      <p class="panel-body"><input  type="text" name="id" class="form-control"  placeholder="id"></p>
			
	     <p class="panel-body"><input type="password" name="password"  class="form-control" placeholder="비밀번호"></p>
			
	      <p class="panel-body"><input type="text" name="title"class="form-control" placeholder="제목"></p>
	       
	      <p class="panel-body"><input  type="text" name="company_name" class="form-control" placeholder="회사이름"></p>
			
	       
	     <p class="panel-body">
	      <textarea name="smarteditor" id="smarteditor" rows="5" cols="90"
            style="width: 700px; height: 312px;"></textarea>
            
        <p class="panel-body">
<a href="./reportPage.report"><input type="button" class="btn btn-default" value="취소" /></a>
 <input type="submit" class="btn btn-default" id="savebutton" value="글쓰기" />
</p>  
			</form>
		
				

			</div>
 <c:import url="../../../temp/footer.jsp"></c:import>
</body>
</html>