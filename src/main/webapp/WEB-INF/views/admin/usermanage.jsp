<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="nowpage" value="1" />
<c:if test="${ !empty requestScope.currentPage }">
	<c:set var="nowpage" value="${ requestScope.currentPage }" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저관리</title>
<style type="text/css">
table {
	border-collapse: collapse;
	width: 1300px;
	margin: 1rem auto;
	background-color: white;
}

thead {
	box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.1);
}

/* 테이블 행 */
td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	text-align: center;
}

th {
	padding: 8px;
	text-align: left;
	text-align: center;
	border-top: 2px solid #000;
	border-bottom: 2px solid #000;
	color: #000;
}

/* 테이블 올렸을 때 */
tbody tr:not(#titlerow):hover {
	background-color: rgb(255, 221, 102);
	opacity: 0.9;
	cursor: pointer;
}

/* 테이블 비율 */
th:nth-child(1), td:nth-child(1) {
	width: 10%;
}

th:nth-child(2), td:nth-child(2) {
	width: 20%;
}

th:nth-child(3), td:nth-child(3) {
	width: 20%;
}

th:nth-child(4), td:nth-child(3) {
	width: 20%;
}

th:nth-child(5), td:nth-child(3) {
	width: 20%;
}

th:nth-child(6), td:nth-child(3) {
	width: 10%;
}

th, td {
	border-left: none;
	border-right: none;
}
/*목록*/
div.listdiv {
	height: 40px;
	width: 1300px;
	margin: 20px auto;
	display: flex;
	/* padding-left:400px; */
	justify-content: center;
	position: relative;
}

button.listbtn {
	position: absolute;
	right: 0;
}
/*검색창 CSS*/
input:-ms-input-placeholder {
	color: #a8a8a8;
}

input:-webkit-input-placeholder {
	color: #a8a8a8;
}

input:-moz-input-placeholder {
	color: #a8a8a8;
}

div.searchdiv {
	height: 80px;
	width: 1600px;
	margin: 20px auto;
	display: flex;
	/* padding-left:400px; */
	justify-content: center;
	position: relative;
}

input[type='date'] {
	height: 30px;
}

.searchdiv>button.writerB {
	position: absolute;
	right: 150px;
}

.searchdiv>form {
	width: 600px;
	height: 40px;
}

.searchdiv>input#searchtext {
	font-size: 16px;
	width: 325px;
	padding: 0px;
	border: 1px solid rgb(250, 180, 49);
	outline: none;
	float: left;
	height: 40px;
	margin-right: 2px;
}

.searchbtn {
	width: 100px;
	height: 40px;
	border: none;
	background: rgb(250, 180, 49);
	color: #ffffff;
	font-size: 16px;
}

button {
	width: 100px;
	height: 40px;
	border: none;
	background: rgb(250, 180, 49);
	color: #ffffff;
	font-size: 16px;
}
/*회원상세 css*/
/* 유저 정보 컨테이너 스타일 */
.user-info-container {
	background-color: #f2f2f2;
	padding: 80px;
	margin-top: 20px;
	max-width: 1300px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 20px;
	padding-right: 20px;
}

.user-info-parents {
	display: flex;
	justify-content: center;
	margin-top: 80px;
}

.user-info-section {
	width: 400px; /* 각 섹션의 너비 조정 */
	display: inline-block;
	vertical-align: top;
	margin-right: 2%;
	margin-bottom: 20px;
	padding: 100px;
}

.user-info-section ul {
	list-style-type: none;
	padding: 0;
	margin-top: 10px; /* 각 섹션 내용 위 여백 추가 */
}

.user-info-section ul li {
	font-family: sans-serif;
	font-size: 20px;
	margin: 30px;
}

.user-info-section ul li strong {
	font-weight: bold;
	margin-right: 5px;
}

.user-info-section ul li span {
	color: #666;
}

/* 결제 내역 및 정지 내역 컨테이너 스타일 */
.payment-history-container, .suspension-history-container {
	margin-top: 20px;
	margin-bottom: 20px; /* 결제 내역 및 정지 내역 섹션 위아래 여백 추가 */
	text-align: center; /* 섹션 제목 가운데 정렬 */
}

.payment-history-container table, .suspension-history-container table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

.payment-history-container th, .suspension-history-container th,
	.payment-history-container td, .suspension-history-container td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

.payment-history-container th, .suspension-history-container th {
	background-color: #f2f2f2;
	color: #333;
}

/* 계정 정지 버튼 스타일 */
.suspend-account-button {
	width: 100px;
	height: 40px;
	border: none;
	background: red;
	color: #ffffff;
	font-size: 16px;
	cursor: pointer;
	margin-top: 10px; /* 버튼 위 여백 추가 */
}

.suspend-account-button:hover {
	background: darkred;
}
.activate-account-button {
	width: 100px;
	height: 40px;
	border: none;
	background: rgb(0, 128, 0);
	color: #ffffff;
	font-size: 16px;
	cursor: pointer;
	margin-top: 10px; /* 버튼 위 여백 추가 */
}

.activate-account-button:hover {
	background: darkred;
}

/* 섹션 제목 가운데 정렬 */
.user-info-container h2, .payment-history-container h2,
	.suspension-history-container h2 {
	text-align: center;
}

