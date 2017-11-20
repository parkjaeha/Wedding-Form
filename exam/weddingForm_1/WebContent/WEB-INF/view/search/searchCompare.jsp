<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
input[type=checkbox] { display: none; }
input[type=checkbox] + label {
    display: inline-block;
    cursor: pointer;
    line-height: 30px;
    padding-left: 30px;
    background: url('../image/checkbox/circle_3.png') left/20px no-repeat ;
}
input[type=checkbox]:checked + label { 
    background-image: url('../image/checkbox/circle_2.png');
}

/* Style the tab */
div.tab {
    overflow: hidden;
    border: 1px solid #2096BA;
    background-color: #2096BA;
}

/* Style the buttons inside the tab */
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
    color: #fff;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: lightblue;
    border-color: lightblue;
}

/* Create an active/current tablink class */
div.tab button.active {
    background-color: lightblue;
    border-color: lightblue;
}

/* Style the tab content */
.tabcontent {
    display: none;
    height: 700px;
    padding: 6px 12px;
    border: 1px solid #2096BA;
    border-top: none;
    overflow: auto;
}

.contents {
	margin-top: 10px;
}

#searchInput {
  background-image: url('../image/common/searchicon.gif');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#weddingTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#weddingTable th, #weddingTable td {
  text-align: left;
  padding: 12px;
  border: 1px solid #ddd;
}


#weddingTable td:first-child, #weddingTable th:first-child {
	text-align: center;
}

#weddingTable tr {
  border-bottom: 1px solid #ddd;
}

#weddingTable tr.header, #myTable tr:hover {
  background-color: lightblue;
  color: #fff;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	
	$("#tab_compare").click(function() {
		var compare = [];
		$("input:checkbox[name='compare']:checked").each(function(index) {
			compare.push($(this).val());
		});
		
		while(compare.length > 5) {
			compare.pop();
			if(compare.length == 5) {
				alert("5개까지 비교할 수 있습니다.");
			}
		}
		
		var Data = {"compare" : compare};
		$.ajax({
			type : "post",
			url : "./searchCompareResult.search",
			data : Data,
			success : function(data) {
				$("#result").html(data);
			}
		});
		
	});
	
});

function openTab(evt, openName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(openName).style.display = "block";
    evt.currentTarget.className += " active";
}

function searchFunction() {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("searchInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("weddingTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
}
	
function searchRegion() {
	var sido, gungu, filter, table, tr, td, i;
	
	sido = document.getElementById("sido");
	gungu = document.getElementById("gungu");
	filter = (sido.value + " " + gungu.value).toUpperCase().trim();
	table = document.getElementById("weddingTable");
	tr = table.getElementsByTagName("tr");
	for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[2];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
}

</script>

</head>
<body>
	<div class="tab">
	  <button class="tablinks" onclick="openTab(event, 'list')">LIST</button>
	  <button class="tablinks" onclick="openTab(event, 'compare')" id="tab_compare">COMPARE</button>
	</div>
	
	<div id="list" class="tabcontent">
		<div class="contents">
			<label for="sido">인근 지역</label>
			<select id="sido" onchange="searchRegion()">
				<option value="region">REGION</option>
			</select>
			<select id="gungu" onchange="searchRegion()">
				<option value=" "></option>
				<option value="01">01</option>
				<option value="02">02</option>
				<option value="03">03</option>
				<option value="04">04</option>
				<option value="05">05</option>
				<option value="06">06</option>
				<option value="07">07</option>
				<option value="08">08</option>
			</select>
		</div>
		
		<div class="contents">
			<input type="text" id="searchInput" onkeyup="searchFunction()" placeholder="Search for wedding halls">
		</div>
		
		<table id="weddingTable">
		<tr class="header">
		    <th style="width:10%;">비교</th>
		    <th style="width:50%;">웨딩홀 이름</th>
		    <th style="width:40%;">웨딩홀 지역</th>
		</tr>
		
		<c:forEach items="${list}" var="dto" varStatus="count">
			<tr>
				<td><input type="checkbox" id="c${count.count}" name="compare" value="${dto.id}"><label for="c${count.count}">&nbsp;</label></td>
				<td>${dto.hall_name}</td>
				<td>${dto.region}</td>
			</tr>
		</c:forEach>
		
		</table>
	</div>
	
	<div id="compare" class="tabcontent">
		<div id="result"></div>
	</div>
</body>
</html>