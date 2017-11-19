<!doctype html>
<html>
<head>
<title>Proper Title</title>
<style>
    #selectedFiles img {
        max-width: 200px;
        max-height: 200px;
        float: left;
        margin-bottom:10px;
    }
</style>

<link rel="stylesheet" href="./css/global.css">
</head>
    
<body>
    
    <form id="myForm" method="post">

       <!--  Files: <input type="file" id="files" name="files" multiple><br/> -->
	<div class="dropzone" id="dropzone"> Drop Files here to upload</div>
	
        <div id="selectedFiles"></div>

        <input type="submit">
    </form>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    
    <script>
    var selDiv = "";
    var storedFiles = [];
    var count =0;

    $(document).ready(function() {
       // $("#files").on("change", handleFileSelect);
      //  $("#dropzone").on("change", handleFileSelect);
         
        selDiv = $("#selectedFiles"); 
        $("#myForm").on("submit", handleForm);
        
        $("body").on("click", ".selFile", removeFile);
        
        
        
    });
    
    
   /*  //파일 선택시 
    function handleFileSelect(e) {
        console.log("hello " + e.target.files);
        
        var files = e.target.files;
   		console.log("files : " + files);		//list
        var filesArr = Array.prototype.slice.call(files);
        console.log("arr : " + filesArr);		//file
    	console.log(" cehck: " + Array.prototype.slice.call(files));
    
    	console.log("arr"+ filesArr);
        filesArr.forEach(function(f) {          

            if(!f.type.match("image.*")) {
				alert("img 파일만 업로드만 가능 ");
            	return;
            }
            console.log("f: "+f);
            storedFiles.push(f);
            
            var reader = new FileReader();
            reader.onload = function (e) {
                var html = "<div><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selFile' title='Click to remove'>" + f.name + "<br clear=\"left\"/></div>";
                selDiv.append(html);
                console.log("files name : "+f.name);
            }
            reader.readAsDataURL(f); 
        });
    } */
        
        //upload
    function handleForm(e) {
        e.preventDefault();
        var data = new FormData();
        
        for(var i=0, len=storedFiles.length; i<len; i++) {
        	console.log("name: "+storedFiles[i].name + " size: "+storedFiles[i].size);
            data.append('files[]', storedFiles[i]); 
        }
    
    	var ajax = new XMLHttpRequest();
	/* 	ajax.upload.addEventListener("progress",progressHandler,false);
		ajax.addEventListener("load",completHandler,false);
		ajax.addEventListener("error",errorHandler,false);
		ajax.addEventListener("abort",abortHandler,false); */
		ajax.open("POST","UploadServlet");
		ajax.send(data);	
        
    /*     var xhr = new XMLHttpRequest();
        xhr.open('POST', 'handler.cfm', true);
        
        xhr.onload = function(e) {
            if(this.status == 200) {
                console.log(e.currentTarget.responseText);
                alert(e.currentTarget.responseText + ' items uploaded.');
            }
        }
        
        xhr.send(data); */
    }
        
    function removeFile(e) {
        var file = $(this).data("file");
        for(var i=0;i<storedFiles.length;i++) {
            if(storedFiles[i].name === file) {
                storedFiles.splice(i,1);
                break;
            }
        }
        $(this).parent().remove();
    }
    

	
			var dropzone = document.getElementById('dropzone');

			
/* 		        $("#myForm").on("submit", handleForm);
		        
		        $("body").on("click", ".selFile", removeFile);
 */			
			//drop file get state
			dropzone.ondrop = function(e){
				var files = e.target.files || e.dataTransfer.files;
				e.preventDefault();
				this.className = 'dropzone';

		       
		   		console.log("files : " + files);		//list
		        var filesArr = Array.prototype.slice.call(files);
		        console.log("arr : " + filesArr);		//file
		        
		        filesArr.forEach(function(f) {          

		            if(!f.type.match("image.*")) {
						alert("img 파일만 업로드만 가능 ");
		            	return;
		            }
		            console.log("f: "+f);
		            storedFiles.push(f);
		            
		            var reader = new FileReader();
		            reader.onload = function (e) {
		                var html = "<div><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selFile' title='Click to remove'>" + f.name + "<input type='radio' id='" +count+ "' name='radio' value='"+count+"'>"+"<br clear=\"left\"/></div>";
		                selDiv.append(html);
		                console.log("files name : "+f.name + " 		type : " + f.type  + " 		size : " + f.size  +" count: " + count);
		                count++;
		            }
		            reader.readAsDataURL(f); 
		        });
		        
		        
			};

			//console.log(e.dataTransfer.files +" data: " + files);	
			/* 	var a = $('input#fileselect.addFile');
			    a[a.length-1].files = file; */
				
			    //$("#myForm").on("click", handleForm(e));
		    	//upload(e.dataTransfer.files);
				//drop after upload 
			
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
			
		/*  	//progress bar Hanlder
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
 */
 

 
    
    </script>

</body>
</html>