<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메세지 창</title>
<style>
  body {
        font-family: 'Arial', sans-serif; /* 기본 글꼴 변경 */
        background-color: #f3f5f9; /* 배경색 변경 */
        margin: 110; /* 바디의 마진 제거 */
        padding:100; /* 바디의 패딩 제거 */
    }
    .container {
        max-width: 600px; /* 최대 너비 설정 */
        margin: 20px auto; /* 가운데 정렬 및 위아래 여백 추가 */
        background-color: #fff; /* 박스 배경색 설정 */
        padding: 20px; /* 내부 여백 추가 */
        border-radius: 10px; /* 박스 테두리를 둥글게 만듦 */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
    }
    h4 {
        margin-top: 150px; /* 타이틀 위 여백 제거 */
        color: #007bff; /* 타이틀 색상 변경 */
    }
    #messageInput {
        width: calc(100% - 40px); /* 입력 필드 너비 설정 */
        padding: 10px; /* 내부 여백 추가 */
        margin: 10px 0; /* 위아래 여백 추가 */
        border: 1px solid #ccc; /* 테두리 설정 */
        border-radius: 5px; /* 테두리를 둥글게 만듦 */
        box-sizing: border-box; /* 테두리와 내부 여백 포함하여 크기 계산 */
    }
    #messageInput:focus {
        outline: none; /* 포커스 효과 제거 */
        border-color: #007bff; /* 포커스시 테두리 색상 변경 */
    }
    input[type="button"] {
        padding: 10px 20px; /* 내부 여백 추가 */
        border: none; /* 테두리 제거 */
        border-radius: 5px; /* 테두리를 둥글게 만듦 */
        background-color: #ff69b4; /* 배경색 변경 */
        color: #fff; /* 텍스트 색상 변경 */
        cursor: pointer; /* 포인터 모양 변경 */
        transition: background-color 0.3s; /* 배경색 전환 애니메이션 추가 */
    }
    input[type="button"]:hover {
        background-color: #ff1493; /* 마우스 오버시 배경색 변경 */
    }
    .chat {
        margin-top: 20px; /* 채팅창 상단 여백 추가 */
        overflow-y: auto; /* 수직 스크롤바 표시 */
        max-height: 300px; /* 채팅창 최대 높이 설정 */
    }
    .chat .message {
        margin-bottom: 10px; /* 메시지 간의 하단 여백 추가 */
    }
    .chat .message .icon {
        display: inline-block; /* 아이콘을 인라인 요소로 표시 */
        width: 30px; /* 아이콘 너비 설정 */
        height: 30px; /* 아이콘 높이 설정 */
        border-radius: 50%; /* 아이콘을 원형으로 만듦 */
        background-color: #007bff; /* 아이콘 배경색 설정 */
        text-align: center; /* 아이콘 내부 텍스트 가운데 정렬 */
        color: #fff; /* 아이콘 텍스트 색상 설정 */
        line-height: 30px; /* 아이콘 텍스트 수직 가운데 정렬 */
    }
    .chat .message .textbox {
        display: inline-block; /* 텍스트 박스를 인라인 요소로 표시 */
        max-width: calc(100% - 40px); /* 최대 너비 설정 */
        margin-left: 10px; /* 왼쪽 여백 추가 */
        padding: 10px; /* 내부 여백 추가 */
        background-color: #f0f0f0; /* 텍스트 박스 배경색 설정 */
        border-radius: 5px; /* 텍스트 박스 테두리를 둥글게 만듦 */
        word-wrap: break-word; /* 긴 텍스트가 길이를 넘어갈 때 줄바꿈 처리 */
    }
</style>
</head>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/common/sidebar.jsp" />
<form id="messageForm">
    <div class="wrap">
        <!-- 사용자 입력을 받는 입력 필드 -->
        <textarea id="messageInput" name="message" rows="4" cols="50"></textarea>
        <input type="button" value="메시지 보내기" onclick="sendMessage()">
    </div>
</form>
<div class="wrap" id="chatBox">
    <!-- 여기에 채팅 내용이 추가될 것입니다 -->
</div>

<script type="text/javascript">
function sendMessage() {
    // 입력 필드에서 사용자가 작성한 메시지 가져오기
    var message = document.getElementById("messageInput").value;

    // Kakao Link 보내기
    Kakao.init('f73d56570e7fb0efa7fa0f476dd12336');
    Kakao.Link.sendDefault({
        objectType: 'text',
        text: message,
        link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
        },
    });

    // 채팅창에 새로운 메시지 추가하기
    var chatBox = document.getElementById("chatBox");
    var newChat = document.createElement("div");
    newChat.className = "chat ch2"; // 채팅 스타일을 지정하세요
    newChat.innerHTML = `
        <div class="icon"><i class="fa-solid fa-user"></i></div>
        <div class="textbox">${message}</div>
    `;
    chatBox.appendChild(newChat);

    // 입력 필드 비우기
    document.getElementById("messageInput").value = "";
}

// 폼 제출 이벤트 처리
document.getElementById("messageForm").addEventListener("submit", function(event) {
    event.preventDefault(); // 폼 제출 기본 동작 중지
    sendMessage(); // 메시지 보내기 함수 호출
});
</script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</body>
</html>

