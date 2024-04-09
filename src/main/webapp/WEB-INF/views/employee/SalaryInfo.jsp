<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>직원 급여 정보</title>
<style>
    /* Common styles */
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
        margin-top: 20px; /* Adjusted margin top */
    }

    label {
        display: block;
        margin-top: 20px;
        margin-bottom: 5px;
    }

    input[type="number"], input[type="text"], input[type="submit"], select {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
        border: 1px solid #ddd;
        box-sizing: border-box; 
    }

    input[type="submit"] {
        background-color: #5cb85c;
        color: white;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #4cae4c;
    }

    /* Specific styles */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px; /* Adjusted margin top */
    }

    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    /* Center align buttons and adjust margin */
    div.button-group {
        text-align: center;
        margin-top: 20px;
    }

    div.button-group button {
        margin: 5px;
    }

    /* Added styles */
    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .button-group button {
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .button-group button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/common/sidebar.jsp" />
    <div class="container">
        <h2>직원 급여 정보</h2>
        <!-- 급여 정보 표시 -->
        <table>
            <thead>
                <tr>
                    <th>직원번호</th>
                    <th>이름</th>
                    <th>은행 이름</th>
                    <th>계좌 번호</th>
                    <th>보험료</th>
                    <th>세금</th>
                    <th>월급</th>                                 
                </tr>
                 <c:forEach var="employee" items="${employees}">
                    <tr>
                        <td>${employee.empId}</td>
                        <td>${employee.empName}</td>
                        <td>${employee.bankName}</td>
                        <td>${employee.bankAccountNo}</td>
                        <td>${employee.premium}</td>
                        <td>${employee.tax}</td>
                        <td>${employee.monthlySalary}</td>
                        </tr>
                  </c:forEach>
            </thead>
            <tbody>
                <c:forEach var="employee" items="${employees}">
                    <tr>
                        <td>${employee.empId}</td>
                        <td>${employee.empName}</td>
                        <td>${employee.bankName}</td>
                        <td>${employee.bankAccountNo}</td>
                        <td>${employee.premium}</td>
                        <td>${employee.tax}</td>
                        <td>${employee.monthlySalary}</td>
                        <td>
                            <!-- 삭제 기능을 위한 Form -->
                            <form action="deleteSalary.do" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                                <input type="hidden" name="empId" value="${employee.empId}">
                                <input type="submit" value="삭제">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>			
		</table>
		
		<!-- 시급 입력 폼 -->
			<div class="hourly-wage-form">			
				<form action="calculateMonthlySalary" method="post">
				<h4 class="page-title">월급 계산</h4>
					<label for="hourlyWage">시급:</label> <input type="number"
						id="hourlyWage" name="hourlyWage" required>
					<button type="submit">
						<i class="fas fa-calculator"></i> 월급 계산
					</button>
				</form>
			</div>
        <!-- 버튼 그룹 -->
        <div class="button-group">
            <!-- 등록 페이지 이동 버튼 -->
            <button onclick="location.href='insertSalary.do'">등록 하기</button>
            <!-- 수정 페이지로 이동 버튼 -->
            <button onclick="location.href='updateSalaryInfo.do'">수정하기</button>
            <!-- 목록으로 돌아가기 버튼 -->
            <button onclick="location.href='mainEmpPage.do'">목록으로 돌아가기</button>
            <!-- 직원 급여 내보내는 버튼 -->
             <button onclick="location.href='insertSalary.do'">내보내기 하기</button>
             <!-- 현재 정보를 가지고 급여명세서 페이지로 이동 -->
             <button onclick="location.href='mvPayStub.do'">급여명세서</button>
        </div>
    </div>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
