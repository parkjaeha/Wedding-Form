<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:forEach items="${requestScope.result}" var="dto">
	<img src="${pageContext.request.contextPath}/uploads/${dto.fname}" width="100px;" height="100px;"/>
	<%-- ${dto.fname} --%>
</c:forEach>