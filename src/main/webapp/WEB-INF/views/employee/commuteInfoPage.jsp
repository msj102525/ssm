<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 관리 페이지</title>
</head>
<body>
<!-- 직원 검색 폼 -->
<form action="selectcommutePage.do" method="post">
    <fieldset id="employee">
        <legend>직원 검색</legend>
        <input type="search" name="keyword"> &nbsp;
        <input type="submit" value="검색">
    </fieldset>
</form>

<table id="commutelninfo" border="1" cellspacing="0" cellpadding="3">
    <tr>
        <th>직원 이름</th>
        <th>직원 번호</th>
        <th>출근 시간</th> 
        <th>근무 일</th>
        <th>퇴근 시간</th>
        <th>근무 시간</th>
        <th>지각 여부</th>
        <th>조퇴 여부</th>
        <th>결근 여부</th>
        <th>상세 조회</th> <!-- 열 추가 -->
    </tr>
    <c:forEach items="${sessionScope.selectcommute}" var="cinfo">
        <tr>
            <td><c:out value="${cinfo.employee.name}"/></td>
            <td><c:out value="${cinfo.empId}"/></td>
            <td><c:out value="${cinfo.startTime}"/></td>
            <td><c:out value="${cinfo.workDay}"/></td>
            <td><c:out value="${cinfo.endTime}"/></td>
            <td><c:out value="${cinfo.workingHours}"/></td>
            <td><c:out value="${cinfo.lateFlag}"/></td>
            <td><c:out value="${cinfo.leaveEarly}"/></td>
            <td><c:out value="${cinfo.absenteeism}"/></td>
            <!-- 상세 조회 버튼 추가 -->
            <td><button onclick="showDetail('${cinfo.employee.name}', '${cinfo.empId}', '${cinfo.startTime}', '${cinfo.workDay}', '${cinfo.endTime}', '${cinfo.workingHours}', '${cinfo.lateFlag}', '${cinfo.leaveEarly}', '${cinfo.absenteeism}')">상세 조회</button></td>
        </tr>
    </c:forEach>
</table>

<!-- 상세 조회 정보를 표시할 테이블 -->
<div id="detailInfo" style="display: none;">
    <h4>상세 조회</h4>
    <table id="detailTable" border="1" cellspacing="0" cellpadding="3">
        <tr>
            <th>직원 이름</th>
            <th>직원 번호</th>
            <th>출근 시간</th> 
            <th>근무 일</th>
            <th>퇴근 시간</th>
            <th>근무 시간</th>
            <th>지각 여부</th>
            <th>조퇴 여부</th>
            <th>결근 여부</th>
        </tr>
    </table>
</div>

<div style="text-align:center; margin-top: 20px;">
    <!-- 목록으로 돌아가기 버튼 -->
     <button onclick="location.href='mainEmpPage.do'">목록으로 돌아가기</button>
</div>

<c:import url="/WEB-INF/views/common/footer.jsp" />
<script>
function showDetail(name, empId, startTime, workDay, endTime, workingHours, lateFlag, leaveEarly, absenteeism) {
    // 상세 조회 정보를 가져와서 테이블에 채움
    var detailTable = document.getElementById("detailTable");
    // 테이블 초기화
    detailTable.innerHTML = "";
    var newRow = detailTable.insertRow();

    var nameCell = newRow.insertCell(0);
    var empIdCell = newRow.insertCell(1);
    var startTimeCell = newRow.insertCell(2);
    var workDayCell = newRow.insertCell(3);
    var endTimeCell = newRow.insertCell(4);
    var workingHoursCell = newRow.insertCell(5);
    var lateFlagCell = newRow.insertCell(6);
    var leaveEarlyCell = newRow.insertCell(7);
    var absenteeismCell = newRow.insertCell(8);

    nameCell.innerHTML = name;
    empIdCell.innerHTML = empId;
    startTimeCell.innerHTML = startTime;
    workDayCell.innerHTML = workDay;
    endTimeCell.innerHTML = endTime;
    workingHoursCell.innerHTML = workingHours;
    lateFlagCell.innerHTML = lateFlag;
    leaveEarlyCell.innerHTML = leaveEarly;
    absenteeismCell.innerHTML = absenteeism;

    // 상세 조회 정보를 보여줌
    document.getElementById("detailInfo").style.display = "block";
}
</script>
</body>
</html>
