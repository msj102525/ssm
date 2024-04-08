<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더view Page</title>
</head>
<body>
<script type="text/javascript">
function displayCalendar() {
    var googleCalendarId = document.getElementById('googleCalendarId').value;
    if (!isValidGoogleCalendarId(googleCalendarId)) {
        alert("올바른 구글 캘린더 ID를 입력하세요.");
        return;
    }

    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        googleCalendarApiKey: 'AIzaSyCkDRzm5BdNLuU5NQJkSjx8wyY9gNB7Fps',
        eventSources: [
            {
                googleCalendarId: googleCalendarId,
                className: '웹디자인기능사',
                color: '#be5683' // 이벤트 색상 설정
                //textColor: 'black' // 이벤트 텍스트 색상 설정
            }
        ]
    });

    calendar.render();
}

function isValidGoogleCalendarId(id) {
    return id.trim() !== '';
}
</script>

<form id="calendarForm">
    <label for="googleCalendarId">구글 캘린더 ID:</label>
    <input type="text" id="googleCalendarId" name="googleCalendarId">
    <button type="button" onclick="displayCalendar()">캘린더 표시</button>
</form>
<div id="calendar"></div>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
