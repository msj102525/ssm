<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/notice/noticeDetail.css">
<title>게시물 보는중</title>
</head>
<body>
	<h1>공지사항</h1>
	<div class="view-top">

		<div class="view-top-title">${notice.noticeTitle }</div>

		<div class="view-top2">
			<div>${notice.writer }</div>

			<div>조회수: ${notice.readCount }</div>

			<div>중요도: ${notice.importancy }</div>

			<div>Date: ${notice.writeDate }</div>
		</div>
		<hr>
		<div class="view-mid">${notice.noticeContent }</div>
		<hr>


		<div class="view-btn">


			<c:url var="nlist" value="nlist.do">
				<c:param name="page" value='${currentPage}' />
			</c:url>
			<button onclick="location.href='${nlist}';">목록으로</button>




			<c:if test="${sessionScope.loginUser.adminOk eq 'Y' }">
				<form method='GET' action='mvupdaten.do'>
					<input type='hidden' name='noticeNo' value='${notice.noticeNo}'>
					<input type='hidden' name='page' value='${currentPage }'>
					<button>게시물 수정</button>
				</form>

				<form method='POST' action='deleten.do'>
					<input type='hidden' name='noticeNo' value='${notice.noticeNo }'>
					<input type='hidden' name='page' value='${page }'>
					<button>삭제</button>
				</form>
			</c:if>
		</div>


	</div>
	<!--view-top의 div 종료점 입니다.-->
</body>
</html>
