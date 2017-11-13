<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<table class="table">
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><img class="card-img-top" src="../image/hall/wedding_main.jpg" alt="Card image" style="width:50%; height: 70%"></td>
				<td>
					<h3 class="card-title name" style="margin-top: 40px">
						<a href="./searchView.search?id=${dto.id}">${dto.hall_name}</a>	
					</h3>
				</td>
				<td>
					<div class="info" style="margin-top: 10px">
			     	<p style="line-height: 9px;">홀 사용료 : ${dto.hall_cost}</p>
					<p style="line-height: 9px;">하객수 : ${dto.visitor}</p>
					<p style="line-height: 9px;">인근 지하철 : ${dto.subway}</p>
					<p style="line-height: 9px;">식사종류 : ${dto.meal_menu}</p>
					<p style="line-height: 9px;">식사가격 : ${dto.meal_cost}</p>
		    	</div>
				</td>				
			</tr>
		</c:forEach>
	</table>
	
	<c:if test="${curPage != total}">
		<div class="container" style="text-align: center;">
			<button id="btn_add" class="btn btn_add">더보기</button>
		</div>
	</c:if>
</div>