<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<c:if test="${addview eq false}">	
	
	<table class="table">
		<tr>
			<td colspan="1" style="text-align: center;">
					<input  type="hidden" id="id" value="${requestScope.view.id}" >
			</td>			
			<td colspan="12" style="text-align: center;">
			title - <input type="text" id="title" value="${requestScope.view.title}">
			</td>
		</tr>

		<tr>
            <td colspan="1" style="text-align: right; margin-right: 10px;">
					<textarea id="contents" rows="4" cols="50">${requestScope.view.contents}</textarea>
			</td>
			
			<td>
				<input  type="hidden" id="date_start" value="${requestScope.view.date_start}">
					<input  type="hidden" id="date_end" value="${requestScope.view.date_end}">
						<input  type="hidden" id="url" value="${requestScope.view.url}">
							<input  type="hidden" id="className" value="${requestScope.view.className}">
								<input  type="hidden" id="editable" value="${requestScope.view.editable}">
			</td>
		</tr>
	</table>	
					<button id="update_btn" >수정</button>
</c:if>

<c:if test="${addview eq true}">

<table class="table">
		<tr>
			<td colspan="1" style="text-align: center;">
			
			</td>			
			<td colspan="12" style="text-align: center;">
			title - <input type="text" id="title" placeholder="title을 입력해주세요.">
			</td>
		</tr>

		<tr>
            <td colspan="1" style="text-align: right; margin-right: 10px;">
					<textarea id="contents" rows="4" cols="50" style="width: 300px;height: 150px;" placeholder="contents를 입력해주세요."></textarea>
			</td>
			<td>
				<input  type="date" id="date_start">
					<input  type="date" id="date_end">
			</td>
		</tr>
	</table>	
					<button id="add_btn" >추가</button>


</c:if>
			