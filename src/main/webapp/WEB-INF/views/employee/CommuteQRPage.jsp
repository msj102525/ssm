<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출퇴근 페이지</title>
<style type="text/css">
/* 입력 폼과 버튼을 포함한 컨테이너 스타일 */
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center; /* 수직 가운데 정렬을 위해 추가 */
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    background-color: #f9f9f9;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    max-width: 800px;
}


/* 버튼 스타일 */
.container button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    margin-top: 10px;
}

.container button:hover {
    background-color: #0056b3;
}

/* 출퇴근 정보 테이블 스타일 */
#commuteInfoSection {
    text-align: center;
    margin: auto;
    max-width: 800px;
}

#commuteInfoSection table {
    width: 100%;
    border-collapse: collapse;
}

#commuteInfoSection th,
#commuteInfoSection td {
    padding: 8px;
    border-bottom: 1px solid #ddd;
}

#commuteInfoSection th {
    background-color: #007bff;
    color: #fff;
}

#commuteInfoSection tbody tr:nth-child(even) {
    background-color: #f2f2f2;
}

#commuteInfoSection tbody tr:hover {
    background-color: #ddd;
}

/* 출퇴근 정보를 표시할 div 스타일 */
#commuteInfoDiv {
    max-width: 900px;
    margin: 20px auto; /* 수정된 부분: 출퇴근 정보가 버튼 아래로 이동되도록 상단 및 하단 마진 추가 */
    display: flex; /* 수정된 부분: 요소를 수평으로 배치하기 위해 flex 사용 */
    justify-content: center; /* 수정된 부분: 가운데 정렬을 위해 추가 */
    text-align: center;
}

</style>
</head>
<body>
<div class="centered">
    <div class="container">
        <form>
            <label for="empId">직원 번호:</label> <input type="text" id="empId">
            <label for="username">사용자 이름:</label> <input type="text" id="username">
            <button onclick="recordTime('출근')">출근</button>
            <button onclick="recordTime('퇴근')">퇴근</button>
        </form>
    </div>
    <hr>
    <div id="commuteInfoSection">
        <h2>출퇴근 정보</h2>
			<table>
				<thead>
					<tr>
						<th>직원 번호</th>
						<th>직원 이름</th>
						<th>출근 시간</th>
						<th>퇴근 시간</th>
					</tr>
				</thead>
				<tbody id="commuteInfoBody">
					
				</tbody>
			</table>
			<button onclick="location.href='mainEmpPage.do'">목록</button>
    </div>
   
</div>

<script>
    function recordTime(action) {
        var empId = document.getElementById('empId').value;
        var username = document.getElementById('username').value;
        
        // 현재 시간을 서버의 시간대로 변환합니다.
        var currentTime = new Date();
        var serverTime = new Date(currentTime.getTime() + currentTime.getTimezoneOffset() * 60000); // 로컬 시간을 서버 시간대로 변환합니다.
        var koreanTime = serverTime.toLocaleString('en-US', { timeZone: 'Asia/Seoul' });

        var commuteInfo = {
            empId: empId,
            username: username,
            action: action,
            koreanTime: koreanTime
        };

        fetch('recordTime.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(commuteInfo)
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error('서버 응답에 문제가 있습니다.');
            }
        })
        .then(data => {
            if (data.success) {
                console.log(username + "님이 " + action + "했습니다.");
                alert(username + "님이 " + action + "했습니다!");
                // 출퇴근 정보를 테이블에 추가합니다.
                addCommuteInfoToTable(data.commuteInfo);
            } else {
                alert('서버에서 오류가 발생했습니다.');
            }
        })
        .catch(error => {
            console.error('오류:', error);
            alert('오류가 발생했습니다.');
        });
    }

    function addCommuteInfoToTable(commuteInfo) {
        var tableBody = document.getElementById('commuteInfoBody');
        var newRow = document.createElement('tr');
        newRow.innerHTML = '<td>' + commuteInfo.empId + '</td>' +
                           '<td>' + commuteInfo.username + '</td>' +
                           '<td>' + commuteInfo.startTime + '</td>' +
                           '<td>' + commuteInfo.endTime + '</td>';
        tableBody.appendChild(newRow);
    }
</script>

</body>
</html>
