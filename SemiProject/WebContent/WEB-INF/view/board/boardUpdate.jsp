<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    })
})
</script>

<title>Insert title here</title>
<style type="text/css">
.board_1 {
   height: 34px;
   margin: 0 auto;
   text-align: center;
   margin-top: 50px;
}

.board_2 {
   width: 70px;
   height: 30px;
   border-top: 1px solid black;
   margin: 0 auto;
}

.contents {
   width: 800px;
   float: none;
   margin: 0 auto;
   margin-bottom: 100px;
}

#pw {
   display: none;
}

#hide, #open {
   width: 20px;
   height: 15px;
}

input {
   width: 700px;
   height: 30px;
}

.panel-body{
margin-left: 25px;
}

.form-control{width:700px; margin-left: 0;}
</style>



</head>

<body>
	<div id="all">
   <c:import url="../../../temp/header.jsp"></c:import>

   <div id="blank"></div>
   <div id="blank"></div>
   <div class="contents  panel panel-default" style="margin-top: 150px;">
   <c:if test="${board eq 'qna'}">
      <article class="board_1">Q&A</article>
      <article class="board_2"></article>
   </c:if>
   <c:if test="${board eq 'notice'}">
      <article class="board_1">NOTICE</article>
      <article class="board_2"></article>
   </c:if>
   <div id="blank"></div>



      <form action="./${board}Update.${board}" method="post" >
        <input type="hidden" name="num" value="${update.num}">
         
         <div>
        

         <p class="panel-body">
        <input type="text" name="title" class="form-control" value="${update.title }">
         </p>
         </div>
         <div>
         <p class="panel-body"><textarea name="smarteditor" id="smarteditor" rows="10" cols="100"
            style="width: 700px; height: 312px;">${update.contents} </textarea></p>
            <div id="blank"></div>
         <p class="panel-body">
         <input type="submit" class="btn btn-default" id="savebutton" value="글쓰기" /></p>
         
      </div>
      </form>




   </div>

 <div id="blank"></div>
   <div id="blank"></div>
   <c:import url="../../../temp/footer.jsp"></c:import>
</div>
</body>
</html>