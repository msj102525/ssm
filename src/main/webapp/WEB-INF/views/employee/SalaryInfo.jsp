<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>직원 금융 정보 등록</title>
</head>
<body>

<h2>직원 금융 정보 등록</h2>
<form action="submitEmployeeInfo.jsp" method="post">
    <label for="empId">직원 ID:</label>
    <input type="number" id="empId" name="empId" required><br>
    
    <label for="bankAccountNo"> 계좌 번호:</label>
    <input type="text" id="bankAccountNo" name="bankAccountNo" required><br>
    
    <label for="accountDolder">계좌 소유자 이름:</label>
    <input type="text" id="accountDolder" name="accountDolder" required><br>
    
    <label for="premium">보험료:</label>
    <input type="text" id="premium" name="premium" required><br>
    
    <label for="tax">세금:</label>
    <input type="text" id="tax" name="tax" required><br>
    
    <input type="submit" value="등록">
</form>
</body>
</html>
