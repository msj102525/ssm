<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>employee main page</title>
<style type="text/css">
/* 헤더 버튼 스타일 */
button {
    background-color: rgb(250, 180, 49); /* 메인 색상 */
    color: white;
    border: none;
    padding: 10px 20px;
    margin: 5px;
    cursor: pointer;
    font-size: 16px;
    border-radius: 20px; /* 모서리를 둥글게 */
}

button:hover {
    background-color: #ffa500; /* 호버시 색상 */
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #007bff; /* 테이블 헤더 색상 (예시로 변경) */
    color: white;
}

/* 페이징 스타일 */
.pagination {
    margin-top: 20px;
}

.pagination li {
    display: inline-block;
    padding: 8px 16px;
    background-color: #007bff; /* 페이징 색상 (예시로 변경) */
    color: white;
    cursor: pointer;
    border-radius: 5px; /* 모서리를 둥글게 */
}

.pagination li:hover {
    background-color: #0056b3; /* 호버시 색상 (예시로 변경) */
}

.pagination .active {
    background-color: #0056b3; /* 현재 페이지 색상 (예시로 변경) */
}

</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<!-- <button onclick="location.href='insertemp.do'">직원 등록</button> -->
<button onclick="location.href='selectemp.do'">직원 정보</button><!-- 나중에 지우기! -->
<button onclick="location.href='selectSalary.do'">직원 급여정보</button>
<button onclick="location.href='selectcommutePage.do'">근태관리페이지</button>
<button onclick="location.href='kakaoM.do'">메세지</button>
<button onclick="location.href='QRController.do'">qr출퇴근</button>
<button onclick="location.href='recordTimePage.do'">출퇴근버튼</button>
<%-- 
<c:import url="/WEB-INF/views/common/header.jsp" />
<!-- <button onclick="location.href='insertemp.do'">직원 등록</button> -->
<button onclick="location.href='selectemp.do'">직원 정보</button><!-- 나중에 지우기! -->
<button onclick="location.href='selectSalary.do'">직원 급여정보</button>
<button onclick="location.href='selectcommutePage.do'">출퇴근 정보</button>
<button onclick="location.href='kakaoM.do'">메세지</button>
<button onclick="location.href='QRController.do'">qr출퇴근</button>
<button onclick="location.href='recordTimePage.do'">출퇴근버튼</button> --%>

<c:if test="${not empty loginUser}">
    <h2>로그인한 사용자 정보</h2>
    <p>이름: ${loginUser.name}</p>
    <p>직급: ${loginUser.position}</p>
    <p>전화번호: ${loginUser.phone}</p>
    <p>이메일: ${loginUser.email}</p>
    <p>성별: ${loginUser.gender}</p>
</c:if>
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
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
