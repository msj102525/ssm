<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메세지 창</title>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

a {
    text-decoration: none;
}

.wrap {
    padding: 40px 20px;
    background-color: #f2f2f2;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin: 20px auto;
    max-width: 600px;
}

.wrap .chat {
    display: flex;
    align-items: flex-start;
    padding: 20px;
}

.wrap .chat .icon {
    position: relative;
    overflow: hidden;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background-color: #ddd;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.5rem;
    color: #555;
}

.wrap .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 7px;
    font-size: 14px;
    border-radius: 10px;
    background-color: #fff;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    color: #333;
}

.wrap .chat .textbox::before {
    position: absolute;
    display: block;
    top: -10px;
    content: "";
    border-style: solid;
    border-width: 0 10px 10px 10px;
    border-color: transparent transparent #fff transparent;
}

.wrap .ch1 .textbox {
    margin-left: 20px;
    background-color: #ddd;
}

.wrap .ch1 .textbox::before {
    left: 20px;
}

.wrap .ch2 {
    flex-direction: row-reverse;
}

.wrap .ch2 .textbox {
    margin-right: 20px;
    background-color: #F9EB54;
}

.wrap .ch2 .textbox::before {
    right: 20px;
}

textarea {
    width: calc(100% - 40px);
    margin-bottom: 20px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
    resize: none;
}

input[type="button"] {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
}

input[type="button"]:hover {
    background-color: #45a049;
}

#chatBox {
    margin-top: 20px;
}
</style>

</head>
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
</body>
</html>
