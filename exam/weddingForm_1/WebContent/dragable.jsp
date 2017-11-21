<!doctype html>
<html>
<head>
<title>Proper Title</title>

<link rel="stylesheet" href="./css/global.css">
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
     

<style>
    #selectedFiles img {
        max-width: 50px;
        max-height: 50px;
        float: left;
        margin-bottom:10px;
    }
    
      #sortable-8{ list-style-type: none; margin: 0; 
            padding: 0; width: 25%; float:left;}
         #sortable-8 > li{ margin: 0 3px 3px 3px; padding: 0.4em; 
            padding-left: 1.5em; font-size: 17px; height: 16px; }
         .default {
            background: #cedc98;
            border: 1px solid #DDDDDD;
            color: #333333;
         }
</style>

 

</head>
    
<body>
    
    <form id="myForm" method="post">

       <!--  Files: <input type="file" id="files" name="files" multiple><br/> -->
	<div class="dropzone" id="dropzone"> Drop Files here to upload !non duple!</div>
	
	      <ul id = "sortable-8">
   
		</ul>
        <input type="submit">
    </form>

 <br>
      <h3><span id = "sortable-9"></span></h3>
      
  <br><br>
  <br><br>
      
      <div class="click">click</div>
      <div id="show"></div>

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
        	   console.log(i+" 번 " + endposition);
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
       	   console.log(i+" 번 " + endposition);
           	}
          }else if(startposition > endposition){
        	   temp = listFiles[startposition];
        	  for(var i=startposition; i>=endposition; i--){
            	  if(endposition == i){
                      listFiles[i] = temp;
            	  }else{
            	  listFiles[i] =  listFiles[i-1];
            	  }
           	   console.log(i+" 번 " + endposition);
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
		                html =  "<li id = '"+count+"' class ='default'><img src=\"" + e.target.result +  "\" data-size=\""+f.size+"\"" +  "\" data-file=\""+f.name+"\" data-value='"+count+"' class='selFile' title='Click to remove' width='50px;' height='25px';>" + f.name + "<br clear=\"left\"/></li>";
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