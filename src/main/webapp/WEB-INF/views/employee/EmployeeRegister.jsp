<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/common/header.css" />
<title>직원 등록</title>
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
    input[type="number"], input[type="text"], input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
        border: 1px solid #ddd;
        box-sizing: border-box; /* Makes sure padding does not affect total width */
    }
    input[type="submit"] {
        background-color: #5cb85c;
        color: white;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #4cae4c;
    }
</style>  
 <script>
        // 페이지가 로드될 때 실행되는 함수
        window.onload = function() {
            // URL에 successMessage 파라미터가 있는지 확인
            const urlParams = new URLSearchParams(window.location.search);
            const successMessage = urlParams.get('successMessage');
            
            // successMessage가 존재하면 알림 창 표시
            if (successMessage) {
                alert(successMessage);
            }

            // 유저 번호 필드에 로그인한 사용자의 번호를 자동으로 입력
            const loggedInUserId = 'document.getElementById('id').value';
            document.getElementById('id').value = loggedInUserId;
        };
    </script>
</head>

<body>
<div class="center-container"> 
    <h2>직원 등록</h2>
    <br>
    <form action="insertemp.do" method="post" >
        <table>
         <div>
            <label for="id">유저 번호:</label>
            <input type="number" id="id" name="id" required>
        </div>
        <div>
            <label for="empName">이름:</label>
            <input type="text" id="empName" name="empName"required>
        </div>
        <div>
            <label for="position">직책:</label>
            <input type="text" id="position" name="position">  
        </div>
  
        <div>
            <label for="empHireDate">입사일:</label>
            <input type="date" id="empHireDate" name="empHireDate">
        </div>
        <div>
            <label for="empPhone">전화번호:</label>
            <input type="text" id="empPhone" name="empPhone" required>
        </div>
        <div>
            <label for="empEmail">이메일:</label>
            <input type="email" id="empEmail" name="empEmail" required>
        </div>
        <div>
            <label for="empAddress">주소:</label>
            <input type="text" id="empAddress" name="empAddress" required>
        </div>
        <div>
            <label for="empBirthDate">생년월일:</label>
            <input type="date" id="empBirthDate" name="empBirthDate" required>
        </div>
        <div>
            <label for="empGender">성별:</label>
            <select id="empGender" name="empGender" required>
                <option value="M">남자</option>
                <option value="F">여자</option>
            </select>
        </div>           
         <hr>
        <input type="submit" value="등록"/>
     <button onclick="location.href='mainEmpPage.do'">목록</button>
       </table> 
    </form>
	</div> 
</body>
</html>
