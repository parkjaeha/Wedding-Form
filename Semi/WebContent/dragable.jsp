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
        max-width: 100px;
        max-height: 50px;
        float: left;
        margin-bottom:10px;
    }
    
      #sortable-8{ list-style-type: none; margin: 0; 
            padding: 0; width: 15%; float:left;}
         #sortable-8 > li{ margin: 0 3px 3px 3px; padding: 0.4em; 
            padding-left: 1.5em; font-size: 17px; height: 50px; }
         .default {
            
            border: 1px solid #DDDDDD;
            color: #333333;
         }
</style>

 

</head>
    
<body>
    
    <form id="myForm" method="post">

       <!--  Files: <input type="file" id="files" name="files" multiple><br/> -->
	<div class="dropzone" id="dropzone"> Drop Files here to upload !non duple!</div>
	
	      <ul id = "sortable-8" >
   
		</ul>
        <input type="submit">
    </form>

 <br>
      <h3><span id = "sortable-9" style="border: 1px solid black; width:100px; height:100px; margin-left: 100px;"></span></h3>
      
  <br><br>
  <br><br>
      
      <div class="click">click</div>
      <div id="show" style="border: 1px solid black; width:600px; height:600px; margin-top:80px;"></div>

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
    var listsize =0;
    $(document).ready(function() {
    	
    	$.get("./function/functionUploadView.function?type=count",function(data){
			console.log("size: "+data);
			listsize=data;
			//alert(listsize);
		});	
    	
        selDiv = $("#sortable-8");
        $("#myForm").on("submit", handleForm); 
        $("body").on("click", ".selFile", removeFile);
    });

    $(function() {
    	
    	 $(".click").on("click",function(){ 
    		
    		$.get("./function/functionUploadView.function?type=list",function(data){
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
   
        

        
     	var ajax = new XMLHttpRequest();
		ajax.open("POST","./function/functionUploadView.function");
		ajax.send(data); 
		
	
	        for(var i=0;i<listFiles.length;i++) {
	         
	            	listFiles.splice(i,listFiles.length);
	        }
	        $(".default").parent().remove();
	   

	        $.get("./function/functionUploadView.function?",function(data){
    			$("#show").html(data);	
    		});	
	        
	    /* 	$("#show").on("click",function(){
	    		//var id = $(this).getAttribute('id');
	    		//console.log("delete id : " + id);
	    		alert("delete");
	    		$.get("./function/functionUploadDelete.function?num="+id,function(data){
	    			if(data.trim() == "OK"){
	    				alert("delete complite");
	    			}
	    			id.hidden();
	    		}); 
	    	}); */
	        
	        
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
				
				console.log("size : "+listsize);
				
				
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
						alert("img 파일만 업로드만 가능 ");
		            	return;
		            }
		             
		            console.log("f: "+f);
		            storedFiles.push(f);
		            
		            var reader = new FileReader();
		            reader.onload = function (e) {
		                 html =  "<li id = '"+count+"' class ='default'><img src=\"" + e.target.result +  "\" data-size=\""+f.size+"\"" +  "\" data-file=\""+f.name+"\" data-value='"+count+"' class='selFile' title='Click to remove' width='100px;' height='50px';>" + "<br clear=\"left\"/></li>";
		                selDiv.append(html);
		                console.log("files name : "+f.name + " 		type : " + f.type  + " 		size : " + f.size  +" count: " + count);
		                //listFiles.push({name:f.name,type:f.type,size:f.size,count:count,lastModified:f.lastModifiedDate,lastModifiedDate:f.lastModifiedDate.toLocaleDateString()});
		                listFiles.push(f);
		                for(var i=0; i<listFiles.length;i++){
		                	if(listFiles[i].name === f.name){
		                		listFiles[i].name = count+"_"+f.name;
		                		console.log("come in");
		                	}
		      				console.log("test : "+listFiles[i].name + " // " + f.name);
		                }
		                
		                console.log("list type: "+listFiles);
		                
		                
		                console.log("list name: "+listFiles[count].name);
		                
		                //result.push([""], f.name , {type: f.type, lastModified: f.lastModifiedDate ,lastModifiedDate:f.lastModifiedDate.toLocaleDateString(), count: count});
		              //result.push('<li><strong>',escape(f.name),'</strong>(',f.type || 'n/a',')-',f.size,'bytes,last modified:',f.lastModifiedDate ?f.lastModifiedDate.toLocaleDateString() :'n/a','</li>');
		              //console.log("result type: "+result);
		  		         count++;
		            }
		            reader.readAsDataURL(f); 
		            
		        });
		        
		        /* if(listsize <11){
		        	
				}else{
					alert("listsize : "+listsize +" 10개 이하로 등록가능합니다.");
				} */
		        
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