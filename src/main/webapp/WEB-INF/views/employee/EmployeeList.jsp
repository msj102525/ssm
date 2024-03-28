<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 정보 조회</title>
<style type="text/css">
<style type="text/css">  
body {
    font-family: Arial, sans-serif;
    margin: 150px;
    padding: 10px;
    background-color: #f4f4f4;
    font-size: 25px
}
</style>
</head>
<body>
<!-- 검색 폼 추가 -->
<form action="searchEmployee" method="get">
    <fieldset id="es">
        <legend></legend>
        <h4>조회 할 항목을 검색하세요</h4>
        <input type="search" name="keyword"> &nbsp;
        <input type="submit" value="검색">
</form>
<br>
<!-- <form action="esearch.do" class="item" id="emlnameform" method="get">
	<input type="search" name="keyword" value="직원 이름">
</form>
<form action="esearch.do" class="item" id="emlnameform" method="get">
	<input type="search" name="keyword" value="직원 번호">
</form> -->
 </fieldset>
<%-- <%-- 항목별 검색 기능 추가
<fieldset id="es">
	<legend>검색할 항목을 선택하세요.</legend>
	<input type="radio" name="item" id="enaem"> 직원이름 &nbsp;
	<input type="radio" name="item" id="eid"> 직원 번호 &nbsp;	
</fieldset> --%>
<form action="selectEmployee.do" method="post">
  
    <c:forEach items="${ list }" var="e">
        <tr>
            <td>${e.empId}</td>
            <td>${e.empName}</td>
            <td>${e.position}</td>
            <td>${e.empHireDate}</td>
            <td>${e.empPhone}</td>
            <td>${e.empEmail}</td>
            <td>${e.empAddress}</td>
            <td>${e.empBirthDate}</td>
            <td>${e.empGender eq "m" ? "남자" : "여자"}</td>
        </tr>
    </c:forEach>
</form>      
<hr>
    <h2>상세 조회</h2>
<table border="1">
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
    <!-- 검색 결과를 반복하여 표시 -->
    <c:forEach items="${list}" var="e">
        <tr>
            <td>${e.empId}</td>
            <td>${e.empName}</td>
            <td>${e.position}</td>
            <td>${e.empHireDate}</td>
            <td>${e.empPhone}</td>
            <td>${e.empEmail}</td>
            <td>${e.empAddress}</td>
            <td>${e.empBirthDate}</td>
            <td>${e.empGender eq "m" ? "남자" : "여자"}</td>
        </tr>
    </c:forEach>   
    <!-- 예시: -->
    <tr> 
        <td>1</td>
        <td>홍길동</td>
        <td>대리</td>
        <td>2020-01-01</td>
        <td>010-1234-5678</td>
        <td>hong@example.com</td>
        <td>서울시 강남구</td>
        <td>1990-05-05</td>
        <td>남</td>
    </tr>

</table>


</body>
</html>
