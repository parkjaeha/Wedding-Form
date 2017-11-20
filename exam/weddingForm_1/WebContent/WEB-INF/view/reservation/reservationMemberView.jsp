<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
	.container {
		margin-top: 40px;	
	}
	
	.title01 {
		padding: 10px;
		border-bottom: 1px solid black;
	}
	
	.table tr:first-child {
		background-color: #f2f2f2;
	}
</style>

</head>
<body>
	<div class="container">
		<h3 class="title01">내가 주문한 청첩장 보기</h3>
		<table class="table">
			<tr>
				<td>준비중입니다.</td>
			</tr>	
		</table>
	</div>

	<div class="container">
		<h3 class="title01">내가 예약한 웨딩홀 보기</h3>
		<table class="table">
			<tr>
				<td>신랑신부</td>
				<td>웨딩홀</td>
				<td>예약 날짜</td>
				<td>예약 시간</td>
				<td>예약 확인</td>
			</tr>
			
			<c:if test="${view != null}">
				<tr>
					<td>${view.male} <i class="material-icons"> favorite</i> ${view.female}</td>
					<td><a href="../search/searchView.search?id=${view.company_id}">${view.hall_name}</a></td>
					<td>${view.reserv_date}</td>
					<td>${view.reserv_time}</td>
					<td>
						<c:if test="${view.confirm eq 'true'}">
							<a href="./reservationView.reservation?id=${view.company_id}">예약 완료</a>
						</c:if>
						<c:if test="${view.confirm eq 'false'}">
							예약 확인중...
						</c:if>
					</td>
				</tr>
			</c:if>
			
			<c:if test="${view == null }">
				<tr>
					<td colspan="5"><a href="../search/searchMain.search">웨딩홀 예약하러 가기</a></td>
				</tr>
			</c:if>
		</table>
	</div>
</body>
</html>