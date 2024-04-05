<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 정보 조회</title>
<style type="text/css">  
body {
    font-family: Arial, sans-serif;
    margin: 150px;
    padding: 10px;
    background-color: #f4f4f4;
    font-size: 25px;
}
</style>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
        color: #333;
    }
    h2, h4 {
        color: #444;
    }
    form {
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    label {
        display: block;
        margin-top: 20px;
        margin-bottom: 5px;
    }
    input[type="number"], input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
        border: 1px solid #ddd;
        box-sizing: border-box;
    }
    input[type="submit"] {
        width: 10%;
        padding: 5px;
        margin-bottom: 10px;
        border-radius: 5px;
        border: 1px solid #ddd;
        box-sizing: border-box;
        background-color: #5cb85c;
        color: white;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #4cae4c;
    }
    table {
        margin-top: 20px;
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
<!-- 검색 폼 추가 -->
<form action="search" method="get">
    <fieldset id="es">
        <legend>직원 검색</legend>
        <input type="search" name="keyword"> &nbsp;
        <input type="submit" value="검색">
    </fieldset> 
</form>
<br>

<!-- 직원 정보 표시 -->
<h2 align="center">직원 수 : ${requestScope.list.size()} 명</h2>
<table>
    <tr>
        <th>직원번호</th>
        <th>이름</th>
        <th>직급</th>
        <th>입사날짜</th>
        <th>전화번호</th>
        <th>이메일</th>
        <th>주소</th>
        <th>생년월일</th>
        <th>성별</th>
    </tr>
    <c:forEach items="${requestScope.list}" var="employee">
        <tr onclick="loadEmployeeDetails(${employee.empId})">
            <td>${employee.empId}</td>
            <td>${employee.empName}</td>
            <td>${employee.position}</td>
            <td>${employee.empHireDate}</td>
            <td>${employee.empPhone}</td>
            <td>${employee.empEmail}</td>
            <td>${employee.empAddress}</td>
            <td>${employee.empBirthDate}</td>
            <td>${employee.empGender == 'M' ? '남자' : '여자'}</td>
        </tr>
    </c:forEach>
</table>

<!-- 선택된 직원의 상세 정보 -->
<table id="employeeDetails" style="display:none;">
    <tr>
        <th>직원 번호</th>
        <td id="detailEmpId"></td>
    </tr>
    <tr>
        <th>이름</th>
        <td id="detailEmpName"></td>
    </tr>
    <tr>
        <th>직급</th>
        <td id="detailPosition"></td>
    </tr>
    <tr>
        <th>입사날짜</th>
        <td id="detailEmpHireDate"></td>
    </tr>
    <tr>
        <th>전화번호</th>
        <td id="detailEmpPhone"></td>
    </tr>
    <tr>
        <th>이메일</th>
        <td id="detailEmpEmail"></td>
    </tr>
    <tr>
        <th>주소</th>
        <td id="detailEmpAddress"></td>
    </tr>
    <tr>
        <th>생년월일</th>
        <td id="detailEmpBirthDate"></td>
    </tr>
    <tr>
        <th>성별</th>
        <td id="detailEmpGender"></td>
    </tr>
</table>
<!-- 선택된 직원의 상세 정보 아래에 버튼 추가 -->
<div style="text-align:center; margin-top: 20px;">
    <!-- 등록 페이지 이동 버튼 -->
    <button onclick="location.href='insertemp.do'">직원 등록</button>
    <!-- 수정 페이지로 이동 버튼 -->
    <button onclick="location.href='updateEmployee.do'">수정하기</button>
    <!-- 직원 삭제 버튼 -->
    <button onclick="deleteEmployee('${selectedEmployee.empId}')">삭제하기</button>
    <!-- 목록으로 돌아가기 버튼 -->
    <button onclick="location.href='mainEmpPage.do'">목록으로 돌아가기</button>
</div>

<script>
// AJAX로 직원 정보를 조회하는 함수
function loadEmployeeDetails(empId) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // 서버로부터 응답받은 데이터(JSON 형식 예상)를 파싱
            var emp = JSON.parse(this.responseText);

            // 상세 정보 표시
            document.getElementById("detailEmpId").innerHTML = emp.empId;
            document.getElementById("detailEmpName").innerHTML = emp.empName;
            document.getElementById("detailPosition").innerHTML = emp.position;
            document.getElementById("detailEmpHireDate").innerHTML = emp.empHireDate;
            document.getElementById("detailEmpPhone").innerHTML = emp.empPhone;
            document.getElementById("detailEmpEmail").innerHTML = emp.empEmail;
            document.getElementById("detailEmpAddress").innerHTML = emp.empAddress;
            document.getElementById("detailEmpBirthDate").innerHTML = emp.empBirthDate;
            document.getElementById("detailEmpGender").innerHTML = emp.empGender == 'M' ? '남자' : '여자';
        }
    };
    // API 엔드포인트 및 empId를 파라미터로 전달하여 호출
    xhttp.open("GET", "/getEmployeeDetails?empId=" + empId, true);
    xhttp.send();
}

// 직원을 삭제하는 함수
function deleteEmployee(empId) {
    if(confirm('정말로 삭제하시겠습니까?')) {
        window.location.href = `/deleteEmployee?empId=${empId}`;
    }
}
</script>
</body>
</html>