.suspend-account-button:hover {
	background: darkred;
}
</style>
<script type="text/javascript"
	src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<hr>
	<br>
	<br>
	<div class="listdiv">
		<button class="listbtn"
			onclick="javascript:location.href='${pageContext.servletContext.contextPath}/ulist.do?page=1';">목록</button>
	</div>
	<table>
		<tr id="titlerow">
			<th>회원번호</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>상호명</th>
			<th>생년월일</th>
			<th>계정상태</th>
		</tr>
		<c:forEach items="${ requestScope.list }" var="u">
			<c:url var="ndetail" value="ndetail.do">
				<c:param name="nno" value="${ n.noticeNo }" />
				<c:param name="page" value="${ nowpage }" />
			</c:url>

			<tr onclick="showUserDetail('${u.userId}');">
				<td>${u.id}</td>
				<td>${u.userId }</td>
				<td>${u.email }</td>
				<td>${u.businessStoreName }</td>
				<td>${u.userNo }</td>
				<c:if test="${u.loginOk eq 'Y' }">
					<td>이용중</td>
				</c:if>
				<c:if test="${u.loginOk ne 'Y' }">
					<td>이용정지</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<div class="searchdiv">
		<form action="nsearch.do" method="get">
			<select style="height: 35px; width: 80px;" name="action"
				id="searchselect">
				<option value="title">제목</option>
				<option value="writer">작성자</option>
				<option id="date" value="date">날짜</option>
			</select> <input type="date" name="begin"> <input type="date"
				name="end"> <input style="height: 30px; width: 325px;"
				type="text" id="searchtext" name="keyword" placeholder="검색어 입력">
			<input type="submit" class="searchbtn" value="검색"> <br>
		</form>
	</div>
	<script type="text/javascript">
	 var suspendButton = $("<button class='suspend-account-button' onclick='suspendUser();'>계정 정지</button>");
	 var activationButton = $("<button class='activate-account-button' onclick='activateUser();'>계정 활성화</button>");
	function showUserDetail(id) {
	    $.ajax({
	        url: 'userManageDetail.do',
	        type: 'post', 
	        data: { userId : id },
	        dataType: "json",  
	        success: function(objUser) {
	            console.log('user : ' + objUser); 
	            
	            $('span#id').html(objUser.id);
	            $('span#userId').html(objUser.userId);
	            $('span#businessStoreName').html(decodeURIComponent(objUser.businessStoreName).replace(/\+/gi, " "));
	            $('span#phone').html(objUser.phone);
	            $('span#email').html(objUser.email);
	            $('span#userNo').html(objUser.userNo);
	            $('span#bankNameAndaccountNumber').html(objUser.bankName + " : " + objUser.accountNumber);
	            $('span#serviceDate').html("<br>"+objUser.serviceDate);
	            $('span#lastModified').html(objUser.lastModified);
	            if (objUser.loginOk == 'Y') {
	                // '계정 정지' 버튼을 생성하여 해당 요소에 추가
	                $('ul#userServiceList').append("<li id='buttonspace'>"+suspendButton+"</li>");
	            }else{
	            	$('ul#userServiceList').append("<li id='buttonspace'>"+activationButton+"</li>");
	            }
	          
	        },
	        error: function(request, status, errorData) {
	            console.log("error code : " + request.status
	                    + "\nMessage : " + request.responseText
	                    + "\nError : " + errorData);
	        }
	    });
	};
	function suspendUser(){
	    var userId = $('span#id').text(); // 사용자 ID 가져오기
	    $.ajax({
	        url: 'ususpend.do',
	        type: 'post', 
	        data: { Id : userId }, // 사용자 ID를 데이터로 전송
	        success: function(response) {
	            console.log('User suspended successfully');
	            $('li#buttonspace').html(activationButton);
	        },
	        error: function(request, status, errorData) {
	            console.log("Error: " + errorData);
	        }
	    });
	};
	function activateUser(){
	    var userId = $('span#id').text(); // 사용자 ID 가져오기
	    $.ajax({
	        url: 'uactivate.do',
	        type: 'post', 
	        data: { Id : userId }, // 사용자 ID를 데이터로 전송
	        success: function(response) {
	            console.log('User activated successfully');
	            $('li#buttonspace').html(suspendButton);
	        },
	        error: function(request, status, errorData) {
	            console.log("Error: " + errorData);
	        }
	    });
	};
	</script>
	<br>
	<c:import url="/WEB-INF/views/common/pagingView.jsp" />
	<br>
	<hr
		style="width: 50%; border-style: dotted; text-align: center; margin: 0px auto;">
	<div class="user-info-container">
		<h2>회원 정보</h2>
		<div class="user-info-parents">
			<div class="user-info-section">
				<ul>
					<li><strong>회원번호:</strong> <span id="id"></span></li>
					<li><strong>아이디:</strong> <span id="userId"></span></li>
					<li><strong>상호명:</strong> <span id="businessStoreName"></span></li>
					<li><strong>전화번호:</strong> <span id="phone"></span></li>
					<li><strong>이메일:</strong> <span id="email"></span></li>
					<li><strong>생년월일:</strong> <span id="userNo"></span></li>
				</ul>
			</div>
			<div class="user-info-section">
				<ul id="userServiceList">
					<li><strong>이용중인 서비스 기한:</strong> <span id="serviceDate"></span></li>
					<li><strong>등록 계좌:</strong> <span id="bankNameAndaccountNumber"></span></li>
					<li><strong>가입일시:</strong> <span id="lastModified"></span></li>		
				</ul>
			</div>
		</div>
		<!-- 두 번째 구역: 결제 내역 -->
		<div class="payment-history-container">
			<h2>결제 내역</h2>
			<table>
				<!-- 결제 내역 테이블 내용 추가 -->
			</table>
		</div>

		<!-- 세 번째 구역: 정지 내역 -->
		<div class="suspension-history-container">
			<h2>정지 내역</h2>
			<table>
				<!-- 정지 내역 테이블 내용 추가 -->
			</table>
		</div>
	</div>

	<hr>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>




