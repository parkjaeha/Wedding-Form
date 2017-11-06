<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!-- <script type="text/javascript">

$(function(){ 

	$("#btn").click(function(){ var formData = new FormData(); 
formData.append("test2", $("input[name=test2]").val()); 
formData.append("test3", $("textarea[name=test3]").text()); 
formData.append("test4", $("input[name=test4]")[0].files[0]); 

$.ajax({ 
url: 'memberUploadResult.member', 
data: formData, 
processData: false, 
contentType: false, 
type: 'POST', 
success: function(data){ 
alert("EE"); } 

}); 
}); 
});

</script> -->


</head>
<body>

<h1>Upload</h1>

<form id="ajaxform" action="memberUploadResult.member" method="post" enctype="multipart/form-data">
		
		<input type="file" name="f1" />
		<input type="button" id="btn" value="전송" />
		<button>click</button>
</form>


</body>
</html>