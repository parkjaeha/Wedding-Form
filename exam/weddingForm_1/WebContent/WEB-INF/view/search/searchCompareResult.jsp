<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${compare[0] == null }">
	<h1>비교할 웨딩홀이 없습니다.</h1>
	<p>(LIST에서 웨딩홀을 골라주세요.)</p>
</c:if>
<c:if test="${compare[0] != null}">
	<table id="weddingTable">
		<tr class="header">
			<th></th>
			<c:forEach items="${compare}" var="dto">
			<th>${dto.hall_name}</th>
			</c:forEach>
		</tr>
		
		<tr>
			<th>인근 지역</th>
			<c:forEach items="${compare}" var="dto"> 
			<th>${dto.region}</th>
			</c:forEach>			
		</tr>
		
		<tr>
			<th>인근 지하철</th>
			<c:forEach items="${compare}" var="dto">
			<th>${dto.subway}</th>
			</c:forEach>			
		</tr>
		
		<tr>
			<th>식사 메뉴</th>
			<c:forEach items="${compare}" var="dto">
			<th>${dto.meal_menu}</th>
			</c:forEach>			
		</tr>
		
		<tr>
			<th>식사 가격</th>
			<c:forEach items="${compare}" var="dto">
			<th>${dto.meal_cost}</th>
			</c:forEach>			
		</tr>
		
		<tr>
			<th>하객수</th>
			<c:forEach items="${compare}" var="dto"> 
			<th>${dto.visitor}</th>
			</c:forEach>			
		</tr>
		
		<tr>
			<th>총 가격</th>
			<c:forEach items="${compare}" var="dto"> 
			<th>${dto.hall_cost}</th>
			</c:forEach>			
		</tr>
	</table>
</c:if>