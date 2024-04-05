<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출퇴근 버튼</title>
<style>
/* 버튼을 가운데 정렬하기 위한 CSS */
.centered {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* 화면 전체 높이를 차지하여 버튼을 가운데 정렬합니다. */
}

/* 입력 폼과 버튼을 수직 정렬하기 위한 CSS */
.form-container {
	display: flex;
	flex-direction: column;
	align-items: center;
}
</style>
</head>
<body class="centered">
	<div class="form-container">
		<form action="recordTime.do">
			<label for="username">사용자 이름:</label> <input type="text"
				id="username">
			<button onclick="recordTime('출근')">출근</button>
			<button onclick="recordTime('퇴근')">퇴근</button>
		</form>
	</div>
	<script>
function recordTime(action) {
    var username = document.getElementById('username').value;
    var currentTime = new Date();
    var koreanTime = currentTime.toLocaleString('en-US', { timeZone: 'Asia/Seoul' }); // 한국 시간대로 시간 변환

    // AJAX를 사용하여 서버로 데이터 전송
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "recordTime.do", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                if (action === '출근') {
                    console.log(username + "님이 출근했습니다.");
                    alert(username + "님이 출근했습니다!");
                } else if (action === '퇴근') {
                    console.log(username + "님이 퇴근했습니다.");
                    alert(username + "님이 퇴근했습니다!");
                }
            } else {
                console.log("서버 응답에 문제가 있습니다.");
                alert("서버 응답에 문제가 있습니다.");
            }
        }
    };
    // CommuteInfo 객체 생성
    var commuteInfo = {
        empId: null, // 직원 ID를 여기에 설정
        startTime: null,
        workDay: null,
        endTime: null,
        workingHours: null,
        lateFlag: null,
        leaveEarly: null,
        absenteeism: null,
        id: null
    };

    // 서버로 전송할 데이터 설정
    if (action === '출근') {
        commuteInfo.startTime = koreanTime; // 출근 시간 설정
        commuteInfo.lateFlag = 'N'; // 지각 여부 'N'으로 설정
    } else if (action === '퇴근') {
        commuteInfo.endTime = koreanTime; // 퇴근 시간 설정
        commuteInfo.leaveEarly = 'N'; // 조퇴 여부 'N'으로 설정
    }

    xhr.send(JSON.stringify(commuteInfo)); // CommuteInfo 객체를 JSON 문자열로 변환하여 전송
}
</script>
</body>
</html>
