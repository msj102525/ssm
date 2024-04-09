<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 정보 수정</title>
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
    input[type="number"], input[type="text"], input[type="submit"], select {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
        border: 1px solid #ddd;
        box-sizing: border-box; 
    }
    input[type="submit"] {
        background-color: rgb(255, 221, 102);
        color: white;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #4cae4c;
    }
</style>
</head>
<body>

<h2>직원 정보 수정</h2>

<form action="updateEmployee.do" method="post" onsubmit="submitForm(event)">
    <input type="hidden" name="empId" value="${employee.empId}">
    
    <label for="empName">이름:</label>
    <input type="text" id="empName" name="empName" value="${employee.empName}" disabled required><br><br>
 
    <input type="hidden" name="empName" value="${employee.empName}">
    
    <label for="position">직급:</label>
    <input type="text" id="position" name="position" value="${employee.position}" required><br><br>
    
    <label for="empHireDate">입사 날짜:</label>
    <input type="date" id="empHireDate" name="empHireDate" value="${employee.empHireDate}" disabled required><br><br>
    <!-- 입사 날짜 값을 서버로 전송하기 위한 hidden 필드 추가 -->
    <input type="hidden" name="empHireDate" value="${employee.empHireDate}">
    
    <label for="empPhone">전화번호:</label>
    <input type="text" id="empPhone" name="empPhone" value="${employee.empPhone}" required><br><br>
    
    <label for="empEmail">이메일:</label>
    <input type="email" id="empEmail" name="empEmail" value="${employee.empEmail}" required><br><br>
    
    <label for="empAddress">주소:</label>
    <input type="text" id="empAddress" name="empAddress" value="${employee.empAddress}" required><br><br>
    
    <label for="empBirthDate">생년월일:</label>
    <input type="date" id="empBirthDate" name="empBirthDate" value="${employee.empBirthDate}" disabled required><br><br>
    <!-- 생년월일 값을 서버로 전송하기 위한 hidden 필드 추가 -->
    <input type="hidden" name="empBirthDate" value="${employee.empBirthDate}">
    
    <label for="empGender">성별:</label>
    <select id="empGender" name="empGender" required>
        <option value="m" ${employee.empGender == 'm' ? 'selected' : ''}>남자</option>
        <option value="f" ${employee.empGender == 'f' ? 'selected' : ''}>여자</option>
    </select><br><br>

    <input type="submit" value="수정">
    <br>
    <button onclick="location.href='selectemp.do?id=${loginUser.id}'">목록</button>
</form>

<script>
function submitForm(event) {
    event.preventDefault();
    var form = event.target;

    var formData = new FormData(form);

    fetch(form.action, {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(result => {
        alert(result);
        window.location.href = 'selectemp.do'; // 수정 완료 후 목록 페이지로 이동
    })
    .catch(error => {
        console.error('Error:', error);
        alert('수정 실패'); // 오류 발생 시 알림
    });
}
</script>

</body>
</html>
