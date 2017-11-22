<!doctype html>
<html>
<head>
<title>Proper Title</title>

<link rel="stylesheet" href="./css/global.css">
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
     

<style>
	.container {
		max-width: 630px;
		margin: auto;
	}
	
	.btn_submit {
		width: 600px;
	}

    #selectedFiles img {
        max-width: 50px;
        max-height: 50px;
    }
    
	#sortable-9 {
		display: none;
	}
	
	#show img {
		margin: 6px;
	}
	
	.default {
		
	}
</style>

 

</head>
    
<body>
    <div class="container">
	    <form id="myForm" method="post">
	       <!--  Files: <input type="file" id="files" name="files" multiple><br/> -->
			<div class="dropzone" id="dropzone" style="width: 600px; height: 300px;"> Drop Files here to upload !non duple!</div>
	        	<input type="submit" class="btn btn_submit">
	    </form>
    </div>
    
    <div class="container">
	    <ul id = "sortable-8" class="list-group"></ul>
		<span id = "sortable-9"></span>
	</div>
	
	
    <div class="container">
    	<div style="text-align: center;">
			<i class="click fa fa-angle-double-down" style="font-size:42px"></i>
    	</div>
		<div id="show"></div>
    </div>

    <script>
    var selDiv = "";
    var storedFiles = [];
    var listFiles = [];
    var count =0;
    var html;
    var temp = [];
    var index=[];
    var result = [];
    var flist = [];
    var productOrder;
    $(document).ready(function() {
    	
        selDiv = $("#sortable-8"); 
        $("#myForm").on("submit", handleForm);  
        $("body").on("click", ".selFile", removeFile);
    });

    $(function() {
    	
    	$(".click").on("click",function(){ 
    		
    		$.get("./function/functionUploadView.function?",function(data){
    			$("#show").html(data);
    			
    		});		
    	});
    	
        $('#sortable-8').sortable({
           update: function(event, ui) {
               productOrder = $(this).sortable('toArray').toString();
              $("#sortable-9").text (productOrder);
             console.log("ui index: " + ui.item.index());
             console.log("index num: " + productOrder); 
             
             $("li").find('img').each(function(){
        		 $(this).attr('value');
        		 console.log("  img: "+ $(this).attr('data-value'));
        		 console.log("  img: "+ $(this).attr('data-size'));
        		 console.log("  img file: "+ $(this).attr('data-file'));
        		 
        		 });
             
           },
        start: function(event, ui) {
            ui.item.startPos = ui.item.index();
        },
        stop: function(event, ui) {
            console.log("Start position: " + ui.item.startPos);
            console.log("end position: " + ui.item.index());
      
            var startposition = ui.item.startPos;
            var endposition = ui.item.index();
        /*     for(var i=0; i<storedFiles.length; i++){
         	   console.log("storedFiles before : " + storedFiles[i].name + " / " + storedFiles.length);
            }
             */
         /* temp = storedFiles[endposition];
            storedFiles[endposition] = storedFiles[startposition];
            console.log("result: " + (endposition-1));
          
           for(var i=0; i<(endposition-1); i++){
        	   storedFiles[i] =  storedFiles[i+1];
        	   console.log(i+" ë² " + endposition);
            }
           storedFiles[(endposition-1)] = temp;
           for(var i=0; i<storedFiles.length; i++){
        	   console.log("storedFiles after : "+storedFiles[i].name + " / " + storedFiles.length);
           } */
           
           for(var i=0; i<listFiles.length; i++){
         	   console.log("listFiles before : " + listFiles[i].name + " / " + listFiles.length + " / " + listFiles[i].count);		        
        	}
           
         	
           if(startposition < endposition){
           temp = listFiles[endposition];
           listFiles[endposition] = listFiles[startposition];
           console.log("result: " + (endposition-1));
           console.log("temp : " + temp.name + "/ " + temp.count);
          for(var i=startposition; i<endposition; i++){
        	  if((endposition-1) == i){
                  listFiles[i] = temp;
        	  }else{
        	  listFiles[i] =  listFiles[i+1];
        	  }
       	   console.log(i+" ë² " + endposition);
           	}
          }else if(startposition > endposition){
        	   temp = listFiles[startposition];
        	  for(var i=startposition; i>=endposition; i--){
            	  if(endposition == i){
                      listFiles[i] = temp;
            	  }else{
            	  listFiles[i] =  listFiles[i-1];
            	  }
           	   console.log(i+" ë² " + endposition);
               	}
          }
//          listFiles[(endposition-1)] = temp;
          
          for(var i=0; i<listFiles.length; i++){
        	   console.log("listFiles after : " + listFiles[i].name + " / " + listFiles.length + " / " + listFiles[i].count);		        
       	}
         
        }
        });
     });
        
        //upload
    function handleForm(e) {
        e.preventDefault();
        var data = new FormData();
        console.log("object Type : "+listFiles);
        
        
        for(var i=0; i< listFiles.length; i++) {
        	console.log("name : "+listFiles[i].name + " size : "+listFiles[i].size + " count : " + listFiles[i].count +" type : " + listFiles[i].type);
            data.append('files[]', listFiles[i]); 
        }
   
        
    /*     $.ajax({
            url: "./function/functionUploadView.function",
            type: "POST",
            data: {
            		data : data,
            		index : productOrder
            },
            success: function(data) {
               while(data[index] != null) {
                  if($("#subway01").val().trim() == data[index].line.trim()) {
                     $("#subway02").append("<option value='"+data[index].subway+"'>"+data[index].subway+"</option>");
                  }
                  index++;
               }
            }
         }); */
        
     	var ajax = new XMLHttpRequest();
		ajax.open("POST","./function/functionUploadView.function");
		ajax.send(data); 

    }
        
    function removeFile(e) {
        var file = $(this).data("file");
        for(var i=0;i<listFiles.length;i++) {
            if(listFiles[i].name === file) {
            	listFiles.splice(i,1);
                break;
            }
        }
        $(this).parent().remove();
    }
    
			var dropzone = document.getElementById('dropzone');
		
			//drop file get state
			dropzone.ondrop = function(e){
				
				console.log(e.dataTransfer.files);
				//var num = 0;
				var files = e.target.files || e.dataTransfer.files;
				e.preventDefault();
				this.className = 'dropzone';
   
		   		console.log("files : " + files);		//list
		        var filesArr = Array.prototype.slice.call(files);
		        console.log("arr : " + filesArr);		//file
		        
		        filesArr.forEach(function(f) {          

		            if(!f.type.match("image.*")) {
						alert("img");
		            	return;
		            }
		             
		            console.log("f: "+f);
		            storedFiles.push(f);
		            
		            var reader = new FileReader();
		            reader.onload = function (e) {
		                html =  "<li id = '"+count+"' class ='default list-group-item'><img src=\"" + e.target.result +  "\" data-size=\""+f.size+"\"" +  "\" data-file=\""+f.name+"\" data-value='"+count+"' class='selFile' title='Click to remove' width='50px;' height='25px';>" + f.name + "<br clear=\"left\"/></li>";
		                selDiv.append(html);
		                console.log("files name : "+f.name + " 		type : " + f.type  + " 		size : " + f.size  +" count: " + count);
		                //listFiles.push({name:f.name,type:f.type,size:f.size,count:count,lastModified:f.lastModifiedDate,lastModifiedDate:f.lastModifiedDate.toLocaleDateString()});
		                listFiles.push(f);
		                console.log("list type: "+listFiles);
		                
		                //result.push([""], f.name , {type: f.type, lastModified: f.lastModifiedDate ,lastModifiedDate:f.lastModifiedDate.toLocaleDateString(), count: count});
		              //result.push('<li><strong>',escape(f.name),'</strong>(',f.type || 'n/a',')-',f.size,'bytes,last modified:',f.lastModifiedDate ?f.lastModifiedDate.toLocaleDateString() :'n/a','</li>');
		              //console.log("result type: "+result);
		  		         count++;
		            }
		            reader.readAsDataURL(f); 
		            
		        });
		        
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

    </script>

</body>
</html>