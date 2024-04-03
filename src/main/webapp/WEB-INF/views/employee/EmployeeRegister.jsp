<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/common/header.css" />
<title>직원 등록</title>
<!-- <style type="text/css">  
body {
    font-family: Arial, sans-serif;
    margin: 150px;
    padding: 10px;
    background-color: #f4f4f4;
    font-size: 25px
}
/* .flex_container {
  display: flex;
} */
.center-container {
    display: flex;
    flex-direction: column;
    align-items: center; 
    justify-content: center; 
    height: 50vh;
    
}

h2 {
    color: #333;
    font-size: 35px;
   	border: 1px solid rgb(241, 200, 125);
	border-top-left-radius: 10px; /* 상단 왼쪽 모서리만 둥글게 */
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
    margint: 0px; 
    background-color: rgb(241, 200, 125);
    
}

#registrationForm {
    background-color: #ffffff;
    padding: 20px;
    margin: 50px auto;
    width: 400px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#registrationForm label {
    margin: 10px 0 10px; /* 상하 마진 조정 */
    display: block;
    font-size: 25px; /* 라벨의 글꼴 크기 조정 */
}

#registrationForm input[type=text],
#registrationForm input[type=number],
#registrationForm input[type=tel],
#registrationForm input[type=email],
#registrationForm input[type=date],
#registrationForm select {
    padding: 15px; 
   /* 	margin: 5px 0 20px; /* 입력 필드 사이의 간격을 조정합니다. */ 
    font-size: 16pt; /* 입력 필드의 글자 크기를 조정합니다. */
    display: block; /* 블록 레벨 요소로 설정하여 너비 전체를 차지하도록 합니다. */
    width: 100%; /* 컨테이너의 너비를 전체 차지하도록 설정합니다. */
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

#registrationForm input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 15px 0; /* 상하 마진 조정 */
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 25px;
}

#registrationForm input[type=submit]:hover {
    background-color: rgb(241, 200, 125);
}

</style> -->
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
    <%-- <script>
        <% if (request.getAttribute("errorMessage") != null) { %>
        
            alert('<%= request.getAttribute("errorMessage") %>');
        <% } %>
        <% if (request.getAttribute("successMessage") != null) { %>
            alert('<%= request.getAttribute("successMessage") %>');
        <% } %>
    </script>    --%>
     <button onclick="location.href='mainEmpPage.do'">목록</button>
       </table> 
    </form>

<%-- 
		<script th:if="${errorMessage}">
    		alert([[${errorMessage}]]);
		</script>
		<script th:if="${successMessage}">
    		alert([[${successMessage}]]);
		</script> --%>

	</div> 

</body>
</html>
