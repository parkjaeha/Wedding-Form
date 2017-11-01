<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
 #idcheck{
  color:red;
  font-size:10pt;
 }
</style>
<script type="text/javascript">
 var xhr=null;
 
 function getXHR(){
  if(window.XMLHttpRequest){
   //IE 7.0이상,Chrome,Firefox,Safari,....
   return new XMLHttpRequest();
  }else{
   //IE 하위버젼(6.0이하)
   return new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
 
 function idCheck(){
  xhr=getXHR();
  xhr.onreadystatechange=getResult;
  var id=document.getElementById("id").value;
  xhr.open("get","idcheck.jsp?id="+id,true);
  xhr.send(null);
 }
 
 function getResult(){
  if(xhr.readyState==4 && xhr.status==200){
   var xml=xhr.responseXML;
   var re=xml.getElementsByTagName("result")[0].firstChild.nodeValue;
   
   if(re=='true'){
    //span에 결과 출력하기
    document.getElementById("idcheck").innerHTML="이미 사용중인 아이디 입니다.";
   }else{
    document.getElementById("idcheck").innerHTML="사용가능한 아이디 입니다.";
   }
  }
 }
</script>
</head>
<body>
<h3>회원가입</h3>
<form method="post" action="memberjoin2.jsp">
 아이디 <input type="text" name="id" id="id" onkeyup="idCheck()"/>
 <!-- <input type="button" value="중복확인" onclick="idCheck()"/>  -->
 <span id="idcheck"></span>
 <br/>
 비밀번호 <input type="password" name="pwd"/><br/>
 이메일<input type="text" name="email"/><br/>
 <input type="submit" value="회원가입"/>
</form>
</body>
</html>