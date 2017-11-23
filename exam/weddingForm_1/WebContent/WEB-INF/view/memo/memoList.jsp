<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var check = false;
	$(function() {
		var curPage = 1;
		$("#write").click(function() {
			var name = document.getElementById("name");
			var password = document.getElementById("password");
			var contents = document.getElementById("contents");
			$.ajax({
				url: "./memoWrite.memo",
				type: "POST",
				data: {
					name: name.value,
					password: password.value,
					contents: contents.value,
					curPage: curPage
				},
				success: function(data) {
					$("#result").html(data);
					name.value = "";
					password.value = "";
					contents.value = "";
				}
			});
		});
		
		$("#add").click(function() {
			curPage++;
			$.ajax({
				url: "./memoWrite.memo",
				type: "GET",
				data: {
					curPage: curPage
				},
				success: function(data) {
					$("#result").html(data);
				}
			});
			
		});
		
		$("#result").on('click', '.deletes', function() {
			var count = $(this).val();
			check = !check;
			del(this, count);
		});
		
		
		$("#result").on('click', '.delete', function() {
			var num = $(this).val();
			var count = $(this).attr('title');
			var pw = $("#pw"+count).val();
			alert
			$.ajax({
				url: "./memoDelete.memo",
				type: "POST",
				data: {
					num: num,
					pw: pw,
					curPage: curPage
				},
				success: function(data) {
					$("#result").html(data);
				}
			});
			
		});
		
	});
	
	function del(obj, count) {
		if(check == false) {
			$("#viewContents"+count).css("display","block");
			$("#viewPassword"+count).css("display","none");
			$(obj).text("삭제");
		} else {
			$("#viewContents"+count).css("display","none");
			$("#viewPassword"+count).css("display","block");
			$(obj).text("취소");
		}
	}
</script>

<style type="text/css">
	body {
		background-color: #333;
	}

	.container {
		width: 600px;
		margin: auto;
	}
	
	.row {
		width: inherit;
		height: 30px;
		border-top: 1px dotted white;
		border-bottom: 1px dotted white;
		color: #fff;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	#add {
		display: block;
		width: 600px;
		height: 30px;
		margin: auto;
		margin-top: 10px;
		border-radius: 10px
	}
	
	.color-text {
		color: #9F9FA0;
	}	
	.col-sm-1 {
		float: left;
		width: 100px;
		height: auto;
	}
	
	.col-sm-2 {
		float: left;
		width: 430px;
		height: auto;
		word-wrap: break-word;
	}
	.col-sm-3 {
		float: left;
		width: 70px;
		height: auto;
	}
	
	.table01 {
		display: block;
		text-align: center;
		margin-top: 30px;
		
	}
	
	.table01 tr td:nth-child(odd) {
		width: 70px;
	}
	
	.table01 tr td:nth-child(even) {
		width: 180px;
	}
	
	.table01 tr td:last-child {
		width: 100px;	
	}
	
	.contents {
	    background: #666666;
	    border: 0px;
	    width: 600px;
	    height: 120px;
	    color: #FFFFFF;
	    font-size: 12pt;
	}
	input[type='text'], input[type='password'] {
		background: #666666;
		border: 0;
	}
	
	.message {
		display: none;
	}
	
</style>
</head>
<body>
<div id="result">
	<div class="container">
		<c:forEach items="${requestScope.list}" var="dto" varStatus="count">
		
			<div class="row">
				<div class="col-sm-1">${dto.name}</div>
				<div class="col-sm-2">
					<div id="viewPassword${count.count}" style="display: none;">
						
						<input type="password" id="pw${count.count}" name="pw">
						<button class="delete" value="${dto.num}" title="${count.count}">삭제</button>
					</div>
					<span id="viewContents${count.count}">${dto.contents}</span>
				</div>
				<div class="col-sm-3"><button class="deletes" value="${count.count}">삭제</button></div>
			</div>
		
		</c:forEach>
	</div>
</div>

<input type="button" id="add" value="add">

<div>
	<table class="table01 container">
		<tr>
			<td class="color-text">이름</td>
			<td><input type="text" name="name" id="name"></td>
			<td class="color-text">비번</td>
			<td><input type="password" name="password" id="password"></td>
			<td><input type="button" id="write" value="저장하기"></td>
		</tr>
		
		<tr>
			<td colspan="5">
				<textarea class="contents" name="contents" id="contents"></textarea>
			</td>
		</tr>
	</table>
</div>


</body>
</html>