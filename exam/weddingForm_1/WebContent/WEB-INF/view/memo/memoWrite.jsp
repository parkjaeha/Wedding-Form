<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<c:forEach items="${requestScope.list}" var="dto" varStatus="count">
	
		<div class="row">
			<div class="col-sm-1">${dto.name}</div>
			<div class="col-sm-2">
				<div id="viewPassword${count.count}" style="display: none;">
					
					<input type="password" id="pw${count.count}" name="pw">
					<button class="delete" value="${dto.num}" title="${count.count}">삭제</button>
				</div>
				<span id="viewContents${count.count}">${dto.contents}</span>
			</div>
			<div class="col-sm-3"><button class="deletes" value="${count.count}">삭제</button></div>
		</div>
	
	</c:forEach>
</div>