<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		$(".basic").click(function() {
			var count = $(this).attr('id');
			$("#hidden"+count).slideToggle('slow');
		});
		
		$("#btn").click(function() {
			var ids = $(this).val();
			$.ajax({
				url: "./reportView.report",
				type: "POST",
				data: {
					ids: ids
				},
				success: function(data) {
					alert("success");
				}
			});
		});
	});
</script>

<title>Insert title here</title>

<style type="text/css">
	.container {
		margin-top: 40px;	
	}
	
	.title01 {
		padding: 10px;
		border-bottom: 1px solid black;
	}
	
	.pagination {
		max-width: 300px;
		margin: 0 auto;
	}
	
	.table tbody tr{
		cursor: pointer;
	}
	
	.hidden {
		padding: 5px;
		display: none;
	}
	
	.hidden div {
		padding: 5px 10px;
		width: 100%;
	}
	
	/* The Modal (background) */
	.modal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    padding-top: 100px; /* Location of the box */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	    background-color: #fefefe;
	    margin: auto;
	    padding: 20px;
	    border: 1px solid #888;
	    width: 80%;
	}
	
	/* The Close Button */
	.close {
	    color: #aaaaaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	    color: #000;
	    text-decoration: none;
	    cursor: pointer;
	}
</style>
</head>
<body>
	<div class="container">
		<h1 class="title01">블랙리스트</h1>
		<table class="table table-hover">
			<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>신청한 아이디</th>
				<th>신청한 날짜</th>
				<th>블랙리스트</th>
				<th>비고</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="dto" varStatus="count">
				<tr class="basic" id="${count.count}">
					<td>${dto.num}</td>
					<td>${dto.title}</td>
					<td>${dto.id}</td>
					<td>${dto.reg_date}</td>
					<td>${dto.company_name}</td>
					<td><button id="btn" value="${dto.id}/${dto.company_name}">상세보기</button></td>
				</tr>
				
				<tr id="hidden${count.count}" class="hidden">
					<td colspan="6">
						<label for="contents">문의내용:</label>
						<div id="contents">${dto.contents}</div>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="container">
		<ul class="pagination">
			<c:if test="${page.curBlock > 1}">
				<li class="page-item"><a class="page-link" href="./reportList.report?curPage=${page.getStartNum()-1}">[이전]</a></li>
			</c:if>
			
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li class="page-item"><a class="page-link" href="./reportList.report?curPage=${i}">${i}</a></li>
			</c:forEach>
			
			<c:if test="${page.curBlock < page.totalBlock}">
				<li class="page-item"><a class="page-link" href="./reportList.report?curPage=${page.lastNum+1}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	
	
	<!-- The Modal -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<div id="result"></div>
		</div>
	</div>
	
	<script>
	var modal = document.getElementById('myModal');
	var btn = document.getElementById("btn");
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks the button, open the modal 
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	</script>
	
	
</body>
</html>