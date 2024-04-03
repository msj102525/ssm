<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee main page</title>
<style type="text/css">
fieldset#ss {
    width: 600px;
    position: relative;
    left: 450px;
}
form fieldset {
    width: 600px;    
}
form.sform {
    background: lightgray;
    width: 630px;
    position: relative;
    left: 400px;
    display: none;  /* 안 보이게 함 */
}
body  {
    text-align: center ;
    margin: 0px
}
.container {
    margin: 0 auto;
    width: 80%; /* 혹은 원하는 너비 */
}
table #info {
    text-align: center;
}
.container {
    margin: 0 auto;
    width: 80%; /* 혹은 원하는 너비 */
}
</style>

</head>

<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<!-- <button onclick="location.href='insertemp.do'">직원 등록</button> -->
<button onclick="location.href='selectemp.do'">직원 정보</button><!-- 나중에 지우기! -->
<button onclick="location.href='selectSalary.do'">직원 급여정보</button>
<button onclick="location.href='kakaoM.do'">메세지</button>
<table id="info" border="1" cellspacing="0" cellpadding="3">
    <tr>
        <th>직원번호</th>
        <th>이름</th>
        <th>직급</th>        
        <th>전화번호</th>
        <th>이메일</th>             
        <th>성별</th>
    </tr>
    <c:forEach items="${sessionScope.employeeList}" var="employee">
    <tr>
        <td><c:out value="${employee.id}"/></td>
        <td><c:out value="${employee.name}"/></td>
        <td><c:out value="${employee.position}"/></td>
        <td><c:out value="${employee.phone}"/></td>
        <td><c:out value="${employee.email}"/></td>
        <td><c:out value="${employee.gender}"/></td>
    </tr>
    <tr>
        <td><c:out value="${employee.id}"/></td>
        <td><c:out value="${employee.name}"/></td>
        <td><c:out value="${employee.position}"/></td>
        <td><c:out value="${employee.phone}"/></td>
        <td><c:out value="${employee.email}"/></td>
        <td><c:out value="${employee.gender}"/></td>
    </tr>
    </c:forEach>
</table>
<div class="pagination">
    <c:if test="${sessionScope.paging.startPage > 1}">
        <li onclick="location.href='${sessionScope.paging.urlMapping}&page=1'">처음</li>
        <li onclick="location.href='${sessionScope.paging.urlMapping}&page=${sessionScope.paging.startPage - 1}'">이전</li>
    </c:if>
    <c:forEach begin="${sessionScope.paging.startPage}" end="${sessionScope.paging.endPage}" var="pageNum">
        <li class="${pageNum == sessionScope.paging.currentPage ? 'active' : ''}" 
            onclick="location.href='${sessionScope.paging.urlMapping}&page=${pageNum}'">${pageNum}</li>
    </c:forEach>
    <c:if test="${sessionScope.paging.endPage < sessionScope.paging.maxPage}">
        <li onclick="location.href='${sessionScope.paging.urlMapping}&page=${sessionScope.paging.endPage + 1}'">다음</li>
        <li onclick="location.href='${sessionScope.paging.urlMapping}&page=${sessionScope.paging.maxPage}'">마지막</li>
    </c:if>
</div>
<div>
    <c:if test="${currentPage != 1}">
        <a href="selectemp.do?page=1">처음</a>
    </c:if>
    <c:forEach begin="1" end="${totalPages}" var="page">
        <c:choose>
            <c:when test="${page == currentPage}">
                <b>${page}</b>
            </c:when>
            <c:otherwise>
                <a href="selectemp.do?page=${page}">${page}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${currentPage != totalPages}">
        <a href="selectemp.do?page=${totalPages}">마지막</a>
    </c:if>
</div>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
</body>
</html>
