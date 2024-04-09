<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSM ERROR</title>
<style type="text/css">
	.error-container {
		padding: 100px 20px 450px 20px;;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="error-container">
		<h1>오류 발생 :</h1>
		<c:set var="e" value="<%=exception%>" />
		<c:if test="${ !empty e }">
			<h3>jsp 페이지 오류 : ${ e.message }</h3>
		</c:if>
		<c:if test="${ empty e }">
			<h3>컨트롤러 오류 : ${ requestScope.message }</h3>
		</c:if>
		<c:url var="movemain" value="main.do" />
	</div>
		<c:import url="footer.jsp" />
</body>
</html>







