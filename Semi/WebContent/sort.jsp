<!DOCTYPE html>
<html>
   <head>
      <title>jQuery UI Sortable - Example</title>
      <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      
      <style>
         #sortable-8{ list-style-type: none; margin: 0; 
            padding: 0; width: 25%; float:left;}
         #sortable-8 li{ margin: 0 3px 3px 3px; padding: 0.4em; 
            padding-left: 1.5em; font-size: 17px; height: 16px; }
         .default {
            background: #cedc98;
            border: 1px solid #DDDDDD;
            color: #333333;
         }
      </style>
      
      <script>
         $(function() {
            $('#sortable-8').sortable({
               update: function(event, ui) {
                  var productOrder = $(this).sortable('toArray').toString();
                  $("#sortable-9").text (productOrder);
               }
            });
         });
      </script>
   </head>
   
   <body>
      <ul id = "sortable-8">
         <li id = "1" class = "default">Product 1</li>
         <li id = "2" class = "default">Product 2</li>
         <li id = "3" class = "default">Product 3</li>
         <li id = "4" class = "default">Product 4</li>
      </ul>
      <br>
      <h3><span id = "sortable-9"></span></h3>
   </body>
</html>