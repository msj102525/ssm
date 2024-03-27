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

			<form action="nwform.do" method="POST">
				<button name="write">게시판 작성</button>
			</form>


			<c:url var="nlist" value="nlist.do">
				<c:param name="page" value='${currentPage}' />
			</c:url>
			<button onclick="location.href='${nlist}';">목록으로</button>





			<form method='GET' action='fix_board.php'>
				<input type='hidden' name='board_id' value='".$row['board_id']."'>
				<button>게시물 수정</button>
			</form>

			<form method='POST' action='delete_board.php'>
				<input type='hidden' name='board_id' value='".$row['board_id']."'>
				<button>삭제</button>
			</form>

		</div>


	</div>
	<!--view-top의 div 종료점 입니다.-->
</body>
</html>
