<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result eq true}">
OK
</c:if>

<c:if test="${result eq false}">
FAIL
</c:if>