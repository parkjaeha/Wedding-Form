<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
				<table class="table">
		
			<tr>
			<td colspan="1" style="text-align: center;">
					NUM
					</td>
				<td colspan="12" style="text-align: center;">
					CONTENT
					</td>
					
					<td colspan="1" style="text-align: right; margin-right: 10px;">
					option
				</td>
				
			</tr>
		
		<tr>
		
		
		<c:forEach items="${requestScope.list}" var="dto">
		
		<tr>
			<td colspan="1" style="text-align: center;">${dto.num}</td>
			<td colspan="12" style="text-align: center;">${dto.data}</td>
			<td colspan="1" style="text-align: right; margin-right: 10px;"> <a href="#" class="update" data-value="${dto.num}" ><img  src = "../image/cancel.png"/></a> |
			<a href="#" class="delete" data-value="${dto.num}" ><img  src = "../image/cancel.png"/></a>
			</td>

		</tr>
		</c:forEach>
			
			</tr>
			
		</table>
			
			