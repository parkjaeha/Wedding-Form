<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC >
<html>
<head>
<c:import url="../../../temp/ref.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
   @media screen and (max-width: 767px) {
      .sidenav2 {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }

.contents{
width: 100%;
height: 600px;
margin: 0 auto;
margin-top :50px;
float: left;

}
 #box{
width: 500px;
height: 400px;
margin: 0 auto;


} 


</style>
</head>
<body>



<div id="all">
 <c:import url="../../../temp/header.jsp"></c:import>
<div class="container-fluid" style="margin-top: 77px;">
  
  
  <div class="row content">
    <div class="col-sm-2 sidenav2" >
      <ul class="nav nav-pills nav-stacked" style="margin-left: 30px;">
<li><h3 style="color: gray; margin-top : 50px;">Community</h3></li>
       <hr style="border: 1px #2096BA solid;">
        <li><a href="${pageContext.request.contextPath}/notice/noticeList.notice">공지사항</a></li>
        <li><a href="${pageContext.request.contextPath}/qna/qnaList.qna">Q&A</a></li>
       <li class="active"><a href="${pageContext.request.contextPath}/report/reportPage.report">신고 하기</a></li>
       <li><a href="${pageContext.request.contextPath}/review/reviewPage.review">이용 후기</a></li>
      </ul><br>
    </div>





    <div class="col-sm-9" style="margin-left:30px;">



<div class="contents">
 
<a href="./reportWrite.report"><div id="box">
<img alt="" src="../images/report/report.png">
</div></a>
</div>
</div>
 </div>
 <c:import url="../../../temp/footer.jsp"></c:import>
 </div>
</body>
</html>