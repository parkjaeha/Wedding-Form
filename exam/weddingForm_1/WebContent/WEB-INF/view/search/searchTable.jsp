<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<c:forEach items="${list}" var="dto">
		<div class="card">
			<img class="card-img-top" src="../image/hall/wedding_main.jpg" alt="Card image" style="width:100%">
		    <div class="card-body">
		    	<p class="card-text addr">${dto.region} / ${dto.type}</p>
		    	<h4 class="card-title name">${dto.hall_name}</h4>
		    	<div class="info">
			     	<p style="line-height: 5px;">홀 사용료 : ${dto.hall_cost}</p>
					<p style="line-height: 5px;">하객수 : ${dto.visitor}</p>
					<p style="line-height: 5px;">인근 지하철 : ${dto.subway}</p>
					<p style="line-height: 5px;">식사종류 : ${dto.meal_menu}</p>
					<p style="line-height: 5px;">식사가격 : ${dto.meal_cost}</p>
		    	</div>
		      	<a href="./searchView.search?id=${dto.id}" class="btn btn-outline-info">상세보기</a>
		    </div>
		</div>
	</c:forEach>
	
		<div class="container" style="text-align: center;">
			<button id="btn_add" class="btn btn_add">더보기</button>
		</div>
	<c:if test="${curPage != total}">
	</c:if>
</div>
