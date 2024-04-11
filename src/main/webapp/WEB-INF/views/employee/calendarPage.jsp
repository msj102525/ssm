<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 스케줄 조회 페이지</title>
</head>
<body>
    <h1>직원 스케줄 조회</h1>
    <table border="1">
        <tr>
            <th>직원 ID</th>
            <th>직원 이름</th>
            <th>직급</th>
            <th>날짜</th>
            <th>내용</th>
        </tr>
        <c:forEach var="schedule" items="${schedules}">
            <tr>
                <td>${schedule.empId}</td>
                <td>${schedule.employee.empName}</td>
                <td>${schedule.employee.position}</td>
                <td>${schedule.date}</td>
                <td>${schedule.remarks}</td>
            </tr>
        </c:forEach>
    </table>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
