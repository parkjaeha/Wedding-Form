<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function _(el){
	return document.getElementById(el);
}

function uploadFile(){
	var files =  _("file1").files;
	var file = _("file1").files[0];
	
	
	
	var formData = new FormData();
	for(x=0;x<files.length;x=x+1){
		formData.append('file[]',files[x]);
		console.log(files[x].name);
	}
	/* 
	var formdata = new FormData();
	formdata.append("file1",file); */
	var ajax = new XMLHttpRequest();
	ajax.upload.addEventListener("progress",progressHandler,false);
	ajax.addEventListener("load",completHandler,false);
	ajax.addEventListener("error",errorHandler,false);
	ajax.addEventListener("abort",abortHandler,false);
	ajax.open("POST","UploadServlet");
	ajax.send(formData);
}


function progressHandler(event){
	_("loaded_n_total").innerHTML = " Uploaded" + event.loaded+"bytes of"+ event.total;
	var percent = (event.loaded / event.total) * 100;
	_("progressBar").value = Math.round(percent);
	_("status").innerHTML = Math.round(percent)+ "% uploaded....please wait";
	
}


function completHandler(event){
	_("progressBar").value = 0;
	_("status").innerHTML = event.target.responseText;
}

function errorHandler(event){
	_("status").innerHTML = "upload failed";
}

function abortHandler(event){
	_("status").innerHTML = "upload Aborted";
}

</script>

</head>
<body>
	<form id="upload_form" action="UploadServlete" enctype="multipart/form-data" method="post">
	
	<input type="file" name="file1" id="file1" multiple><br>
	<input type="button" value="upload File" onclick="uploadFile()"> 
	<progress id="progressBar" value="0" max="100" style="width:300px";></progress>	
	
	<h3 id="status"></h3>
	<p id="loaded_n_total"></p>
	</form>


</body>
</html>