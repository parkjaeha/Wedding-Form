<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- 주소바꿀것 -->
<script type="text/javascript"
   src="/SemiProject/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
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
    });
    
    $("#reply").click(function(){
    	$("#h").slideToggle();
    });
})
</script>
<style type="text/css">
.contents{
	float: none;
	width:1200px;
	margin: 0 auto;
	margin-bottom: 100px;
	
}

.blank{
width: 50;
height: 100px;

}
.write_1{
	
	height: 34px;
	margin: 0 auto;
	text-align: center;
}

.write_2{
    width: 70px;
	height: 30px;
	border-top : 1px solid black;
	margin: 0 auto;
}
#border{
width : 1100px;
border-bottom: 1px solid gray;
}

#t{
font-size: 20px;
text-align: center;
}


.form-control {
   width: 800px;
   height: 30px;
}


</style>
</head>
<body>
	<div id="all">
 <c:import url="../../../temp/header.jsp"></c:import>
 	<div class=blank></div>
 		
<div class="contents container">
<article class="write_1">${board}</article>
  <article class="write_2"></article>



  <div class="panel panel-default">
    <div id="t" class="panel-body">${view.title}</div>
  </div>
  
  
  <div class="panel panel-default">
   <div class="panel-body">
<p>WRTIER : ${view.writer} | DATE : ${view.reg_date} | HIT : ${view.hit}</p>



<p style="margin-top: 50px;"> ${view.contents}</p>



	
	
	
	
	
		<div class=blank></div>
	
	
	
	</div>
	
</div>
<!-- 목록, 수정, 삭제  -->
<a href="./${board}List.${board}">
	<img alt="" src="../images/main/list.png" style="width: 80px; height: 30px;"></a>
<!--글쓴이만  -->
	<a href="./${board}Update.${board}?num=${view.num}">
	<img alt="" src="../images/main/update.png" style="width: 80px; height: 30px;"></a>
	<c:if test="${board eq 'notice'}" >
	<a href="./${board}Delete.${board}?num=${view.num}">
	<img alt="" src="../images/main/delete.png" style="width: 80px; height: 30px;"></a>
	</c:if>
	<c:if test="${board eq 'qna'}" >
	<a href="./${board}Delete.${board}?ref=${view.ref}">
	<img alt="" src="../images/main/delete.png" style="width: 80px; height: 30px;"></a>
	<!--관리자 답글달기  -->
	<img alt="" src="../images/main/qna.png" style="width: 80px; height: 30px;" id="reply">
	</c:if>





	<!-- 관리자만 Q&A 답글달기-->

	<c:if test="${board eq 'qna'}"  >
	   <div id="h" class="panel panel-default" style="margin-top : 100px; display: none;"> 
   <div class="panel-body " >
	<form action="./qnaReply.qna" method="post">
			<input type="hidden" name="num" value="${param.num}">
			<input type="hidden" name="opencheck" value="${param.opencheck}">
			<input type="hidden" name="password" value="${param.password}">
		
         <p> <input type="text" name="writer" class="form-control" placeholder="writer"></p>

         <p><input type="text" name="title" class="form-control" placeholder="제목"></p>
         
         <textarea name="smarteditor" id="smarteditor" rows="10" cols="100"
            style="width: 800px; height: 312px;"></textarea>
            <div id="blank"></div>
         <input type="submit" class="btn btn-default" id="savebutton" value="글쓰기" />

	</form>
	</div>
	</div>
	</c:if>

	
	
</div>
 <c:import url="../../../temp/footer.jsp"></c:import>
 </div>
</body>
</html>