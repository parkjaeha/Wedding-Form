<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
.contents{
width: 1100px;
height: 150px;
margin: 0 auto;

}
.contents li{
list-style : none;
width:150px;
height: 60px;
border : 1px solid gray;
text-align : center;
margin-left : 50px;
float: left;
}
.contents li a{
text-decoration: none;
font-size: 13px;
color: black;
}
.contents li:hover {

background-color: #EAEAEA;

}


.contents_2{
width: 1100px;
height: 600px;
margin: 0 auto;
margin-top : 100px;

}
 #box{
width: 500px;
height: 400px;
margin: 0 auto;


} 

 a:hover{
color : gray;

}

</style>
</head>
<body>
 <c:import url="../../../temp/header.jsp"></c:import>
 <div id="blank"></div>
 <div id="blank"></div>
	<article class="contents">

<ul>
<li class="w3-display-container"><a href="${pageContext.request.contextPath}/notice/noticeList.notice" class="w3-display-middle">공지사항</a></li>
<li class="w3-display-container"><a href="${pageContext.request.contextPath}/qna/qnaList.qna" class="w3-display-middle">Q&A</a></li>
<li class="w3-display-container"><a href="#" class="w3-display-middle">실시간 상담</a></li>
<li class="w3-display-container"><a href="${pageContext.request.contextPath}/report/reportPage.report" class="w3-display-middle">신고하기</a></li>
<li class="w3-display-container"><a href="${pageContext.request.contextPath}/review/reviewPage.review" class="w3-display-middle">리뷰</a></li>
</ul>	
	</article>

<div class="contents_2">
<a href="./reportWrite.report"><div id="box">
<img alt="" src="../img/report.png">
</div></a>
</div>

 <c:import url="../../../temp/footer.jsp"></c:import>
</body>
</html>