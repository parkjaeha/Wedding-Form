<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script type="text/javascript">

function _(el){
	return document.getElementById(el);
}

function uploadFile(files){
	/* var files =  _("file1").files;
	var file = _("file1").files[0]; */
	
	
	
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
<link rel="stylesheet" href="./css/global.css">
</head>
<body>

	<div class="dropzone" id="dropzone" onclick="uploadFile()"> Drop Files here to upload</div>
	
	
	
	<!-- <input type="file" name="file1" id="file1" multiple><br>
	<input type="button" value="upload File" id="click" onclick="uploadFile()"> 
	 -->
	<progress id="progressBar" value="0" max="100" style="width:300px";></progress>	
	<h3 id="status"></h3>
	<p id="loaded_n_total"></p>
	
	<div id="result"></div>
	

<script type="text/javascript">
	
		(function(){

function _(el){	
	
	return document.getElementById(el);
}
			
			var dropzone = document.getElementById('dropzone');
			
			
			
			var upload = function(files){
				
				var formData = new FormData();
				for(x=0;x<files.length;x=x+1){
					formData.append('file[]',files[x]);
					console.log(files[x].name);		
					
				}
			
				var ajax = new XMLHttpRequest();
				ajax.upload.addEventListener("progress",progressHandler,false);
				ajax.addEventListener("load",completHandler,false);
				ajax.addEventListener("error",errorHandler,false);
				ajax.addEventListener("abort",abortHandler,false);
				ajax.open("POST","UploadServlet");
				ajax.send(formData);
				
				//console.log(files);
			/* 	var formData = new FormData(),
				xhr = new XMLHttpRequest(),
				x;
				
				for(x=0;x<files.length;x=x+1){
					formData.append('file[]',files[x]);
					console.log(files[x].name);
				}
			
				xhr.onload= function(){
					var data = this.responseText;
					//var data = JSON.parse(this.responseText);
					console.log(data);
					
					//displayUploads(data);
				}
				
				xhr.open('post','UploadServlet');
				xhr.send(formData);
				 */
			}
			
			
			dropzone.ondrop = function(e){
				e.preventDefault();
				this.className = 'dropzone';
				//console.log(e.dataTransfer.files);
				upload(e.dataTransfer.files);
				//drop after upload 
				
			};
			
			dropzone.ondragover = function(){
				this.className= 'dropzone dragover';
				
				
				return false;
			};
			
			dropzone.ondragleave = function(){
				this.className = 'dropzone';
				return false;
				
				
			};
			
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
			
			
		}());
	
	</script>


</body>
</html>