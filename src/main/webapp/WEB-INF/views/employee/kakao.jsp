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
<style type="text/css">
.* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

a {
    text-decoration: none;
}

.wrap {
    padding: 40px 0;
    background-color: #A8C0D6;
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
    background-color: #eee;
}

.wrap .chat .icon i {
    position: absolute;
    top: 10px;
    left: 50%;
    font-size: 2.5rem;
    color: #aaa;
    transform: translateX(-50%);
}

.wrap .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 7px;
    font-size: 13px;
    border-radius: 10px;
}

.wrap .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

.wrap .ch1 .textbox {
    margin-left: 20px;
    background-color: #ddd;
}

.wrap .ch1 .textbox::before {
    left: -15px;
    content: "◀";
    color: #ddd;
}

.wrap .ch2 {
    flex-direction: row-reverse;
}

.wrap .ch2 .textbox {
    margin-right: 20px;
    background-color: #F9EB54;
}

.wrap .ch2 .textbox::before {
    right: -15px;
    content: "▶";
    color: #F9EB54;
}
</style>

</head>
<body>

<button onclick="location.href='kakaoM.do'">메세지</button>

<div class="wrap">
    <!-- 사용자 입력을 받는 입력 필드 -->
    <textarea id="messageInput" rows="4" cols="50"></textarea>
    <button onclick="sendMessage()">메시지 보내기</button>
</div>
<div class="wrap" id="chatBox">
    <!-- 여기에 채팅 내용이 추가될 것입니다 -->
</div>

<div class="wrap">
    <!-- 사용자 입력을 받는 입력 필드 -->
    <textarea id="messageInput" rows="4" cols="50"></textarea>
    <button onclick="sendMessage()">메시지 보내기</button>
</div>

<script type="text/javascript">
function sendMessage() {
    // 입력 필드에서 사용자가 작성한 메시지 가져오기
    var message = document.getElementById("messageInput").value;

    // Kakao Link 보내기 (생략)

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
</script>

<script type="text/javascript">
function sendMessage() {
    // 입력 필드에서 사용자가 작성한 메시지 가져오기
    var message = document.getElementById("messageInput").value;

    // Kakao Link 보내기
    Kakao.init('f73d56570e7fb0efa7fa0f476dd12336')
    Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
            title: '사용자가 작성한 메시지',
            description: message,
            imageUrl: 'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
            link: {
                mobileWebUrl: 'https://developers.kakao.com',
                webUrl: 'https://developers.kakao.com',
            },
        },
        social: {
            likeCount: 286,
            commentCount: 45,
            sharedCount: 845,
        },
        buttons: [
            {
                title: '웹으로 보기',
                link: {
                    mobileWebUrl: 'https://developers.kakao.com',
                    webUrl: 'http://localhost:8087/ssm/kakaoM.do',
                },
            },
            {
                title: '홈페이지',
                link: {
                    mobileWebUrl: 'https://developers.kakao.com',
                    webUrl: 'http://localhost:8087/ssm',
                },
            },
        ],
    });
}
</script>

</body>
</html>
