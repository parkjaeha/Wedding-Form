<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
				
				<table class="table">
			<tr>
			<td colspan="1" style="text-align: center;">
					id
					</td>
				<td colspan="12" style="text-align: center;">
					title
					</td>
					
					<td colspan="1" style="text-align: right; margin-right: 10px;">
					date
				</td>
				<td><a href="#" class="add" data-value="" ><img  src = "./image/cancel.png"/></a> |</td>
			</tr>
		
		<tr>
		
   <c:forEach items="${requestScope.list}" var="dto">
            <tr><td><c:out value="${dto.id}"></c:out></td>
            <td><c:out value="${dto.title}"></c:out></td>
            <td colspan="1" style="text-align: right; margin-right: 10px;">
			<a href="#" class="update" data-value="${dto.id}" ><img  src = "./image/cancel.png"/></a> |
			<a href="#" class="delete" data-value="${dto.id}" ><img  src = "./image/cancel.png"/></a>
  			</td>
        </c:forEach>
		
			</tr>
			
		</table>
			
			