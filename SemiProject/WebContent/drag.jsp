<%@ page language="java"
contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>drag & drop uploading</title>
<link rel="stylesheet" href="./css/global.css">
</head>
<body>

	<div id="uploads"></div>
	<div class="dropzone" id="dropzone"> Drop Files here to upload</div>


	<script type="text/javascript">
	
		(function(){
			
			var dropzone = document.getElementById('dropzone');
			
			var displayUploads = function(data){
				var uploads = document.getElementById('uploads'),
				anchor,
				x;
				
				
				for(x=0; x<data.length; x=x+1){
				anchor = document.createElement('a');
				anchor.href = data[x].file;
				anchor.innertText = data[x].name;
				
				uploads.appendChild(anchor);
				
				}
				
			};
			
			var upload = function(files){
				//console.log(files);
				var formData = new FormData(),
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
			
		}());
	
	</script>

</body>
</html>