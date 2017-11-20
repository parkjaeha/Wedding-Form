<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>비교 개수 :
	<c:if test="${compare.size() > 0 }">
		${compare.size()}
	</c:if>
	<c:if test="${compare eq null}">
		0
	</c:if> 
</h3>
<table id="weddingTable">
	<tr class="header">
		<th style="width: 20%"></th>
		<c:forEach items="${compare}" var="dto">
		<th>${dto.hall_name}</th>
		</c:forEach>
	</tr>
	
	<tr>
		<th>인근 지역</th>
		<c:forEach items="${compare}" var="dto"> 
		<td>${dto.region}</td>
		</c:forEach>			
	</tr>
	
	<tr>
		<th>인근 지하철</th>
		<c:forEach items="${compare}" var="dto">
		<td>${dto.subway}</td>
		</c:forEach>			
	</tr>
	
	<tr>
		<th>식사 메뉴</th>
		<c:forEach items="${compare}" var="dto">
		<td>${dto.meal_menu}</td>
		</c:forEach>			
	</tr>
	
	<tr>
		<th>식사 가격</th>
		<c:forEach items="${compare}" var="dto">
		<td>${dto.meal_cost}</td>
		</c:forEach>			
	</tr>
	
	<tr>
		<th>하객수</th>
		<c:forEach items="${compare}" var="dto"> 
		<td>${dto.visitor}</td>
		</c:forEach>			
	</tr>
	
	<tr>
		<th>총 가격</th>
		<c:forEach items="${compare}" var="dto"> 
		<td>${dto.hall_cost}</td>
		</c:forEach>			
	</tr>
</table>