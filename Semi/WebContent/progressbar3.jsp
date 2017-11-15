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

<link rel="stylesheet" href="./css/global.css">
</head>
<body>

	<div class="dropzone" id="dropzone" onclick="uploadFile()" accept="image/*"> Drop Files here to upload</div>
	
	<!-- <input type="file" name="file1" id="file1" multiple><br>
	<input type="button" value="upload File" id="click" onclick="uploadFile()"> 
	 -->
	<progress id="progressBar" value="0" max="100" style="width:300px";></progress>	
	<h3 id="status"></h3>
	<p id="loaded_n_total"></p>
	
	<img id="result"/>
	<div id="result1"></div>
	
	
<script type="text/javascript">
var str = null;

(function(){

function _(el){	
	return document.getElementById(el);
}
			
			var dropzone = document.getElementById('dropzone');
	
			//file upload
			var upload = function(files){
				
				var formData = new FormData();
				
				
				 var filelist = files; // Array of all files
				 var wrapdiv = null;
				 var newDiv = null;
				 var progress = null;
				 var img = null;
				 var btn = null;
				 var split = null;
				    for (var i=0, file; file=filelist[i]; i++) {
				        if (file.type.match(/image.*/)) {
				            var reader = new FileReader();
				            reader.fileName = filelist[i].name;
				            
				            reader.onload = function(e2) {
				                // finished reading file data.
				                img = document.createElement('img');
				                img.src= e2.target.result;
				                img.style.width = "100px";
				                img.style.height = "100px";
				                
				                newDiv = document.createElement("div");
				                newDiv.innerHTML = "filename = " + e2.target.fileName;
				                
				               // <progress id="progressBar" value="0" max="100" style="width:300px";></progress>	
				                progress = document.createElement('div');
				            	progress.innerHTML = '<progress id="progressBar" value="0" max="100" style="width:300px";></progress>';
				                //<button id= "">delete<button>
				            	btn = document.createElement('div');
				            	
				            	 str = e2.target.fileName;
				            	var fun = str.replace(".", "_");
				                	
				            	btn.innerHTML = '<button id="'+ fun +'">delete</button>';
				            	
				            	wrapdiv =document.createElement("div");
				            	wrapdiv.id = "d"+fun;
				            	wrapdiv.appendChild(img);
				            	wrapdiv.appendChild(newDiv);
				            	wrapdiv.appendChild(progress);
				            	wrapdiv.appendChild(btn);

				                document.body.appendChild(wrapdiv);
				               /*  document.body.appendChild(img);
				                document.body.appendChild(newDiv);
				               	document.body.appendChild(progress);
				               	document.body.appendChild(btn); */
				               	
					        	$('#'+fun).click(function(){
				               		alert("filename: "+e2.target.fileName+" fun: "+fun);
				               		$("#d"+fun).css("display","none");
				               		filelist[i].remove();
				               		
				               	});
				               
				                
				            }

				            reader.readAsDataURL(file); // start reading the file data.
				        
				        }
				    }
				
				for(x=0;x<files.length;x=x+1) {
					if((files[x].name).indexOf(".jpg") !=-1 || (files[x].name).indexOf(".png") !=-1 || (files[x].name).indexOf(".gif") !=-1){
					formData.append('file[]', files[x]);
					console.log(files[x].name);

						  //  console.log('entering openFile()');
						  /*   img = img+'<img src= '+files[x].name+'"'+' width="200" height="200">';
							img = img + files[x].name; */ 
						    /* img = img+'<img src= '+files[x].name+'"'+' width="200" height="200">';
							img = img + files[x].name; */

					 	  /*       var fileList = files;
						        
						        // 읽기
						        var reader = new FileReader();
						        reader.readAsDataURL(fileList[x]);

							
						        //로드 한 후
						     var num=   reader.onload = function  () {
						            //로컬 이미지를 보여주기
						            document.querySelector('#result').src = reader.result;
						            
						            //썸네일 이미지 생성
						            var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
						            tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
						            tempImage.onload = function() {
						                //리사이즈를 위해 캔버스 객체 생성
						                var canvas = document.createElement('canvas');
						                var canvasContext = canvas.getContext("2d");
						                
						                //캔버스 크기 설정
						                canvas.width = 50; //가로 100px
						                canvas.height = 50; //세로 100px
						                
						                //이미지를 캔버스에 그리기
						                canvasContext.drawImage(this, 0, 0, 50, 50);
						                //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
						                 var dataURI = canvas.toDataURL("image/jpeg");
						                
						                //썸네일 이미지 보여주기
						                document.querySelector('#result').src = dataURI;
						              
										$("#result1").text(dataURI);
						                //썸네일 이미지를 다운로드할 수 있도록 링크 설정
						              //  document.querySelector('#download').href = dataURI; 
						            };
						        }; 
						        
						        img = img+'<img src= '+num+'"'+' width="200" height="200">';
								img = img + files[x].name; */
    
					
					}else{
						alert(files[x].name+"  jpg,gif,png 형식의 파일만 등록가능합니다.");
						console.log(files[x].name);
					}
					

			    	//$("#result").html(img);
					
				}
				
				
			
				var ajax = new XMLHttpRequest();
				ajax.upload.addEventListener("progress",progressHandler,false);
				ajax.addEventListener("load",completHandler,false);
				ajax.addEventListener("error",errorHandler,false);
				ajax.addEventListener("abort",abortHandler,false);
				ajax.open("POST","UploadServlet");
				ajax.send(formData);
				
		
			}
			
			//drop file get state
			dropzone.ondrop = function(e){
				e.preventDefault();
				this.className = 'dropzone';
				console.log(e.dataTransfer.files);
				
			// 	 var files = e.dataTransfer.files; // Array of all files
				// var newDiv = null;
				   // for (var i=0, file; file=files[i]; i++) {
				      //  if (file.type.match(/image.*/)) {
				      /*       var reader = new FileReader();

				            reader.onload = function(e2) {
				                // finished reading file data.
				                var img = document.createElement('img');
				                img.src= e2.target.result;
				                img.style.width = "100px";
				                img.style.height = "100px";
				                
				                newDiv = document.createElement("div");
				                newDiv.innerHTML = "<h1>안녕! 반가워!</h1>";
				                
				                var div = document.createElement('div');
				            
				                newDiv.innerHTML = "filename = ";
				                document.body.appendChild(img);
				                document.body.appendChild(div);
				                document.body.appendChild(newDiv);
				                
				            }

				            reader.readAsDataURL(file); // start reading the file data.
				        }
				    }  */
				
				
				upload(e.dataTransfer.files);
				//drop after upload 
			};
			
			//dropzone dragover css
			dropzone.ondragover = function(){
				this.className= 'dropzone dragover';
				return false;
			};
			
			//dropzone dragleave css
			dropzone.ondragleave = function(){
				this.className = 'dropzone';
				return false;
			};
			
			//progress bar Hanlder
			function progressHandler(event){
				_("loaded_n_total").innerHTML = " Uploaded" + event.loaded+"bytes of"+ event.total;
				var percent = (event.loaded / event.total) / 1;
				_("progressBar").value = Math.round(percent);
				_("status").innerHTML = Math.round(percent)+ "% uploaded....please wait";
			}
			//progress complet
			function completHandler(event){
				_("progressBar").value = 0;
				_("status").innerHTML = event.target.responseText;
			}
			//progress error
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