<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
li a{
	text-decoration: none;
	color : gray;
}
</style>

</head>
<body>
<div class="col-sm-3 sidenav2" style="margin-top: 100px; width: 250px;margin-left: 30px;">
      <ul class="nav nav-pills nav-stacked" >
       <li><h3 style="color: gray; ">Community</h3></li>
       <hr style="border: 1px #2096BA solid;">
        <li><a href="${pageContext.request.contextPath}/notice/noticeList.notice">공지사항</a></li>
        <li><a href="${pageContext.request.contextPath}/qna/qnaList.qna">Q&A</a></li>
        <li><a href="#">실시간 상담</a></li>
       <li><a href="${pageContext.request.contextPath}/report/reportPage.report">신고 하기</a></li>
       <li><a href="${pageContext.request.contextPath}/review/reviewPage.review">이용 후기</a></li>
      </ul><br>
 
    </div>
</body>
</html>