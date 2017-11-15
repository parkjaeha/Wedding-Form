<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>Insert title here</title>

<script type="text/javascript">
	$(function() {
		$(".confirm").click(function() {
			var num = $(this).attr('title');
			$("#frm"+num).attr("action", "reservationCompanyInsert.reservation");
			$("#frm"+num).submit();
		});
		
		$(".cancel").click(function() {
			var num = $(this).attr('title');
			$("#frm"+num).attr("action", "reservationCompanyDelete.reservation");
			$("#frm"+num).submit();
		});
	});	
	
</script>

<style type="text/css">
.container {
	max-width: 1000px;
	margin: auto;
}

.columns {
    float: left;
    width: 30%;
    padding: 8px;
}

.reserv {
    list-style-type: none;
    border: 1px solid #eee;
    margin: 0;
    padding: 0;
    -webkit-transition: 0.3s;
    transition: 0.3s;
}

.reserv:hover {
    box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}

.reserv .header {
    background-color: black;
    color: white;
    font-size: 25px;
}

.reserv li {
    border-bottom: 1px solid #eee;
    padding: 20px;
    text-align: center;
}

.reserv .grey {
    background-color: #F5F5F5;
    font-size: 20px;
}


.button {
    background-color: #a9a9a9;
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    font-size: 18px;
}

.confirm  {
	background-color: #2096BA;
}

@media only screen and (max-width: 600px) {
    .columns {
        width: 100%;
    }
}
</style>

</head>
<body>
	<div class="container">
		<c:forEach items="${reservMember}" var="dto" varStatus="count">
			<form id="frm${count.count}" action="reservationCompanyInsert.reservation" method="POST">
				<input type="hidden" name="id" value="${dto.id}">
				<input type="hidden" name="company_id" value="${dto.company_id}">
				<input type="hidden" name="hall_name" value="${dto.hall_name}">
				<input type="hidden" name="female" value="${dto.female}">
				<input type="hidden" name="male" value="${dto.male}">
				<input type="hidden" name="reserv_date" value="${dto.reserv_date}">
				<input type="hidden" name="reserv_time" value="${dto.reserv_time}">
				<input type="hidden" name="contents" value="${dto.contents}">
				<div class="columns">
					<ul class="reserv">
						<li class="header">ID: ${dto.id}</li>
						<li class="grey">${dto.female } <i class="material-icons"> favorite</i> ${dto.male}</li>
						<li>웨딩홀 : ${dto.hall_name}</li>
						<li>예약 날짜 : ${dto.reserv_date}</li>
						<li>예약 시간 : ${dto.reserv_time}</li>
						<li>문의내용 : ${dto.contents}</li>
						<li>
							<c:if test="${dto.confirm eq 'false' }">
								<button type="button" class="button confirm" title="${count.count}">예약 확인</button>
							</c:if>
							<c:if test="${dto.confirm eq 'true' }">
								<button type="button" class="button cancel" title="${count.count}">예약 취소</button>
							</c:if>
						</li>
					</ul>
				</div>
			</form>
		</c:forEach>
	</div>
	
</body>
</html>